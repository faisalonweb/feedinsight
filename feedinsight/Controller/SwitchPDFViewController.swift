

import UIKit
import Charts
import QuartzCore

var fromDatabase : String = ""
var premixArray = [Double]()
var waterArray = [Double]()
var requiredArray = [Double]()
var rationArray = [Double]()

class SwitchPDFViewController: UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet var buttonsOutlets: [UIButton]!
    @IBOutlet weak var review: UIView!
    @IBOutlet weak var supview: UIView!
    @IBOutlet weak var balview: UIView!
    @IBOutlet weak var barchartview: HorizontalBarChartView!
    @IBOutlet weak var reqtblview: UITableView!
    @IBOutlet weak var supplytblview: UITableView!
    @IBOutlet weak var balancetblview: UITableView!
    @IBOutlet weak var gaugeView: UIView!
    @IBOutlet weak var viewRound: UIView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var ruminantType: UILabel!
    @IBOutlet weak var animalGroup: UILabel!
    @IBOutlet weak var psciState: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var referenceLabel: UILabel!
    @IBOutlet weak var preparedByLabel: UILabel!
    @IBOutlet weak var reportType: UILabel!
    @IBOutlet weak var magOrganic: UILabel!
    @IBOutlet weak var magInorganic: UILabel!
    @IBOutlet weak var magCurrentRatio: UILabel!
    @IBOutlet weak var magRecomRatio: UILabel!
    @IBOutlet weak var selOrganic: UILabel!
    @IBOutlet weak var selInOrganic: UILabel!
    @IBOutlet weak var selCurrentRatio: UILabel!
    @IBOutlet weak var selRecomRatio: UILabel!
    @IBOutlet weak var coOrganic: UILabel!
    @IBOutlet weak var coInOrganic: UILabel!
    @IBOutlet weak var coCurrentRatio: UILabel!
    @IBOutlet weak var coRecomRatio: UILabel!
    @IBOutlet weak var znOrganic: UILabel!
    @IBOutlet weak var znInorganic: UILabel!
    @IBOutlet weak var znCurrentRatio: UILabel!
    @IBOutlet weak var znRecomRatio: UILabel!
    @IBOutlet weak var toxicLabel: UILabel!
    
    // labels outlets

    let defaults = UserDefaults(suiteName:"User")
    var reportName : String = ""
    var reportDate : String = ""
    var companystr1 : String = ""
    var animalgroupstr2 : String = ""
    var datestr3 : String = ""
    var referncestr4 : String = ""
    var ruminanttypestr5 : String = ""
    var preparedbystr6 : String = ""
    var reporttypestr7 : String = ""
    var pscistatestr8 : String = ""
    
    
    let players = ["K","S","Cl","Na","Mg","P", "Ca","Co","I","Se","Cu","Mn","Zn","Niacin","Biotin","Vit. E","Vit. D3","Vit. A"]
