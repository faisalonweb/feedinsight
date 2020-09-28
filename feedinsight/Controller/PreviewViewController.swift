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
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var GrandView: UIView!
    
    var invoiceInfo: [String: AnyObject]!
    let players = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vit. A","Vit. D3","Vit. E","Niacin","Biotin"]
    let goals = [6, 8, 26, 30, 8, 10,12,12,12,12,12,100,500,23,232,55,333,323]
    @IBOutlet weak var barchart: BarChartView!
    var invoiceComposer: InvoiceComposer!
    
    var HTMLContent: String!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x != 0
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //scrollview.isDirectionalLockEnabled = false
        
        scrollview.delegate = self
        barchart.animate(yAxisDuration: 1.0)
        barchart.pinchZoomEnabled = false
        barchart.drawBarShadowEnabled = false
        barchart.drawBordersEnabled = false
        barchart.doubleTapToZoomEnabled = false
        barchart.drawGridBackgroundEnabled = true
        barchart.chartDescription?.text = "Bar Chart View"
        setChart(dataPoints: players, values: Requirments.shared().rationArrayFinal.map { Double($0) })
        // Do any additional setup after loading the view.
    }
    func setChart(dataPoints: [String], values: [Double]) {
        barchart.xAxis.setLabelCount(18, force: true)
        barchart.xAxis.valueFormatter = IndexAxisValueFormatter(values: players)
        barchart.xAxis.granularity = 1.0
        barchart.xAxis.labelPosition = .bottom
        barchart.xAxis.drawGridLinesEnabled = false
        
        barchart.leftAxis.enabled = false
        barchart.rightAxis.granularity = 1.0
        barchart.rightAxis.axisMinimum = 0.0
        
        
        guard let description = barchart.chartDescription else {return}
        description.text = ""
        barchart.leftAxis.drawGridLinesEnabled = false
        barchart.xAxis.drawGridLinesEnabled = false
        barchart.noDataText = "You need to provide data for the chart."
//        var dataEntries: [BarChartDataEntry] = []
//        for i in 0..<dataPoints.count {
//            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
//            dataEntries.append(dataEntry)
//        }
//        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
//        let chartData = BarChartData(dataSet: chartDataSet)
//        barchart.data = chartData
        
        
        let entry1 = BarChartDataEntry(x: 0, yValues: [ Requirments.shared().rationArrayFinal[0],
                                                        Requirments.shared().primexArrayFinal[0],
                                                        Requirments.shared().waterArrayFinal[0]])
        let entry2 = BarChartDataEntry(x: 1, yValues: [ Requirments.shared().rationArrayFinal[1],
                                                        Requirments.shared().primexArrayFinal[1],
                                                        Requirments.shared().waterArrayFinal[1]])
        let entry3 = BarChartDataEntry(x: 2, yValues: [ Requirments.shared().rationArrayFinal[2],
                                                        Requirments.shared().primexArrayFinal[2],
                                                        Requirments.shared().waterArrayFinal[2]])
        let entry4 = BarChartDataEntry(x: 3, yValues: [ Requirments.shared().rationArrayFinal[3],
                                                        Requirments.shared().primexArrayFinal[3],
                                                        Requirments.shared().waterArrayFinal[3]])
        let entry5 = BarChartDataEntry(x: 4, yValues: [ Requirments.shared().rationArrayFinal[4],
                                                        Requirments.shared().primexArrayFinal[4],
                                                        Requirments.shared().waterArrayFinal[4]])
        let entry6 = BarChartDataEntry(x: 5, yValues: [ Requirments.shared().rationArrayFinal[5],
                                                        Requirments.shared().primexArrayFinal[5],
                                                        Requirments.shared().waterArrayFinal[5]])
        let entry7 = BarChartDataEntry(x: 6, yValues: [ Requirments.shared().rationArrayFinal[6],
                                                        Requirments.shared().primexArrayFinal[6],
                                                        Requirments.shared().waterArrayFinal[6]])
        let entry8 = BarChartDataEntry(x: 7, yValues: [ Requirments.shared().rationArrayFinal[7],
                                                        Requirments.shared().primexArrayFinal[7],0])
        let entry9 = BarChartDataEntry(x: 8, yValues: [ Requirments.shared().rationArrayFinal[8],
                                                        Requirments.shared().primexArrayFinal[8],0])
        let entry10 = BarChartDataEntry(x: 9, yValues: [ Requirments.shared().rationArrayFinal[9],
                                                         Requirments.shared().primexArrayFinal[9],0])
        let entry11 = BarChartDataEntry(x: 10, yValues: [ Requirments.shared().rationArrayFinal[10],
                                                          Requirments.shared().primexArrayFinal[10],0])
        let entry12 = BarChartDataEntry(x: 11, yValues: [ Requirments.shared().rationArrayFinal[11],
                                                          Requirments.shared().primexArrayFinal[11],0])
        let entry13 = BarChartDataEntry(x: 12, yValues: [ Requirments.shared().rationArrayFinal[12],
                                                          Requirments.shared().primexArrayFinal[12],0])
        let entry14 = BarChartDataEntry(x: 13, yValues: [ Requirments.shared().rationArrayFinal[13],
                                                          Requirments.shared().primexArrayFinal[13],0])
        let entry15 = BarChartDataEntry(x: 14, yValues: [ Requirments.shared().rationArrayFinal[14],
                                                          Requirments.shared().primexArrayFinal[14],0])
        let entry16 = BarChartDataEntry(x: 15, yValues: [ Requirments.shared().rationArrayFinal[15],
                                                          Requirments.shared().primexArrayFinal[15],0])
        let entry17 = BarChartDataEntry(x: 16, yValues: [ Requirments.shared().rationArrayFinal[16],
                                                          Requirments.shared().primexArrayFinal[16],0])
        let entry18 = BarChartDataEntry(x: 17, yValues: [ Requirments.shared().rationArrayFinal[17],
                                                          Requirments.shared().primexArrayFinal[17],0])
        
        let dataSet = BarChartDataSet(entries: [ entry1, entry2,entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10, entry11, entry12, entry13, entry14, entry15, entry16, entry17, entry18 ], label: nil)
        dataSet.colors = [ UIColor.purple, UIColor.systemPink, UIColor.systemYellow]
        let chartData1 = BarChartData(dataSet: dataSet)

        barchart.data = chartData1
        barchart.leftAxis.labelCount = 1
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
    
    //    func createInvoiceAsHTML() {
    //        invoiceComposer = InvoiceComposer()
    //        if let invoiceHTML = invoiceComposer.renderInvoice(invoiceNumber: invoiceInfo["invoiceNumber"] as! String,
    //                                                           invoiceDate: invoiceInfo["invoiceDate"] as! String,
    //                                                           recipientInfo: invoiceInfo["recipientInfo"] as! String,
    //                                                           items: invoiceInfo["items"] as! [[String: String]],
    //                                                           totalAmount: invoiceInfo["totalAmount"] as! String) {
    //
    //            webPreview.loadHTMLString(invoiceHTML, baseURL: NSURL(string: invoiceComposer.pathToInvoiceHTMLTemplate!)! as URL)
    //            HTMLContent = invoiceHTML
    //        }
    //    }
    
    
    
    //    func showOptionsAlert() {
    //        let alertController = UIAlertController(title: "Yeah!", message: "Your invoice has been successfully printed to a PDF file.\n\nWhat do you want to do now?", preferredStyle: UIAlertController.Style.alert)
    //
    //        let actionPreview = UIAlertAction(title: "Preview it", style: UIAlertAction.Style.default) { (action) in
    //            if let filename = self.invoiceComposer.pdfFilename, let url = URL(string: filename) {
    //                let request = URLRequest(url: url)
    //                self.webPreview.loadRequest(request)
    //            }
    //        }
    //
    //        let actionEmail = UIAlertAction(title: "Send by Email", style: UIAlertAction.Style.default) { (action) in
    //            DispatchQueue.main.async {
    //                self.sendEmail()
    //            }
    //        }
    //
    //        let actionNothing = UIAlertAction(title: "Nothing", style: UIAlertAction.Style.default) { (action) in
    //
    //        }
    //
    //        alertController.addAction(actionPreview)
    //        alertController.addAction(actionEmail)
    //        alertController.addAction(actionNothing)
    //
    //        present(alertController, animated: true, completion: nil)
    //    }
    
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setSubject("Invoice")
            mailComposeViewController.addAttachmentData(NSData(contentsOfFile: invoiceComposer.pdfFilename)! as Data, mimeType: "application/pdf", fileName: "Invoice")
            present(mailComposeViewController, animated: true, completion: nil)
        }
    }
    
}
