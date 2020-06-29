//
//  PreviewViewController.swift
//  Print2PDF
//
//  Created by Gabriel Theodoropoulos on 14/06/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit
import MessageUI
import Charts

class PreviewViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCollection", for: indexPath) as! UICollectionViewCell
        return cell
    }

 var pdfFilename: String!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var webPreview: UIWebView!
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var GrandView: UIView!
    
    var invoiceInfo: [String: AnyObject]!
   let players = ["Ozil", "Ramsey", "Laca", "Auba", "Xhaka", "Torreira"]
    let goals = [6, 8, 26, 30, 8, 10]
    @IBOutlet weak var barchart: BarChartView!
    var invoiceComposer: InvoiceComposer!

    var HTMLContent: String!

    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.contentOffset.x != 0
    }
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        scrollview.isDirectionalLockEnabled = false
        
        scrollview.delegate = self
barchart.animate(yAxisDuration: 2.0)
   barchart.pinchZoomEnabled = false
   barchart.drawBarShadowEnabled = false
   barchart.drawBordersEnabled = false
   barchart.doubleTapToZoomEnabled = false
   barchart.drawGridBackgroundEnabled = true
   barchart.chartDescription?.text = "Bar Chart View"

   setChart(dataPoints: players, values: goals.map { Double($0) })
        // Do any additional setup after loading the view.
    }
    func setChart(dataPoints: [String], values: [Double]) {
      barchart.noDataText = "You need to provide data for the chart."

      var dataEntries: [BarChartDataEntry] = []

      for i in 0..<dataPoints.count {
        let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
        dataEntries.append(dataEntry)
      }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Bar Chart View")
      let chartData = BarChartData(dataSet: chartDataSet)
      barchart.data = chartData
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       // createInvoiceAsHTML()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: IBAction Methods

    func generatePDFdata(withView contentview: UIView) -> NSData {
//        let pageDimensions = scrollview.bounds
//                     let pageSize = pageDimensions.size
//                     let totalSize = scrollview.contentSize
//
//                     let numberOfPagesThatFitHorizontally = Int(ceil(totalSize.width / pageSize.width))
//                     let numberOfPagesThatFitVertically = Int(ceil(totalSize.height / pageSize.height))
//               let outputData = NSMutableData()
//////
//
//        ////
//               UIGraphicsBeginPDFContextToData(outputData, pageDimensions, nil)
//               let savedContentOffset = scrollview.contentOffset
//               let savedContentInset = scrollview.contentInset
//
//               scrollview.contentInset = UIEdgeInsets.zero
//               if let context = UIGraphicsGetCurrentContext()
//               {
//                   for indexHorizontal in 0 ..< numberOfPagesThatFitHorizontally
//                   {
//                       for indexVertical in 0 ..< numberOfPagesThatFitVertically
//                       {
//
//                           UIGraphicsBeginPDFPage()
//
//                           let offsetHorizontal = CGFloat(indexHorizontal) * pageSize.width
//                           let offsetVertical = CGFloat(indexVertical) * pageSize.height
//
//                        scrollview.contentOffset = CGPoint(x: offsetHorizontal, y: offsetVertical)
//                           context.translateBy(x: -offsetHorizontal, y: -offsetVertical)
//
//                           view.layer.render(in: context)
//                       }
//                   }
//               }
//               UIGraphicsEndPDFContext()
//        let pdfData = outputData
//                         pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice.pdf"
//                         pdfData.write(toFile: pdfFilename, atomically: true)
//                          print(pdfFilename)
//                         return outputData
//               scrollview.contentInset = savedContentInset
//               scrollview.contentOffset = savedContentOffset
               
        
        
        
        
        
        
        

           let pageDimensions = contentview.bounds
           let outputData = NSMutableData()

           UIGraphicsBeginPDFContextToData(outputData, pageDimensions, nil)
           if let context = UIGraphicsGetCurrentContext() {
               UIGraphicsBeginPDFPage()
               view.layer.render(in: context)
           }
           UIGraphicsEndPDFContext()
     let pdfData = outputData
           pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice.pdf"
           pdfData.write(toFile: pdfFilename, atomically: true)
            print(pdfFilename)
           return outputData
       }

    @IBAction func exportToPDF(_ sender: AnyObject) {
//        invoiceComposer.exportHTMLContentToPDF(HTMLContent: HTMLContent)
//        showOptionsAlert()
         generatePDFdata(withView: contentview)
    }


    // MARK: Custom Methods

    func createInvoiceAsHTML() {
        invoiceComposer = InvoiceComposer()
        if let invoiceHTML = invoiceComposer.renderInvoice(invoiceNumber: invoiceInfo["invoiceNumber"] as! String,
                                                           invoiceDate: invoiceInfo["invoiceDate"] as! String,
                                                           recipientInfo: invoiceInfo["recipientInfo"] as! String,
                                                           items: invoiceInfo["items"] as! [[String: String]],
                                                           totalAmount: invoiceInfo["totalAmount"] as! String) {

            webPreview.loadHTMLString(invoiceHTML, baseURL: NSURL(string: invoiceComposer.pathToInvoiceHTMLTemplate!)! as URL)
            HTMLContent = invoiceHTML
        }
    }



    func showOptionsAlert() {
        let alertController = UIAlertController(title: "Yeah!", message: "Your invoice has been successfully printed to a PDF file.\n\nWhat do you want to do now?", preferredStyle: UIAlertController.Style.alert)

        let actionPreview = UIAlertAction(title: "Preview it", style: UIAlertAction.Style.default) { (action) in
            if let filename = self.invoiceComposer.pdfFilename, let url = URL(string: filename) {
                let request = URLRequest(url: url)
                self.webPreview.loadRequest(request)
            }
        }

        let actionEmail = UIAlertAction(title: "Send by Email", style: UIAlertAction.Style.default) { (action) in
            DispatchQueue.main.async {
                self.sendEmail()
            }
        }

        let actionNothing = UIAlertAction(title: "Nothing", style: UIAlertAction.Style.default) { (action) in

        }

        alertController.addAction(actionPreview)
        alertController.addAction(actionEmail)
        alertController.addAction(actionNothing)

        present(alertController, animated: true, completion: nil)
    }



    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setSubject("Invoice")
            mailComposeViewController.addAttachmentData(NSData(contentsOfFile: invoiceComposer.pdfFilename)! as Data, mimeType: "application/pdf", fileName: "Invoice")
            present(mailComposeViewController, animated: true, completion: nil)
        }
    }

}