//    @objc func addNewGuageView(_ notification: Notification) {
//        self.addGaugeView()
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fromDatabase = ""
        premixArray.removeAll()
        waterArray.removeAll()
        requiredArray.removeAll()
        rationArray.removeAll()
    }
    
    override func viewDidLoad() {
        percentageArray.removeAll()
        toxicLabel.text = "      * = Absorable Value"
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
        super.viewDidLoad()
        review.alpha = 1
        supview.alpha = 0
        balview.alpha = 0
        // Set Data
        barchartview.animate(yAxisDuration: 1.0)
        barchartview.pinchZoomEnabled = false
        barchartview.drawBarShadowEnabled = false
        barchartview.drawBordersEnabled = false
        barchartview.doubleTapToZoomEnabled = false
        barchartview.drawGridBackgroundEnabled = true
        barchartview.chartDescription?.text = "Bar Chart View"
        if(fromDatabase == "yes") {
            self.companyName.text = companystr1
            self.ruminantType.text = ruminanttypestr5
            self.animalGroup.text = animalgroupstr2
            self.psciState.text = pscistatestr8
            self.reportType.text = reporttypestr7
            self.dateLabel.text = datestr3
            self.referenceLabel.text = referncestr4
            self.preparedByLabel.text = preparedbystr6
            setChart(dataPoints: players, values: rationArray.map { Double($0) })
        } else {
            self.companyName.text = Requirments.shared().companyName
            self.ruminantType.text = Requirments.shared().animalKind
            self.animalGroup.text = Requirments.shared().animalGroup
            self.psciState.text = Requirments.shared().physiologicalState
            self.reportType.text = "Premix Check"
            self.dateLabel.text = self.reportDate
            self.referenceLabel.text = self.reportName
            if let userName = defaults!.value(forKey: "usernameStringKey"){
                self.preparedByLabel.text = userName as? String
            }
            setChart(dataPoints: players, values: Requirments.shared().rationArrayFinal.map { Double($0) })
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.view.bounds, nil)
        UIGraphicsBeginPDFPage()
        let pdfContext = UIGraphicsGetCurrentContext()
        if let pdfContext = pdfContext {
            self.view.layer.render(in: pdfContext)
        }
        UIGraphicsEndPDFContext()
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).map(\.path)
        let documentDirectory = documentDirectories[0]
        let documentDirectoryFilename = URL(fileURLWithPath: documentDirectory).appendingPathComponent("testingPdfCheck.pdf").path
        NSData(data: pdfData as Data).write(toFile: documentDirectoryFilename, atomically: true)

    }
    @IBAction func buttonAction(_ sender: UIButton) {
        self.buttonsOutlets.forEach { (button) in
            if (sender.tag == 1) {
                button.backgroundColor = (button === sender && sender.tag == 1) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 1
                supview.alpha = 0
                balview.alpha = 0
                toxicLabel.text = "      * = Absorable Value"
            }
            else if (sender.tag == 2) {
                button.backgroundColor = (button === sender && sender.tag == 2) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 0
                supview.alpha = 1
                balview.alpha = 0
                toxicLabel.text = "      * = Absorable Value"
            }
            else if (sender.tag == 3) {
                button.backgroundColor = (button === sender && sender.tag == 3) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 0
                supview.alpha = 0
                balview.alpha = 1
                toxicLabel.text = "      ! = Toxic      < 100 = Deficient      * = Absorable Value"
            }
        }
        
    }
    func setChart(dataPoints: [String], values: [Double]) {
        barchartview.noDataText = "You need to provide data for the chart."
        barchartview.xAxis.setLabelCount(18, force: false)
        barchartview.xAxis.valueFormatter = IndexAxisValueFormatter(values: players)
        barchartview.xAxis.labelPosition = .bottom
        let limitLine = ChartLimitLine(limit: 100, label: "")
        limitLine.lineColor = UIColor(red: 237/255, green: 189/255, blue: 51/255, alpha: 0.76)
        limitLine.lineWidth = 4
        barchartview.rightAxis.addLimitLine(limitLine)
        barchartview.leftAxis.drawZeroLineEnabled = false
        barchartview.rightAxis.drawZeroLineEnabled = false
        
        barchartview.leftAxis.enabled = false
        barchartview.rightAxis.enabled = true
        
        barchartview.rightAxis.granularity = 0.1
        barchartview.xAxis.granularity = 0.1
        barchartview.isUserInteractionEnabled = false
        guard let description = barchartview.chartDescription else {return}
        description.text = ""
        barchartview.leftAxis.drawGridLinesEnabled = true
        barchartview.xAxis.drawGridLinesEnabled = true
        barchartview.rightAxis.drawGridLinesEnabled = false
        
        if(fromDatabase == "yes") {
            let entry1 = BarChartDataEntry(x: 17, yValues: [ ((rationArray[0] / requiredArray[0]) * 100) >= 150.0 ? 150.0: ((rationArray[0] / requiredArray[0]) * 100),
                                                             ((premixArray[0] / requiredArray[0]) * 100) >= 150.0 ? 150.0: ((premixArray[0] / requiredArray[0]) * 100),0])
            let entry2 = BarChartDataEntry(x: 16, yValues: [ ((rationArray[1] / requiredArray[1]) * 100) >= 150.0 ? 150.0: ((rationArray[1] / requiredArray[1]) * 100),
                                                             ((premixArray[1] / requiredArray[1]) * 100) >= 150.0 ? 150.0: ((premixArray[1] / requiredArray[1]) * 100),0])
            let entry3 = BarChartDataEntry(x: 15, yValues: [ ((rationArray[2] / requiredArray[2]) * 100) >= 150.0 ? 150.0: ((rationArray[2] / requiredArray[2]) * 100),
                                                             ((premixArray[2] / requiredArray[2]) * 100) >= 150.0 ? 150.0: ((premixArray[2] / requiredArray[2]) * 100),0])
            let entry4 = BarChartDataEntry(x: 14, yValues: [ ((rationArray[3] / requiredArray[3]) * 100) >= 150.0 ? 150.0: ((rationArray[3] / requiredArray[3]) * 100),
                                                             ((premixArray[3] / requiredArray[3]) * 100) >= 150.0 ? 150.0: ((premixArray[3] / requiredArray[3]) * 100),0])
            let entry5 = BarChartDataEntry(x: 13, yValues: [ ((rationArray[4] / requiredArray[4]) * 100) >= 150.0 ? 150.0: ((rationArray[4] / requiredArray[4]) * 100),
                                                             ((premixArray[4] / requiredArray[4]) * 100) >= 150.0 ? 150.0: ((premixArray[4] / requiredArray[4]) * 100),0])
            let entry6 = BarChartDataEntry(x: 12, yValues: [ ((rationArray[5] / requiredArray[5]) * 100) >= 150.0 ? 150.0: ((rationArray[5] / requiredArray[5]) * 100),
                                                             ((premixArray[5] / requiredArray[5]) * 100) >= 150.0 ? 150.0: ((premixArray[5] / requiredArray[5]) * 100),0])
            let entry7 = BarChartDataEntry(x: 11, yValues: [ ((rationArray[6] / requiredArray[6]) * 100) >= 150.0 ? 150.0: ((rationArray[6] / requiredArray[6]) * 100),
                                                             ((premixArray[6] / requiredArray[6]) * 100) >= 150.0 ? 150.0: ((premixArray[6] / requiredArray[6]) * 100),0])
            let entry8 = BarChartDataEntry(x: 10, yValues: [ ((rationArray[7] / requiredArray[7]) * 100) >= 150.0 ? 150.0: ((rationArray[7] / requiredArray[7]) * 100),
                                                             ((premixArray[7] / requiredArray[7]) * 100) >= 150.0 ? 150.0: ((premixArray[7] / requiredArray[7]) * 100),0])
            let entry9 = BarChartDataEntry(x: 9, yValues: [  ((rationArray[8] / requiredArray[8]) * 100) >= 150.0 ? 150.0: ((rationArray[8] / requiredArray[8]) * 100),
                                                             ((premixArray[8] / requiredArray[8]) * 100) >= 150.0 ? 150.0: ((premixArray[8] / requiredArray[8]) * 100),0])
            let entry10 = BarChartDataEntry(x: 8, yValues: [ ((rationArray[9] / requiredArray[9]) * 100) >= 150.0 ? 150.0: ((rationArray[9] / requiredArray[9]) * 100),
                                                             ((premixArray[9] / requiredArray[9]) * 100) >= 150.0 ? 150.0: ((premixArray[9] / requiredArray[9]) * 100),0])
            let entry11 = BarChartDataEntry(x: 7, yValues: [ ((rationArray[10] / requiredArray[10]) * 100) >= 150.0 ? 150.0: ((rationArray[10] / requiredArray[10]) * 100),
                                                             ((premixArray[10] / requiredArray[10]) * 100) >= 150.0 ? 150.0: ((premixArray[10] / requiredArray[10]) * 100),0])
            
            
            let entry12 = BarChartDataEntry(x: 6, yValues: [ ((rationArray[11] / requiredArray[11]) * 100) >= 150.0 ? 150.0: ((rationArray[11] / requiredArray[11]) * 100),
                                                             ((premixArray[11] / requiredArray[11]) * 100) >= 150.0 ? 150.0: ((premixArray[11] / requiredArray[11]) * 100),
                                                             ((waterArray[11] / requiredArray[11]) * 100) >= 150.0 ? 150.0: ((waterArray[11] / requiredArray[11]) * 100)])
            let entry13 = BarChartDataEntry(x: 5, yValues: [ ((rationArray[12] / requiredArray[12]) * 100) >= 150.0 ? 150.0: ((rationArray[12] / requiredArray[12]) * 100),
                                                             ((premixArray[12] / requiredArray[12]) * 100) >= 150.0 ? 150.0: ((premixArray[12] / requiredArray[12]) * 100),
                                                             ((waterArray[12] / requiredArray[12]) * 100) >= 150.0 ? 150.0: ((waterArray[12] / requiredArray[12]) * 100)])
            let entry14 = BarChartDataEntry(x: 4, yValues: [ ((rationArray[13] / requiredArray[13]) * 100) >= 150.0 ? 150.0: ((rationArray[13] / requiredArray[13]) * 100),
                                                             ((premixArray[13] / requiredArray[13]) * 100) >= 150.0 ? 150.0: ((premixArray[13] / requiredArray[13]) * 100),
                                                             ((waterArray[13] / requiredArray[13]) * 100) >= 150.0 ? 150.0: ((waterArray[13] / requiredArray[13]) * 100)])
            let entry15 = BarChartDataEntry(x: 3, yValues: [ ((rationArray[14] / requiredArray[14]) * 100) >= 150.0 ? 150.0: ((rationArray[14] / requiredArray[14]) * 100),
                                                             ((premixArray[14] / requiredArray[14]) * 100) >= 150.0 ? 150.0: ((premixArray[14] / requiredArray[14]) * 100),
                                                             ((waterArray[14] / requiredArray[14]) * 100) >= 150.0 ? 150.0: ((waterArray[14] / requiredArray[14]) * 100)])
            let entry16 = BarChartDataEntry(x: 2, yValues: [ ((rationArray[15] / requiredArray[15]) * 100) >= 150.0 ? 150.0: ((rationArray[15] / requiredArray[15]) * 100),
                                                             ((premixArray[15] / requiredArray[15]) * 100) >= 150.0 ? 150.0: ((premixArray[15] / requiredArray[15]) * 100),
                                                             ((waterArray[15] / requiredArray[15]) * 100) >= 150.0 ? 150.0: ((waterArray[15] / requiredArray[15]) * 100)])
            let entry17 = BarChartDataEntry(x: 1, yValues: [ ((rationArray[16] / requiredArray[16]) * 100) >= 150.0 ? 150.0: ((rationArray[16] / requiredArray[16]) * 100),
                                                             ((premixArray[16] / requiredArray[16]) * 100) >= 150.0 ? 150.0: ((premixArray[16] / requiredArray[16]) * 100),
                                                             ((waterArray[16] / requiredArray[16]) * 100) >= 150.0 ? 150.0: ((waterArray[16] / requiredArray[16]) * 100)])
            let entry18 = BarChartDataEntry(x: 0, yValues: [ ((rationArray[17] / requiredArray[17]) * 100) >= 150.0 ? 150.0: ((rationArray[17] / requiredArray[17]) * 100),
                                                             ((premixArray[17] / requiredArray[17]) * 100) >= 150.0 ? 150.0: ((premixArray[17] / requiredArray[17]) * 100),
                                                             ((waterArray[17] / requiredArray[17]) * 100) >= 150.0 ? 150.0: ((waterArray[17] / requiredArray[17]) * 100)])
            
            let dataSet = BarChartDataSet(entries: [ entry1, entry2,entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10, entry11, entry12, entry13, entry14, entry15, entry16, entry17, entry18 ], label: nil)
            dataSet.colors = [UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0), UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0), UIColor(red: 28/255, green: 115/255.0, blue: 193/255.0, alpha: 1.0)]
            let chartData = BarChartData(dataSet: dataSet)
            chartData.setDrawValues(false)
            barchartview.data = chartData
        } else {
            
            let entry1 = BarChartDataEntry(x: 17, yValues: [ ((Requirments.shared().rationArrayFinal[0] / Requirments.shared().reqArrayFinal[0]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[0] / Requirments.shared().reqArrayFinal[0]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[0] / Requirments.shared().reqArrayFinal[0]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[0] / Requirments.shared().reqArrayFinal[0]) * 100),0])
            
            
            
            let entry2 = BarChartDataEntry(x: 16, yValues: [ ((Requirments.shared().rationArrayFinal[1] / Requirments.shared().reqArrayFinal[1]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[1] / Requirments.shared().reqArrayFinal[1]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[1] / Requirments.shared().reqArrayFinal[1]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[1] / Requirments.shared().reqArrayFinal[1]) * 100),0])
            
            
            
            
            
            let entry3 = BarChartDataEntry(x: 15, yValues: [ ((Requirments.shared().rationArrayFinal[2] / Requirments.shared().reqArrayFinal[2]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[2] / Requirments.shared().reqArrayFinal[2]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[2] / Requirments.shared().reqArrayFinal[2]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[2] / Requirments.shared().reqArrayFinal[2]) * 100),0])
            
            
            
            
            
            let entry4 = BarChartDataEntry(x: 14, yValues: [ ((Requirments.shared().rationArrayFinal[3] / Requirments.shared().reqArrayFinal[3]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[3] / Requirments.shared().reqArrayFinal[3]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[3] / Requirments.shared().reqArrayFinal[3]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[3] / Requirments.shared().reqArrayFinal[3]) * 100),0])
            
            
            
            
            
            let entry5 = BarChartDataEntry(x: 13, yValues: [ ((Requirments.shared().rationArrayFinal[4] / Requirments.shared().reqArrayFinal[4]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[4] / Requirments.shared().reqArrayFinal[4]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[4] / Requirments.shared().reqArrayFinal[4]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[4] / Requirments.shared().reqArrayFinal[4]) * 100),0])
            
            
            
            
            
            let entry6 = BarChartDataEntry(x: 12, yValues: [ ((Requirments.shared().rationArrayFinal[5] / Requirments.shared().reqArrayFinal[5]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[5] / Requirments.shared().reqArrayFinal[5]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[5] / Requirments.shared().reqArrayFinal[5]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[5] / Requirments.shared().reqArrayFinal[5]) * 100),0])
            
            
            
            
            let entry7 = BarChartDataEntry(x: 11, yValues: [ ((Requirments.shared().rationArrayFinal[6] / Requirments.shared().reqArrayFinal[6]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[6] / Requirments.shared().reqArrayFinal[6]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[6] / Requirments.shared().reqArrayFinal[6]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[6] / Requirments.shared().reqArrayFinal[6]) * 100),0])
            
            
            
            
            
            let entry8 = BarChartDataEntry(x: 10, yValues: [ ((Requirments.shared().rationArrayFinal[7] / Requirments.shared().reqArrayFinal[7]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[7] / Requirments.shared().reqArrayFinal[7]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[7] / Requirments.shared().reqArrayFinal[7]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[7] / Requirments.shared().reqArrayFinal[7]) * 100),0])
            
            
            
            
            
            let entry9 = BarChartDataEntry(x: 9, yValues: [ ((Requirments.shared().rationArrayFinal[8] / Requirments.shared().reqArrayFinal[8]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[8] / Requirments.shared().reqArrayFinal[8]) * 100),
                                                            ((Requirments.shared().primexArrayFinal[8] / Requirments.shared().reqArrayFinal[8]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[8] / Requirments.shared().reqArrayFinal[8]) * 100),0])
            
            
            
            
            
            let entry10 = BarChartDataEntry(x: 8, yValues: [ ((Requirments.shared().rationArrayFinal[9] / Requirments.shared().reqArrayFinal[9]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[9] / Requirments.shared().reqArrayFinal[9]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[9] / Requirments.shared().reqArrayFinal[9]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[9] / Requirments.shared().reqArrayFinal[9]) * 100),0])
            
            
            
            
            
            let entry11 = BarChartDataEntry(x: 7, yValues: [ ((Requirments.shared().rationArrayFinal[10] / Requirments.shared().reqArrayFinal[10]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[10] / Requirments.shared().reqArrayFinal[10]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[10] / Requirments.shared().reqArrayFinal[10]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[10] / Requirments.shared().reqArrayFinal[10]) * 100),0])
            
            
            
            
            
            let entry12 = BarChartDataEntry(x: 6, yValues: [ ((Requirments.shared().rationArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100)])
            
            
            
            
            
            let entry13 = BarChartDataEntry(x: 5, yValues: [ ((Requirments.shared().rationArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100)])
            
            
            
            
            
            let entry14 = BarChartDataEntry(x: 4, yValues: [ ((Requirments.shared().rationArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100)])
            
            
            
            
            let entry15 = BarChartDataEntry(x: 3, yValues: [ ((Requirments.shared().rationArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100)])
            
            
            
            
            
            let entry16 = BarChartDataEntry(x: 2, yValues: [ ((Requirments.shared().rationArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100)])
            
            
            
            
            let entry17 = BarChartDataEntry(x: 1, yValues: [ ((Requirments.shared().rationArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100)])
            
            
            
            
            
            let entry18 = BarChartDataEntry(x: 0, yValues: [ ((Requirments.shared().rationArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().rationArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().primexArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100),
                                                             ((Requirments.shared().waterArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100) >= 150.0 ? 150.0: ((Requirments.shared().waterArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100)])
            
            let dataSet = BarChartDataSet(entries: [ entry1, entry2,entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10, entry11, entry12, entry13, entry14, entry15, entry16, entry17, entry18 ], label: nil)
            dataSet.colors = [UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0), UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0), UIColor(red: 28/255, green: 115/255.0, blue: 193/255.0, alpha: 1.0)]
            let chartData = BarChartData(dataSet: dataSet)
            chartData.setDrawValues(false)
            barchartview.data = chartData
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        percentageArray.removeAll()
        fromDatabase = ""
        premixArray.removeAll()
        waterArray.removeAll()
        requiredArray.removeAll()
        rationArray.removeAll()
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
}

