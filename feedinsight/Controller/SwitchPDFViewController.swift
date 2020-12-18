

import UIKit
import Charts
import QuartzCore
import MessageUI
import SwiftMessages
import PDFKit
var fromDatabase : String = ""
var premixArray = [Double]()
var waterArray = [Double]()
var requiredArray = [Double]()
var rationArray = [Double]()
var Originalwaterarray = [String]()
var Originalpremixarray = [String]()
var Originaldropdownvalues = [String]()
var OriginaldropdownfloatValue = [String]()


var totalCellCreatedCount = 0
var names = [] as [String]

var addresses = [] as [String]

struct TableDataItem {
    let name: String
    let address: String

    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

class SwitchPDFViewController: UIViewController, UIGestureRecognizerDelegate, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var debLabel: UILabel!
    @IBOutlet weak var dcabLabel: UILabel!
    @IBOutlet weak var n1: UIView!
    @IBOutlet weak var n2: UIView!
    @IBOutlet weak var scrillviewoutlet: UIScrollView!
    @IBOutlet weak var footerView: UIView!
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
    @IBOutlet weak var milkProductionTargetLabel: UILabel!
    
    // labels outlets
    
    var pdfView: PDFView!
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
    var shareVariable : String = ""
    
    var companyName1 : String = ""
    var animalGroup1 : String = ""
    var physiologicalState1 : String = ""
    var currentBodyWeight1 : String = ""
    var targetBodyWeight1 : String = ""
    var achieveTargetWeight1 : String = ""
    var daysInMilk1  : String = ""
    var daysPregnant1 : String = ""
    var milkProduction1 : String = ""
    var animalKind1 : String = ""
    var heatStress1 : String = ""
    var metaBolic1 : String = ""
    var anionic1 : String = ""
    var woolProduction1 : String = ""
    
    let players = ["K","S","Cl","Na","Mg","P", "Ca","Co","I","Se","Cu","Mn","Zn","Niacin","Biotin","Vit. E","Vit. D3","Vit. A"]
//    @objc func addNewGuageView(_ notification: Notification) {
//        self.addGaugeView()
//    }
    
