//
//  PoultryPDFViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 17/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import QuartzCore
import MessageUI
import SwiftMessages
import PDFKit

class PoultryPDFViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var n1: UIView!
    @IBOutlet weak var scrillviewoutlet: UIScrollView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var ruminantType: UILabel!
    @IBOutlet weak var animalGroup: UILabel!
    @IBOutlet weak var psciState: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var referenceLabel: UILabel!
    @IBOutlet weak var preparedByLabel: UILabel!
    @IBOutlet weak var reportType: UILabel!
    let defaults = UserDefaults(suiteName:"User")
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.preparedByLabel.text = userName as? String
            print(userName)
        }
        if let busines = defaults!.value(forKey: "userbussinessStringKey"){
            self.companyName.text = "Company : \(busines as! String)"
            print(busines)
        }
        self.ruminantType.text = "Type : " + Requirments.shared().poultryType!
        self.animalGroup.text = "Group : " + Requirments.shared().poultryStrain!
        self.psciState.text = "Physiological State : " + Requirments.shared().poultryPsychlogyState!
        self.reportType.text = "Premix Check"
        //self.dateLabel.text = "datestr3"
        self.referenceLabel.text = "Poultry Report"
    }
    
    @IBAction func shareButton(_ sender: Any) {
        sendMail()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func sendMail() {
        
        let alert = UIAlertController(title: "Share Report", message: "Please Select an Option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Share on Network", style: .default, handler: { (_) in
            self.savePdf()
            print("User click Approve button")
        }))

        alert.addAction(UIAlertAction(title: "Get Recommendation ", style: .default, handler: { (_) in
            print("User click Edit button")
            self.loadPDFAndShareToGetRecommendation()
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
        self.dismiss(animated: true, completion: {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        })
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
    
    func loadPDFAndShareToGetRecommendation(){
        
        if MFMailComposeViewController.canSendMail() {
            self.n1.isHidden = true
            self.view.layoutIfNeeded()
            let screenShot = self.getImageOfScrollView()
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
                let composePicker = MFMailComposeViewController()
                composePicker.mailComposeDelegate = self
                composePicker.delegate = self
                composePicker.setToRecipients(["info@totalnutrition.pk"])
                composePicker.setSubject(self.referenceLabel.text!)
                composePicker.setMessageBody("Prepared by " + self.preparedByLabel.text! , isHTML: false)
                composePicker.addAttachmentData(documento2! as Data, mimeType: "application/pdf", fileName: "Complete Report.pdf")
                self.present(composePicker, animated: true, completion: nil)
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
}
