

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
        toxicLabel.isHidden = true
        percentageArray.removeAll()
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
                toxicLabel.isHidden = true
            }
            else if (sender.tag == 2) {
                button.backgroundColor = (button === sender && sender.tag == 2) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 0
                supview.alpha = 1
                balview.alpha = 0
                toxicLabel.isHidden = true
            }
            else if (sender.tag == 3) {
                button.backgroundColor = (button === sender && sender.tag == 3) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 0
                supview.alpha = 0
                balview.alpha = 1
                toxicLabel.isHidden = false
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
            let entry1 = BarChartDataEntry(x: 17, yValues: [ rationArray[0] >= 150.0 ? 150.0: rationArray[0],
                                                            premixArray[0] >= 150.0 ? 150.0: premixArray[0],0])
            let entry2 = BarChartDataEntry(x: 16, yValues: [ rationArray[1] >= 150.0 ? 150.0: rationArray[1],
                                                            premixArray[1] >= 150.0 ? 150.0: premixArray[1],0])
            let entry3 = BarChartDataEntry(x: 15, yValues: [ rationArray[2] >= 150.0 ? 150.0: rationArray[2],
                                                            premixArray[2] >= 150.0 ? 150.0: premixArray[2],0])
            let entry4 = BarChartDataEntry(x: 14, yValues: [ rationArray[3] >= 150.0 ? 150.0: rationArray[3],
                                                            premixArray[3] >= 150.0 ? 150.0: premixArray[3],0])
            let entry5 = BarChartDataEntry(x: 13, yValues: [ rationArray[4] >= 150.0 ? 150.0: rationArray[4],
                                                            premixArray[4] >= 150.0 ? 150.0: premixArray[4],0])
            let entry6 = BarChartDataEntry(x: 12, yValues: [ rationArray[5] >= 150.0 ? 150.0: rationArray[5],
                                                            premixArray[5] >= 150.0 ? 150.0: premixArray[5],0])
            let entry7 = BarChartDataEntry(x: 11, yValues: [ rationArray[6] >= 150.0 ? 150.0: rationArray[6],
                                                            premixArray[6] >= 150.0 ? 150.0: premixArray[6],0])
            let entry8 = BarChartDataEntry(x: 10, yValues: [ rationArray[7] >= 150.0 ? 150.0: rationArray[7],
                                                            premixArray[7] >= 150.0 ? 150.0: premixArray[7],0])
            let entry9 = BarChartDataEntry(x: 9, yValues: [ rationArray[8] >= 150.0 ? 150.0: rationArray[8],
                                                            premixArray[8] >= 150.0 ? 150.0: premixArray[8],0])
            let entry10 = BarChartDataEntry(x: 8, yValues: [ rationArray[9] >= 150.0 ? 150.0: rationArray[9],
                                                             premixArray[9] >= 150.0 ? 150.0: premixArray[9],0])
            let entry11 = BarChartDataEntry(x: 7, yValues: [ rationArray[10] >= 150.0 ? 150.0: rationArray[10],
                                                              premixArray[10] >= 150.0 ? 150.0: premixArray[10],0])
            let entry12 = BarChartDataEntry(x: 6, yValues: [ rationArray[11] >= 150.0 ? 150.0: rationArray[11],
                                                              premixArray[11] >= 150.0 ? 150.0: premixArray[11],
                                                              waterArray[11] >= 150.0 ? 150.0: waterArray[11]])
            let entry13 = BarChartDataEntry(x: 5, yValues: [ rationArray[12] >= 150.0 ? 150.0: rationArray[12],
                                                              premixArray[12] >= 150.0 ? 150.0: premixArray[12],
                                                              waterArray[12] >= 150.0 ? 150.0: waterArray[12]])
            let entry14 = BarChartDataEntry(x: 4, yValues: [ rationArray[13] >= 150.0 ? 150.0: rationArray[13],
                                                              premixArray[13] >= 150.0 ? 150.0: premixArray[13],
                                                              waterArray[13] >= 150.0 ? 150.0: waterArray[13]])
            let entry15 = BarChartDataEntry(x: 3, yValues: [ rationArray[14] >= 150.0 ? 150.0: rationArray[14],
                                                              premixArray[14] >= 150.0 ? 150.0: premixArray[14],
                                                              waterArray[14] >= 150.0 ? 150.0: waterArray[14]])
            let entry16 = BarChartDataEntry(x: 2, yValues: [ rationArray[15] >= 150.0 ? 150.0: rationArray[15],
                                                              premixArray[15] >= 150.0 ? 150.0: premixArray[15],
                                                              waterArray[15] >= 150.0 ? 150.0: waterArray[15]])
            let entry17 = BarChartDataEntry(x: 1, yValues: [ rationArray[16] >= 150.0 ? 150.0: rationArray[16],
                                                              premixArray[16] >= 150.0 ? 150.0: premixArray[16],
                                                              waterArray[16] >= 150.0 ? 150.0: waterArray[16]])
            let entry18 = BarChartDataEntry(x: 0, yValues: [ rationArray[17] >= 150.0 ? 150.0: rationArray[17],
                                                              premixArray[17] >= 150.0 ? 150.0: premixArray[17],
                                                              waterArray[17] >= 150.0 ? 150.0: waterArray[17]])
            
            let dataSet = BarChartDataSet(entries: [ entry1, entry2,entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10, entry11, entry12, entry13, entry14, entry15, entry16, entry17, entry18 ], label: nil)
            dataSet.colors = [UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0), UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0), UIColor(red: 28/255, green: 115/255.0, blue: 193/255.0, alpha: 1.0)]
            let chartData = BarChartData(dataSet: dataSet)
            chartData.setDrawValues(false)
            barchartview.data = chartData
        } else {
            
            let entry1 = BarChartDataEntry(x: 17, yValues: [ Requirments.shared().rationArrayFinal[0] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[0],
                                                            Requirments.shared().primexArrayFinal[0] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[0],0])
            let entry2 = BarChartDataEntry(x: 16, yValues: [ Requirments.shared().rationArrayFinal[1] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[1],
                                                            Requirments.shared().primexArrayFinal[1] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[1],0])
            let entry3 = BarChartDataEntry(x: 15, yValues: [ Requirments.shared().rationArrayFinal[2] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[2],
                                                            Requirments.shared().primexArrayFinal[2] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[2],0])
            let entry4 = BarChartDataEntry(x: 14, yValues: [ Requirments.shared().rationArrayFinal[3] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[3],
                                                            Requirments.shared().primexArrayFinal[3] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[3],0])
            let entry5 = BarChartDataEntry(x: 13, yValues: [ Requirments.shared().rationArrayFinal[4] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[4],
                                                            Requirments.shared().primexArrayFinal[4] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[4],0])
            let entry6 = BarChartDataEntry(x: 12, yValues: [ Requirments.shared().rationArrayFinal[5] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[5],
                                                            Requirments.shared().primexArrayFinal[5] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[5],0])
            let entry7 = BarChartDataEntry(x: 11, yValues: [ Requirments.shared().rationArrayFinal[6] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[6],
                                                            Requirments.shared().primexArrayFinal[6] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[6],0])
            let entry8 = BarChartDataEntry(x: 10, yValues: [ Requirments.shared().rationArrayFinal[7] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[7],
                                                            Requirments.shared().primexArrayFinal[7] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[7],0])
            let entry9 = BarChartDataEntry(x: 9, yValues: [ Requirments.shared().rationArrayFinal[8] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[8],
                                                            Requirments.shared().primexArrayFinal[8] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[8],0])
            let entry10 = BarChartDataEntry(x: 8, yValues: [ Requirments.shared().rationArrayFinal[9] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[9],
                                                             Requirments.shared().primexArrayFinal[9] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[9],0])
            let entry11 = BarChartDataEntry(x: 7, yValues: [ Requirments.shared().rationArrayFinal[10] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[10],
                                                              Requirments.shared().primexArrayFinal[10] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[10],0])
            let entry12 = BarChartDataEntry(x: 6, yValues: [ Requirments.shared().rationArrayFinal[11] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[11],
                                                              Requirments.shared().primexArrayFinal[11] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[11],
                                                              Requirments.shared().waterArrayFinal[11] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[11]])
            let entry13 = BarChartDataEntry(x: 5, yValues: [ Requirments.shared().rationArrayFinal[12] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[12],
                                                              Requirments.shared().primexArrayFinal[12] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[12],
                                                              Requirments.shared().waterArrayFinal[12] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[12]])
            let entry14 = BarChartDataEntry(x: 4, yValues: [ Requirments.shared().rationArrayFinal[13] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[13],
                                                              Requirments.shared().primexArrayFinal[13] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[13],
                                                              Requirments.shared().waterArrayFinal[13] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[13]])
            let entry15 = BarChartDataEntry(x: 3, yValues: [ Requirments.shared().rationArrayFinal[14] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[14],
                                                              Requirments.shared().primexArrayFinal[14] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[14],
                                                              Requirments.shared().waterArrayFinal[14] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[14]])
            let entry16 = BarChartDataEntry(x: 2, yValues: [ Requirments.shared().rationArrayFinal[15] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[15],
                                                              Requirments.shared().primexArrayFinal[15] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[15],
                                                              Requirments.shared().waterArrayFinal[15] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[15]])
            let entry17 = BarChartDataEntry(x: 1, yValues: [ Requirments.shared().rationArrayFinal[16] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[16],
                                                              Requirments.shared().primexArrayFinal[16] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[16],
                                                              Requirments.shared().waterArrayFinal[16] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[16]])
            let entry18 = BarChartDataEntry(x: 0, yValues: [ Requirments.shared().rationArrayFinal[17] >= 150.0 ? 150.0: Requirments.shared().rationArrayFinal[17],
                                                              Requirments.shared().primexArrayFinal[17] >= 150.0 ? 150.0: Requirments.shared().primexArrayFinal[17],
                                                              Requirments.shared().waterArrayFinal[17] >= 150.0 ? 150.0: Requirments.shared().waterArrayFinal[17]])
            
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
    
//    func addGaugeView() {
//        // Vitamin A
//        // 0 , 1950
//        var xValue : Double = 0.0
//        var value13 : Double = percentageArray[0]
//        value13 = value13 / 1950
//        value13 = value13 * 100
//        if(value13 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value13
//        }
//        value13 = percentageArray[0].roundToDecimal(0)
//        var frame13 : CGRect = l14.frame
//        frame13.origin.x = CGFloat(xValue)
//        l14.frame = frame13
//        l14.text = String(value13)
//        var framepV14 : CGRect = pv14.frame
//        framepV14.origin.x = CGFloat(xValue)
//        pv14.frame = framepV14
//        let pg14 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv14.addSubview(pg14)
//        // Vit D
//        // 0 , 225
//        var value14 : Double = percentageArray[1]
//        value14 = value14 / 225
//        value14 = value14 * 100
//        if(value14 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value14
//        }
//        value14 = percentageArray[1].roundToDecimal(0)
//        var frame14 : CGRect = l15.frame
//        frame14.origin.x = CGFloat(xValue)
//        l15.frame = frame14
//        l15.text = String(value14)
//        var framepV15 : CGRect = pv15.frame
//        framepV15.origin.x = CGFloat(xValue)
//        pv15.frame = framepV15
//        let pg15 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv15.addSubview(pg15)
//        // Vitamin E
//        // 0 , 200
//        var value15 : Double = percentageArray[2]
//        value15 = value15 / 200
//        value15 = value15 * 100
//        if(value15 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value15
//        }
//        value15 = percentageArray[2].roundToDecimal(0)
//        var frame15 : CGRect = l16.frame
//        frame15.origin.x = CGFloat(xValue)
//        l16.frame = frame15
//        l16.text = String(value15)
//        var framepV16 : CGRect = pv16.frame
//        framepV16.origin.x = CGFloat(xValue)
//        pv16.frame = framepV16
//        let pg16 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv16.addSubview(pg16)
//        // Biotin
//        // 0 , 200
//        var value17 : Double = percentageArray[3]
//        value17 = value17 / 200
//        value17 = value17 * 100
//        if(value17 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value17
//        }
//        value17 = percentageArray[3].roundToDecimal(0)
//        var frame17 : CGRect = l18.frame
//        frame17.origin.x = CGFloat(xValue)
//        l18.frame = frame17
//        l18.text = String(value17)
//        var framepV18 : CGRect = pv18.frame
//        framepV18.origin.x = CGFloat(xValue)
//        pv18.frame = framepV18
//        let pg18 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv18.addSubview(pg18)
//        // Niacin
//        // 0 , 200
//        var value16 : Double = percentageArray[4]
//        value16 = value16 / 200
//        value16 = value16 * 100
//        if(value16 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value16
//        }
//        var frame16 : CGRect = l17.frame
//        frame16.origin.x = CGFloat(xValue)
//        l17.frame = frame16
//        value16 = percentageArray[4].roundToDecimal(0)
//        l17.text = String(value16)
//        var framepV17 : CGRect = pv17.frame
//        framepV17.origin.x = CGFloat(xValue)
//        pv17.frame = framepV17
//        let pg17 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv17.addSubview(pg17)
//        // Zinc
//        // 0 , 1125
//        var value12 : Double = percentageArray[5]
//        value12 = value12 / 1125
//        value12 = value12 * 100
//        if(value12 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value12
//        }
//        value12 = percentageArray[5].roundToDecimal(0)
//        var frame12 : CGRect = l3.frame
//        frame12.origin.x = CGFloat(xValue)
//        l13.frame = frame12
//        l13.text = String(value12)
//        var framepV13 : CGRect = pv13.frame
//        framepV13.origin.x = CGFloat(xValue)
//        pv13.frame = framepV13
//        let pg13 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv13.addSubview(pg13)
//        // Manganese
//        // 0 , 3750
//        var value10 : Double = percentageArray[6]
//        value10 = value10 / 3750
//        value10 = value10 * 100
//        if(value10 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value10
//        }
//        value10 = percentageArray[6].roundToDecimal(0)
//        var frame10 : CGRect = l11.frame
//        frame10.origin.x = CGFloat(xValue)
//        l11.frame = frame10
//        l11.text = String(value10)
//        var framepV11 : CGRect = pv11.frame
//        framepV11.origin.x = CGFloat(xValue)
//        pv11.frame = framepV11
//        let pg11 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv11.addSubview(pg11)
//        // Copper
//        // 0 , 375
//        var value8 : Double = percentageArray[7]
//        value8 = value8 / 375
//        value8 = value8 * 100
//        if(value8 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value8
//        }
//        value8 = percentageArray[7].roundToDecimal(0)
//        var frame8 : CGRect = l9.frame
//        frame8.origin.x = CGFloat(xValue)
//        l9.frame = frame8
//        l9.text = String(value8)
//        var framepV9 : CGRect = pv2.frame
//        framepV9.origin.x = CGFloat(xValue)
//        pv9.frame = framepV9
//        let pg9 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv9.addSubview(pg9)
//        // Selenium
//        // 0 , 1750
//        var value11 : Double = percentageArray[8]
//        value11 = value11 / 1750
//        value11 = value11 * 100
//        if(value11 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value11
//        }
//        value11 = percentageArray[8].roundToDecimal(0)
//        var frame11 : CGRect = l12.frame
//        frame11.origin.x = CGFloat(xValue)
//        l12.frame = frame11
//        l12.text = String(value11)
//        var framepV12 : CGRect = pv12.frame
//        framepV12.origin.x = CGFloat(xValue)
//        pv12.frame = framepV12
//        let pg12 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv12.addSubview(pg12)
//        // Iodine
//        // 0 , 1000
//        var value9 : Double = percentageArray[9]
//        value9 = value9 / 1000
//        value9 = value9 * 100
//        if(value9 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value9
//        }
//        value9 = percentageArray[9].roundToDecimal(0)
//        var frame9 : CGRect = l10.frame
//        frame9.origin.x = CGFloat(xValue)
//        l10.frame = frame9
//        l10.text = String(value9)
//        var framepV10 : CGRect = pv10.frame
//        framepV10.origin.x = CGFloat(xValue)
//        pv10.frame = framepV10
//        let pg10 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv10.addSubview(pg10)
//        // Cobalt
//        // 0 , 3750
//        var value7 : Double = percentageArray[10]
//        value7 = value7 / 3750
//        value7 = value7 * 100
//        if(value7 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value7
//        }
//        value7 = percentageArray[10].roundToDecimal(0)
//        var frame7 : CGRect = l8.frame
//        frame7.origin.x = CGFloat(xValue)
//        l8.frame = frame7
//        l8.text = String(value7)
//        var framepV8 : CGRect = pv8.frame
//        framepV8.origin.x = CGFloat(xValue)
//        pv8.frame = framepV8
//        let pg8 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv8.addSubview(pg8)
//        // Ca
//        // 0 , 500
//        var value1 : Double = percentageArray[11]
//        value1 = value1 / 500
//        value1 = value1 * 100
//        if(value1 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value1
//        }
//        value1 = percentageArray[11].roundToDecimal(0)
//        var frame1 : CGRect = l2.frame
//        frame1.origin.x = CGFloat(xValue)
//        l2.frame = frame1
//        l2.text = String(value1)
//        var framepV2 : CGRect = pv2.frame
//        framepV2.origin.x = CGFloat(xValue)
//        pv2.frame = framepV2
//        let pg2 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv2.addSubview(pg2)
//        // Pa
//        // 0 , 225
//        var value : Double = percentageArray[12]
//        value = value / 225
//        value = value * 100
//        if(value > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value
//        }
//        value = percentageArray[12].roundToDecimal(0)
//        var frame : CGRect = l1.frame
//        frame.origin.x = CGFloat(xValue)
//        l1.frame = frame
//        l1.text = String(value)
//        var framepV1 : CGRect = pV1.frame
//        framepV1.origin.x = CGFloat(xValue)
//        pV1.frame = framepV1
//        let pg = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pV1.addSubview(pg)
//        // Chloride
//        // 0 , 1625
//        var value2 : Double = percentageArray[13]
//        value2 = value2 / 1625
//        value2 = value2 * 100
//        if(value2 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value2
//        }
//        value2 = percentageArray[13].roundToDecimal(0)
//        var frame2 : CGRect = l3.frame
//        frame2.origin.x = CGFloat(xValue)
//        l3.frame = frame2
//        l3.text = String(value2)
//        var framepV3 : CGRect = pv3.frame
//        framepV3.origin.x = CGFloat(xValue)
//        pv3.frame = framepV3
//        let pg3 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv3.addSubview(pg3)
//        // Sodium
//        // 0 , 500
//        var value4 : Double = percentageArray[14]
//        value4 = value4 / 500
//        value4 = value4 * 100
//        if(value4 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value4
//        }
//        value4 = percentageArray[14].roundToDecimal(0)
//        var frame4 : CGRect = l5.frame
//        frame4.origin.x = CGFloat(xValue)
//        l5.frame = frame4
//        l5.text = String(value4)
//        var framepV5 : CGRect = pv5.frame
//        framepV5.origin.x = CGFloat(xValue)
//        pv5.frame = framepV5
//        let pg5 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv5.addSubview(pg5)
//        // Mg
//        // 0 , 1375
//        var value5 : Double = percentageArray[15]
//        value5 = value5 / 1375
//        value5 = value5 * 100
//        if(value5 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value5
//        }
//        value5 = percentageArray[15].roundToDecimal(0)
//        var frame5 : CGRect = l6.frame
//        frame5.origin.x = CGFloat(xValue)
//        l6.frame = frame5
//        l6.text = String(value5)
//        var framepV6 : CGRect = pv6.frame
//        framepV6.origin.x = CGFloat(xValue)
//        pv6.frame = framepV6
//        let pg6 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv6.addSubview(pg6)
//        // Sulfur
//        // 0 , 200
//        var value6 : Double = percentageArray[16]
//        value6 = value6 / 200
//        value6 = value6 * 100
//        if(value6 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value6
//        }
//        value6 = percentageArray[16].roundToDecimal(0)
//        var frame6 : CGRect = l7.frame
//        frame6.origin.x = CGFloat(xValue)
//        l7.frame = frame6
//        l7.text = String(value6)
//        var framepV7 : CGRect = pv7.frame
//        framepV7.origin.x = CGFloat(xValue)
//        pv7.frame = framepV7
//        let pg7 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv7.addSubview(pg7)
//        // Potassium
//        // 0 , 400
//        var value3 : Double = percentageArray[17]
//        value3 = value3 / 400
//        value3 = value3 * 100
//        if(value3 > 89.0) {
//            xValue = 260
//        } else {
//            xValue = 3 * value3
//        }
//        value3 = percentageArray[17].roundToDecimal(0)
//        var frame3 : CGRect = l4.frame
//        frame3.origin.x = CGFloat(xValue)
//        l4.frame = frame3
//        l4.text = String(value3)
//        var framepV4 : CGRect = pv4.frame
//        framepV4.origin.x = CGFloat(xValue)
//        pv4.frame = framepV4
//        let pg4 = PentagonView(frame:CGRect(x:0, y:0, width:30, height:25))
//        self.pv4.addSubview(pg4)
//    }
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
}