    override func viewDidDisappear(_ animated: Bool) {
        fromDatabase = ""
        premixArray.removeAll()
        waterArray.removeAll()
        requiredArray.removeAll()
        rationArray.removeAll()
        Originaldropdownvalues.removeAll()
        OriginaldropdownfloatValue.removeAll()
        Originalwaterarray.removeAll()
        Originalpremixarray.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("21")
    }
    override func viewDidLoad() {
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
        barchartview.pinchZoomEnabled = true
        barchartview.drawBarShadowEnabled = false
        barchartview.drawBordersEnabled = false
        barchartview.doubleTapToZoomEnabled = true
        barchartview.drawGridBackgroundEnabled = true
        barchartview.chartDescription?.text = "Bar Chart View"
        names.removeAll()
        names = ["General Data",
                 
                 "Company Name",
                 "Animal Group",
                 "Physiological State",
                 "Current Body Weight (kg)",
                 "Target Body Weight (kg)",
                 "Days to achieve target body weight",
                 "Days in milk", "Days Pregnant",
                 "Milk Production (kg)",
                 "Animal Kind",
                 "Heat Stress",
                 "Metabolic Disorders",
                 "Formulate Anionic Diet?",
                 "Wool Production",
                 
                 "Water (mg/Lit)",
                 
                 "Ca*",
                 "P*",
                 "Mg*",
                 "Na",
                 "Cl",
                 "S",
                 "K",
                 
                 "Premix (kg)",
                 "Dosage",
                 "P*",
                 "Ca*",
                 "Mg*",
                 "K",
                 "Na",
                 "Cl",
                 "S",
                 "I",
                 "Co",
                 "Cu (Inorganic)",
                 "Cu (Organic)",
                 "Mn (Inorganic)",
                 "Mn (Organic)",
                 "Se (Inorganic)",
                 "Se (Organic)",
                 "Zn (Inorganic)",
                 "Zn (Organic)",
                 "Vitamin A",
                 "Vitamin D",
                 "Vitamin E",
                 "Niacin",
                 "Biotin",
                 
                 "Ration (kg)",
                 "DMI",
        ]
        toxicLabel.text = "      * - Absorable Value"
        self.debLabel.text = Requirments.shared().deb ?? "0.0"
        self.dcabLabel.text = Requirments.shared().dcab ?? "0.0"
        if(fromDatabase == "yes") {
            let milkProduction = Double(milkProduction1) ?? 0.0
            if(milkProduction <= 0.0) {
                self.milkProductionTargetLabel.text = "Target"
            } else {
                self.milkProductionTargetLabel.text = "\(milkProduction1) Kg Target"
            }
            addresses.removeAll()
            names.append(contentsOf: Originaldropdownvalues)
            addresses = [" ",
                         companyName1,
                         animalGroup1,
                         physiologicalState1,
                         currentBodyWeight1,
                         targetBodyWeight1,
                         achieveTargetWeight1 ,
                         daysInMilk1,
                         daysPregnant1,
                         milkProduction1,
                         animalKind1,
                         heatStress1,
                         metaBolic1,
                         anionic1,
                         woolProduction1,
                        " ",
            ] as [String]
            addresses.append(contentsOf: Originalwaterarray)
            addresses.append(" ")
            addresses.append(Requirments.shared().dosageFromDatabase ?? "0.0")
            addresses.append(contentsOf: Originalpremixarray)
            addresses.append(" ")
            addresses.append(Requirments.shared().dmiFromDatabase ?? "0.0")
            addresses.append(contentsOf: OriginaldropdownfloatValue)
            self.companyName.text = "Company : " + companystr1
            self.ruminantType.text = "Type : " + ruminanttypestr5
            self.animalGroup.text = "Group : " + animalgroupstr2
            self.psciState.text = "Physiological State : " + pscistatestr8
            self.reportType.text = reporttypestr7
            self.dateLabel.text = datestr3
            self.referenceLabel.text = referncestr4
            self.preparedByLabel.text = preparedbystr6
            setChart(dataPoints: players, values: rationArray.map { Double($0) })
        } else {
            let milkProduction = Double(Requirments.shared().milkProduction ?? "0.0") ?? 0.0
            if(milkProduction <= 0.0) {
                self.milkProductionTargetLabel.text = "Target"
            } else {
                self.milkProductionTargetLabel.text = "\(milkProduction) Kg Target"
            }
            names.append(contentsOf: dropdownvalues)
            addresses.removeAll()
            addresses = ["",Requirments.shared().companyName! as String,
                         Requirments.shared().animalGroup! as String,
                         Requirments.shared().physiologicalState! as String,
                         Requirments.shared().currentBodyWeight! as String,
                         Requirments.shared().targetBodyWeight! as String,
                         Requirments.shared().achieveTargetWeight! as String,
                         Requirments.shared().daysInMilk! as String,
                         Requirments.shared().daysPregnant! as String,
                         Requirments.shared().milkProduction! as String,
                         Requirments.shared().animalKind! as String,
                         Requirments.shared().heatStress?.description ?? "none",
                         Requirments.shared().metaBolic?.description ?? "none",
                         Requirments.shared().anionic?.description ?? "none",
                         Requirments.shared().woolProduction?.description ?? "none",
                         
                         "",
                         Requirments.shared().waterCaVal1 ?? "0.0" as String,
                         Requirments.shared().waterPVal1 ?? "0.0" as String,
                         Requirments.shared().waterMgVal1 ?? "0.0" as String,
                         Requirments.shared().waterNaVal1 ?? "0.0" as String,
                         Requirments.shared().waterClVal1 ?? "0.0" as String,
                         Requirments.shared().waterSVal1 ?? "0.0" as String,
                         Requirments.shared().waterKVal1 ?? "0.0" as String,
                         
                         " ",
                         Requirments.shared().dosageFromDatabase ?? "0.0",
                         Requirments.shared().pMacroText1 ?? "none" as String,
                         Requirments.shared().caMacroText1 ?? "none" as String,
                         Requirments.shared().mgMacroText1 ?? "none" as String,
                         Requirments.shared().kMacroText1 ?? "none" as String,
                         Requirments.shared().naMacroText1 ?? "none" as String,
                         Requirments.shared().clMacroText1 ?? "none" as String,
                         Requirments.shared().sMacroText1 ?? "none" as String,
                         Requirments.shared().iMicroText1 ?? "none" as String,
                         Requirments.shared().coMicroText1 ?? "none" as String,
                         Requirments.shared().cuMicroText1 ?? "none" as String,
                         Requirments.shared().cuOrganicMicroText1  ?? "none" as String,
                         Requirments.shared().mnMicroText1 ?? "none" as String,
                         Requirments.shared().mnOrganicMicroText1 ?? "none" as String,
                         Requirments.shared().seMicroText1 ?? "none" as String,
                         Requirments.shared().seOrganicMicroText1 ?? "none" as String,
                         Requirments.shared().znMicroText1 ?? "none" as String,
                         Requirments.shared().znOrganicMicroText1  ?? "none" as String,
                         Requirments.shared().aiuVitamin1 ?? "none" as String,
                         Requirments.shared().diuVitamin1 ?? "none" as String,
                         Requirments.shared().eiuVitamin1 ?? "none" as String,
                         Requirments.shared().niacinVitamin1 ?? "none" as String,
                         Requirments.shared().biotinVitamin1 ?? "none" as String,
                         
                         " ",
                         Requirments.shared().dmiFromDatabase ?? "0.0",
            ] as [String]
            addresses.append(contentsOf: dropdownfloatValue)
            self.companyName.text = "Company : " + Requirments.shared().companyName!
            self.ruminantType.text = "Type : " + Requirments.shared().animalKind!
            self.animalGroup.text = "Group : " + Requirments.shared().animalGroup!
            self.psciState.text = "Physiological State : " + Requirments.shared().physiologicalState!
            self.reportType.text = "Premix Check"
            self.dateLabel.text = self.reportDate
            self.referenceLabel.text = self.reportName
            if let userName = defaults!.value(forKey: "usernameStringKey"){
                self.preparedByLabel.text = userName as? String
            }
            setChart(dataPoints: players, values: Requirments.shared().rationArrayFinal.map { Double($0) })
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(shareVariable == "yes") {
            sendMail()
        }
    }
    
    func getImageOfScrollView() -> UIImage {
        var image = UIImage()
        UIGraphicsBeginImageContextWithOptions(self.scrillviewoutlet.contentSize, false, UIScreen.main.scale)
        let savedContentOffset = self.scrillviewoutlet.contentOffset
        let savedFrame = self.scrillviewoutlet.frame
        let savedBackgroundColor = self.scrillviewoutlet.backgroundColor
        self.scrillviewoutlet.contentOffset = .zero
        self.scrillviewoutlet.frame = CGRect(x: 0, y: 0, width: self.scrillviewoutlet.contentSize.width, height: self.scrillviewoutlet.contentSize.height)
        self.scrillviewoutlet.backgroundColor = UIColor.clear
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: self.scrillviewoutlet.contentSize.width, height: self.scrillviewoutlet.contentSize.height))
        let tempSuperView = self.scrillviewoutlet.superview
        self.scrillviewoutlet.removeFromSuperview()
        tempView.addSubview(self.scrillviewoutlet)
        tempView.layer.render(in: UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        tempView.subviews[0].removeFromSuperview()
        tempSuperView?.addSubview(self.scrillviewoutlet)
        self.scrillviewoutlet.contentOffset = savedContentOffset
        self.scrillviewoutlet.frame = savedFrame
        self.scrillviewoutlet.backgroundColor = savedBackgroundColor

        UIGraphicsEndImageContext()

        return image
    }
    
    func savePdf(){
        self.n1.isHidden = true
        self.n2.isHidden = true
        review.alpha = 0
        supview.alpha = 0
        balview.alpha = 1
        toxicLabel.text = "      ! - Toxic      < 100 - Deficient      * - Absorable Value"
        self.view.layoutIfNeeded()
        let screenShot = getImageOfScrollView()
        let pdfDocument = PDFDocument()
        let pdfPage = PDFPage(image: screenShot)
        pdfDocument.insert(pdfPage!, at: 0)
        let data = pdfDocument.dataRepresentation()
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("documento.pdf")
        let pdfDoc = data
        fileManager.createFile(atPath: paths as String, contents: pdfDoc as Data?, attributes: nil)
        loadPDFAndShare()
    }
    
    func createUI() {
        pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func createPDF() {
        var tableDataItems = [TableDataItem]()
        for itemIndex in 0..<names.count {
            tableDataItems.append(TableDataItem(name: names[itemIndex], address: addresses[itemIndex]))
        }
        let tableDataHeaderTitles =  ["Name", "Value"]
        let pdfCreator = PDFCreator(tableDataItems: tableDataItems, tableDataHeaderTitles: tableDataHeaderTitles)
        
        let data = pdfCreator.create()
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        
        let pdfDocument = PDFDocument(data: data)
        let data1 = pdfDocument!.dataRepresentation()
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("documento1.pdf")
        let pdfDoc = data1
        fileManager.createFile(atPath: paths as String, contents: pdfDoc as Data?, attributes: nil)
        
        if MFMailComposeViewController.canSendMail() {
            let fileManager = FileManager.default
            let documentoPath = (self.getDirectoryPath() as NSString).appendingPathComponent("documento1.pdf")
            
            if fileManager.fileExists(atPath: documentoPath){
                let documento1 = NSData(contentsOfFile: documentoPath)
                self.n1.isHidden = true
                self.n2.isHidden = true
                self.review.alpha = 0
                self.supview.alpha = 0
                self.balview.alpha = 1
                self.toxicLabel.text = "      ! - Toxic      < 100 - Deficient      * - Absorable Value"
                self.view.layoutIfNeeded()
                let screenShot = self.getImageOfScrollView()
                let composePicker = MFMailComposeViewController()
                composePicker.mailComposeDelegate = self
                composePicker.delegate = self
                composePicker.setToRecipients(["info@totalnutrition.pk"])
                //composePicker.setToRecipients(["fareedrao7890@gmail.com"])
                composePicker.setSubject(self.referenceLabel.text!)
                composePicker.setMessageBody("Prepared by " + self.preparedByLabel.text! , isHTML: false)
                
                self.n1.isHidden = true
                self.n2.isHidden = true
                review.alpha = 0    
                supview.alpha = 0
                balview.alpha = 1
                toxicLabel.text = "      ! - Toxic      < 100 - Deficient      * - Absorable Value"
                self.view.layoutIfNeeded()
                let pdfDocument = PDFDocument()
                let pdfPage = PDFPage(image: screenShot)
                pdfDocument.insert(pdfPage!, at: 0)
                let data = pdfDocument.dataRepresentation()
                let fileManager = FileManager.default
                let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("documento2.pdf")
                let pdfDoc = data
                fileManager.createFile(atPath: paths as String, contents: pdfDoc as Data?, attributes: nil)
                
                let documentoPath = (self.getDirectoryPath() as NSString).appendingPathComponent("documento2.pdf")
                
                if fileManager.fileExists(atPath: documentoPath){
                    let documento2 = NSData(contentsOfFile: documentoPath)
                    composePicker.addAttachmentData(documento1! as Data, mimeType: "application/pdf", fileName: "Animal Data.pdf")
                    composePicker.addAttachmentData(documento2! as Data, mimeType: "application/pdf", fileName: "Complete Report.pdf")
                    self.present(composePicker, animated: true, completion: nil)
                }
                
            } else {
                print("document was not found")
            }
        } else {
            self.showErrorMessage()
        }
    }
    
    func loadPDFAndShare(){
        
        let fileManager = FileManager.default
        let documentoPath = (self.getDirectoryPath() as NSString).appendingPathComponent("documento.pdf")
        
        if fileManager.fileExists(atPath: documentoPath){
            let documento = NSData(contentsOfFile: documentoPath)
            let url = URL(fileURLWithPath: NSTemporaryDirectory() + ("Complete Report.pdf"))
            documento?.write(to: url, atomically: false)
            
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView=self.view
            present(activityViewController, animated: true, completion: nil)
            
            activityViewController.completionWithItemsHandler = { (activityType, completed:Bool, returnedItems:[Any]?, error: Error?) in
                if completed {
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.success)
                    view.configureDropShadow()
                    view.configureContent(title: "Report Status", body:"Shared successfully." )
                    SwiftMessages.show(view: view)
                    self.dismiss(animated: true, completion: nil)
                    if let navController = self.navigationController {
                        navController.popViewController(animated: true)
                    }
                } else {
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.error)
                    view.configureDropShadow()
                    view.configureContent(title: "Report Status", body:"Cancelled." )
                    SwiftMessages.show(view: view)
                    self.dismiss(animated: true, completion: nil)
                    if let navController = self.navigationController {
                        navController.popViewController(animated: true)
                    }
                }
            }
        }
        else {
            print("document was not found")
        }
    }
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func sendMail() {
        
        let alert = UIAlertController(title: "Share Report", message: "Please Select an Option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Share on Network", style: .default, handler: { (_) in
            self.savePdf()
            print("User click Approve button")
        }))

        alert.addAction(UIAlertAction(title: "Get Quote", style: .default, handler: { (_) in
            print("User click Edit button")
            self.createUI()
            self.createPDF()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    func showErrorMessage() {
        let alertMessage = UIAlertController(title: "Could not sent email", message: "Check if your device have email support. Hint: Tap Settings > [your name] > iCloud and turn on Mail on your iPhone, iPad, or iPod touch.", preferredStyle: UIAlertController.Style.alert)
        alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }))
        self.present(alertMessage, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Report Status", body:"Cancelled by user." )
            SwiftMessages.show(view: view)
        case .saved:
            print("Mail saved")
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.success)
            view.configureDropShadow()
            view.configureContent(title: "Report Status", body:"Report saved in draft." )
            SwiftMessages.show(view: view)
        case .sent:
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.success)
            view.configureDropShadow()
            view.configureContent(title: "Report Status", body:"Shared successfully." )
            SwiftMessages.show(view: view)
        case .failed:
            print("Mail sent")
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Report Status", body:"Failed to share." )
            SwiftMessages.show(view: view)
        @unknown default:
            print("Mail sent")
        }
        self.n1.isHidden = false
        self.n2.isHidden = false
        review.alpha = 1
        supview.alpha = 0
        balview.alpha = 0
        toxicLabel.text = "      * - Absorable Value"
        self.dismiss(animated: true, completion: {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        })
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        sendMail()
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        self.buttonsOutlets.forEach { (button) in
            if (sender.tag == 1) {
                button.backgroundColor = (button === sender && sender.tag == 1) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 1
                supview.alpha = 0
                balview.alpha = 0
                toxicLabel.text = "      * - Absorable Value"
            }
            else if (sender.tag == 2) {
                button.backgroundColor = (button === sender && sender.tag == 2) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 0
                supview.alpha = 1
                balview.alpha = 0
                toxicLabel.text = "      * - Absorable Value"
            }
            else if (sender.tag == 3) {
                button.backgroundColor = (button === sender && sender.tag == 3) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                review.alpha = 0
                supview.alpha = 0
                balview.alpha = 1
                toxicLabel.text = "      ! - Toxic      < 100 - Deficient      * - Absorable Value"
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
        
        //barchartview.rightAxis.granularity = 0.1
        //barchartview.xAxis.granularity = 0.1
        barchartview.isUserInteractionEnabled = false
        guard let description = barchartview.chartDescription else {return}
        description.text = ""
        
        barchartview.leftAxis.drawGridLinesEnabled = true
        barchartview.xAxis.drawGridLinesEnabled = true
        barchartview.rightAxis.drawGridLinesEnabled = false
        barchartview.leftAxis.axisMinimum = 0
        barchartview.rightAxis.axisMinimum = 0
        barchartview.minOffset = 0.0
        barchartview.legend.enabled = false
        var _ : Bool = [1, 2, 3, 4, 5].allSatisfy { $0 < 10 }
        if(fromDatabase == "yes") {
            let entry1 = BarChartDataEntry(x: 17, yValues: [ ((rationArray[0] / requiredArray[0]) * 100),
                                                             ((premixArray[0] / requiredArray[0]) * 100),0])
            let entry2 = BarChartDataEntry(x: 16, yValues: [ ((rationArray[1] / requiredArray[1]) * 100),
                                                             ((premixArray[1] / requiredArray[1]) * 100),0])
            let entry3 = BarChartDataEntry(x: 15, yValues: [ ((rationArray[2] / requiredArray[2]) * 100),
                                                             ((premixArray[2] / requiredArray[2]) * 100),0])
            let entry4 = BarChartDataEntry(x: 14, yValues: [ ((rationArray[3] / requiredArray[3]) * 100),
                                                             ((premixArray[3] / requiredArray[3]) * 100),0])
            let entry5 = BarChartDataEntry(x: 13, yValues: [ ((rationArray[4] / requiredArray[4]) * 100),
                                                             ((premixArray[4] / requiredArray[4]) * 100),0])
            let entry6 = BarChartDataEntry(x: 12, yValues: [ ((rationArray[5] / requiredArray[5]) * 100),
                                                             ((premixArray[5] / requiredArray[5]) * 100),0])
            let entry7 = BarChartDataEntry(x: 11, yValues: [ ((rationArray[6] / requiredArray[6]) * 100),
                                                             ((premixArray[6] / requiredArray[6]) * 100),0])
            let entry8 = BarChartDataEntry(x: 10, yValues: [ ((rationArray[7] / requiredArray[7]) * 100),
                                                             ((premixArray[7] / requiredArray[7]) * 100),0])
            let entry9 = BarChartDataEntry(x: 9, yValues: [  ((rationArray[8] / requiredArray[8]) * 100),
                                                             ((premixArray[8] / requiredArray[8]) * 100),0])
            let entry10 = BarChartDataEntry(x: 8, yValues: [ ((rationArray[9] / requiredArray[9]) * 100),
                                                             ((premixArray[9] / requiredArray[9]) * 100),0])
            let entry11 = BarChartDataEntry(x: 7, yValues: [ ((rationArray[10] / requiredArray[10]) * 100),
                                                             ((premixArray[10] / requiredArray[10]) * 100),0])
            
            
            let entry12 = BarChartDataEntry(x: 6, yValues: [ ((rationArray[11] / requiredArray[11]) * 100),
                                                             ((premixArray[11] / requiredArray[11]) * 100),
                                                             ((waterArray[11] / requiredArray[11]) * 100)])
            let entry13 = BarChartDataEntry(x: 5, yValues: [ ((rationArray[12] / requiredArray[12]) * 100),
                                                             ((premixArray[12] / requiredArray[12]) * 100),
                                                             ((waterArray[12] / requiredArray[12]) * 100)])
            let entry14 = BarChartDataEntry(x: 4, yValues: [ ((rationArray[13] / requiredArray[13]) * 100),
                                                             ((premixArray[13] / requiredArray[13]) * 100),
                                                             ((waterArray[13] / requiredArray[13]) * 100)])
            let entry15 = BarChartDataEntry(x: 3, yValues: [ ((rationArray[14] / requiredArray[14]) * 100),
                                                             ((premixArray[14] / requiredArray[14]) * 100),
                                                             ((waterArray[14] / requiredArray[14]) * 100)])
            let entry16 = BarChartDataEntry(x: 2, yValues: [ ((rationArray[15] / requiredArray[15]) * 100),
                                                             ((premixArray[15] / requiredArray[15]) * 100),
                                                             ((waterArray[15] / requiredArray[15]) * 100)])
            let entry17 = BarChartDataEntry(x: 1, yValues: [ ((rationArray[16] / requiredArray[16]) * 100),
                                                             ((premixArray[16] / requiredArray[16]) * 100),
                                                             ((waterArray[16] / requiredArray[16]) * 100)])
            let entry18 = BarChartDataEntry(x: 0, yValues: [ ((rationArray[17] / requiredArray[17]) * 100),
                                                             ((premixArray[17] / requiredArray[17]) * 100),
                                                             ((waterArray[17] / requiredArray[17]) * 100)])
            
            let dataSet = BarChartDataSet(entries: [ entry1, entry2,entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10, entry11, entry12, entry13, entry14, entry15, entry16, entry17, entry18 ], label: nil)
            dataSet.colors = [UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0), UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0), UIColor(red: 28/255, green: 115/255.0, blue: 193/255.0, alpha: 1.0)]
            let chartData = BarChartData(dataSet: dataSet)
            chartData.setDrawValues(false)
            barchartview.data = chartData
        } else {
            
            let entry1 = BarChartDataEntry(x: 17, yValues: [ ((Requirments.shared().rationArrayFinal[0] / Requirments.shared().reqArrayFinal[0]) * 100),
                                                             ((Requirments.shared().primexArrayFinal[0] / Requirments.shared().reqArrayFinal[0]) * 100) ,0])
            
            
            
            let entry2 = BarChartDataEntry(x: 16, yValues: [ ((Requirments.shared().rationArrayFinal[1] / Requirments.shared().reqArrayFinal[1]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[1] / Requirments.shared().reqArrayFinal[1]) * 100) ,0])
            
            
            
            
            
            let entry3 = BarChartDataEntry(x: 15, yValues: [ ((Requirments.shared().rationArrayFinal[2] / Requirments.shared().reqArrayFinal[2]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[2] / Requirments.shared().reqArrayFinal[2]) * 100) ,0])
            
            
            
            
            
            let entry4 = BarChartDataEntry(x: 14, yValues: [ ((Requirments.shared().rationArrayFinal[3] / Requirments.shared().reqArrayFinal[3]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[3] / Requirments.shared().reqArrayFinal[3]) * 100) ,0])
            
            
            
            
            
            let entry5 = BarChartDataEntry(x: 13, yValues: [ ((Requirments.shared().rationArrayFinal[4] / Requirments.shared().reqArrayFinal[4]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[4] / Requirments.shared().reqArrayFinal[4]) * 100) ,0])
            
            
            
            
            
            let entry6 = BarChartDataEntry(x: 12, yValues: [ ((Requirments.shared().rationArrayFinal[5] / Requirments.shared().reqArrayFinal[5]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[5] / Requirments.shared().reqArrayFinal[5]) * 100) ,0])
            
            
            
            
            let entry7 = BarChartDataEntry(x: 11, yValues: [ ((Requirments.shared().rationArrayFinal[6] / Requirments.shared().reqArrayFinal[6]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[6] / Requirments.shared().reqArrayFinal[6]) * 100) ,0])
            
            
            
            
            
            let entry8 = BarChartDataEntry(x: 10, yValues: [ ((Requirments.shared().rationArrayFinal[7] / Requirments.shared().reqArrayFinal[7]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[7] / Requirments.shared().reqArrayFinal[7]) * 100) ,0])
            
            
            
            
            
            let entry9 = BarChartDataEntry(x: 9, yValues: [ ((Requirments.shared().rationArrayFinal[8] / Requirments.shared().reqArrayFinal[8]) * 100) ,
                                                            ((Requirments.shared().primexArrayFinal[8] / Requirments.shared().reqArrayFinal[8]) * 100) ,0])
            
            
            
            
            
            let entry10 = BarChartDataEntry(x: 8, yValues: [ ((Requirments.shared().rationArrayFinal[9] / Requirments.shared().reqArrayFinal[9]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[9] / Requirments.shared().reqArrayFinal[9]) * 100) ,0])
            
            
            
            
            
            let entry11 = BarChartDataEntry(x: 7, yValues: [ ((Requirments.shared().rationArrayFinal[10] / Requirments.shared().reqArrayFinal[10]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[10] / Requirments.shared().reqArrayFinal[10]) * 100) ,0])
            
            
            
            
            
            let entry12 = BarChartDataEntry(x: 6, yValues: [ ((Requirments.shared().rationArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[11] / Requirments.shared().reqArrayFinal[11]) * 100) ])
            
            
            
            
            
            let entry13 = BarChartDataEntry(x: 5, yValues: [ ((Requirments.shared().rationArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[12] / Requirments.shared().reqArrayFinal[12]) * 100) ])
            
            
            
            
            
            let entry14 = BarChartDataEntry(x: 4, yValues: [ ((Requirments.shared().rationArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[13] / Requirments.shared().reqArrayFinal[13]) * 100) ])
            
            
            
            
            let entry15 = BarChartDataEntry(x: 3, yValues: [ ((Requirments.shared().rationArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[14] / Requirments.shared().reqArrayFinal[14]) * 100) ])
            
            
            
            
            
            let entry16 = BarChartDataEntry(x: 2, yValues: [ ((Requirments.shared().rationArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[15] / Requirments.shared().reqArrayFinal[15]) * 100) ])
            
            
            
            
            let entry17 = BarChartDataEntry(x: 1, yValues: [ ((Requirments.shared().rationArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[16] / Requirments.shared().reqArrayFinal[16]) * 100) ])
            
            
            
            
            
            let entry18 = BarChartDataEntry(x: 0, yValues: [ ((Requirments.shared().rationArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100) ,
                                                             ((Requirments.shared().primexArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100) ,
                                                             ((Requirments.shared().waterArrayFinal[17] / Requirments.shared().reqArrayFinal[17]) * 100) ])
            
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
        Originaldropdownvalues.removeAll()
        OriginaldropdownfloatValue.removeAll()
        Originalwaterarray.removeAll()
        Originalpremixarray.removeAll()
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

extension Array {
    func chunkedElements(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

class PDFCreator: NSObject {
    let defaultOffset: CGFloat = 10
    let tableDataHeaderTitles: [String]
    let tableDataItems: [TableDataItem]

    init(tableDataItems: [TableDataItem], tableDataHeaderTitles: [String]) {
        self.tableDataItems = tableDataItems
        self.tableDataHeaderTitles = tableDataHeaderTitles
    }

    func create() -> Data {
        // default page format
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: UIGraphicsPDFRendererFormat())

        let numberOfElementsPerPage = calculateNumberOfElementsPerPage(with: pageRect)
        let tableDataChunked: [[TableDataItem]] = tableDataItems.chunkedElements(into: numberOfElementsPerPage)

        let data = renderer.pdfData { context in
            for tableDataChunk in tableDataChunked {
                context.beginPage()
                let cgContext = context.cgContext
                //drawTableHeaderRect(drawContext: cgContext, pageRect: pageRect)
                //drawTableHeaderTitles(titles: tableDataHeaderTitles, drawContext: cgContext, pageRect: pageRect)
                drawTableContentInnerBordersAndText(drawContext: cgContext, pageRect: pageRect, tableDataItems: tableDataChunk)
            }
        }
        return data
    }

    func calculateNumberOfElementsPerPage(with pageRect: CGRect) -> Int {
        let rowHeight = (defaultOffset * 2)
        let number = Int((pageRect.height - rowHeight) / rowHeight)
        return number
    }
}

// Drawings
extension PDFCreator {
    func drawTableContentInnerBordersAndText(drawContext: CGContext, pageRect: CGRect, tableDataItems: [TableDataItem]) {
        drawContext.setLineWidth(0.0)
        drawContext.saveGState()

        let defaultStartY = defaultOffset * 2
        for elementIndex in 0..<tableDataItems.count {
            let yPosition = CGFloat(elementIndex) * defaultStartY + defaultStartY

            // Draw content's elements texts
            let textFont = UIFont.systemFont(ofSize: 13.0, weight: .regular)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.lineBreakMode = .byWordWrapping
            let textAttributes = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: textFont
            ]
            
            let textFont1 = UIFont.systemFont(ofSize: 16.0, weight: .bold)
            let paragraphStyle1 = NSMutableParagraphStyle()
            paragraphStyle1.alignment = .left
            paragraphStyle1.lineBreakMode = .byWordWrapping
            let textAttributes1 = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle1,
                NSAttributedString.Key.font: textFont1
            ]
            
            let tabWidth = (pageRect.width - defaultOffset * 2) / CGFloat(2)
            for titleIndex in 0..<2 {
                // 14,22,45
                if(totalCellCreatedCount == 0 || totalCellCreatedCount == 15 || totalCellCreatedCount == 23 || totalCellCreatedCount == 47) {
                    var attributedText = NSAttributedString(string: "", attributes: textAttributes1)
                    switch titleIndex {
                    case 0: attributedText = NSAttributedString(string: tableDataItems[elementIndex].name, attributes: textAttributes1)
                    case 1: attributedText = NSAttributedString(string: tableDataItems[elementIndex].address, attributes: textAttributes1)
                    default:
                        break
                    }
                    let tabX = CGFloat(titleIndex) * tabWidth
                    let textRect = CGRect(x: tabX + defaultOffset,
                                          y: yPosition + defaultOffset,
                                          width: tabWidth,
                                          height: defaultOffset * 2)
                    attributedText.draw(in: textRect)
                } else {
                    var attributedText = NSAttributedString(string: "", attributes: textAttributes)
                    switch titleIndex {
                    case 0: attributedText = NSAttributedString(string: tableDataItems[elementIndex].name, attributes: textAttributes)
                    case 1: attributedText = NSAttributedString(string: tableDataItems[elementIndex].address, attributes: textAttributes)
                    default:
                        break
                    }
                    let tabX = CGFloat(titleIndex) * tabWidth
                    let textRect = CGRect(x: tabX + defaultOffset,
                                          y: yPosition + defaultOffset,
                                          width: tabWidth,
                                          height: defaultOffset * 2)
                    attributedText.draw(in: textRect)
                }
                
            }

            totalCellCreatedCount = totalCellCreatedCount + 1
            // Draw content's 3 vertical lines
            for verticalLineIndex in 0..<4 {
                let tabX = CGFloat(verticalLineIndex) * tabWidth
                drawContext.move(to: CGPoint(x: tabX + defaultOffset, y: yPosition))
                drawContext.addLine(to: CGPoint(x: tabX + defaultOffset, y: yPosition + defaultStartY))
                drawContext.strokePath()
            }

            // Draw content's element bottom horizontal line
            drawContext.move(to: CGPoint(x: defaultOffset, y: yPosition + defaultStartY))
            drawContext.addLine(to: CGPoint(x: pageRect.width - defaultOffset, y: yPosition + defaultStartY))
            drawContext.strokePath()
        }
        drawContext.restoreGState()
    }
}

