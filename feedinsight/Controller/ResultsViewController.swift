//
//  ResultsViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 03/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var labelsMatrixView1   : NALLabelsMatrixView!;
    var labelsMatrixView2   : NALLabelsMatrixView!;
    var labelsMatrixView3   : NALLabelsMatrixView!;
    var labelsMatrixView4   : NALLabelsMatrixView!;
    @IBOutlet weak var secView: UIView! // 540
    @IBOutlet weak var thirdView: UIView! // 660
    @IBOutlet weak var fourthView: UIView! // 210
    @IBOutlet weak var fifthView: UIView! // 630
    let defaults = UserDefaults.standard
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    //660
    var RationArr = ["Ca","Ca (Abs)","P","P (Abs)" ,"Mg", "Mg(Abs)" , "K","S","Na","Cl","Fe","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    //210
    var WaterRationArr = ["P","Ca","Mg", "K","S","Na","Cl"]
    // 540
    var requirmentsArr = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vitamin A","Vitamin D3","Vitamin E","Niacin B3","Biotin B7"]
    //630
    var PremixArr = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu(Inorganic)","Cu(Organic)","Se(inorganic)","Se(Organic)","Zn(Inorganic)","Zn(Organic)","AIU","DIU","EIU","Niacin(mg)","Biotin(mg)"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = defaults.value(forKey: "usernameStringKey"){
                 self.userNameLabel.text = userName as? String
                 print(userName)
             }
             DispatchQueue.main.async { [weak self] in
                 let data = self?.defaults.value(forKey: "imageData") as? Data
                 if(data != nil) {
                     self?.profileImage.image = UIImage(data: data!)
                 }
             }
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        self.labelsMatrixView1 = NALLabelsMatrixView(frame: CGRect.init(x: self.secView.frame.origin.x, y: 0, width: self.secView.frame.size.width - 20, height: self.secView.frame.size.height), columns: [60, Int(self.secView.frame.size.width - 80) / 2 , Int(self.secView.frame.size.width - 80) / 2])
        self.secView.addSubview(self.labelsMatrixView1)
        labelsMatrixView1.addRecord(record: ["No", "Requirments Results", "Value"])
        for i in 0...requirmentsArr.count - 1 {
            labelsMatrixView1.addRecord(record: [String(i), requirmentsArr[i], String(requirments.reqArrayFinal[i])])
        }
        
        // second ration
        self.labelsMatrixView2 = NALLabelsMatrixView(frame: CGRect.init(x: self.thirdView.frame.origin.x, y: 0, width: self.thirdView.frame.size.width - 20, height: self.thirdView.frame.size.height), columns: [60, Int(self.secView.frame.size.width - 80) / 2 , Int(self.secView.frame.size.width - 80) / 2])
        self.thirdView.addSubview(self.labelsMatrixView2)
        labelsMatrixView2.addRecord(record: ["No", "Ration Results", "Value"])
        for i in 0...RationArr.count - 1 {
            labelsMatrixView2.addRecord(record: [String(i), RationArr[i],String(requirments.rationArrayFinal[i])])
        }
        
        // second ration
        self.labelsMatrixView3 = NALLabelsMatrixView(frame: CGRect.init(x: self.fourthView.frame.origin.x, y: 0, width: self.fourthView.frame.size.width - 20, height: self.fourthView.frame.size.height), columns: [60, Int(self.fourthView.frame.size.width - 80) / 2 , Int(self.fourthView.frame.size.width - 80) / 2])
        self.fourthView.addSubview(self.labelsMatrixView3)
        labelsMatrixView3.addRecord(record: ["No", "Water Results", "Value"])
        for i in 0...WaterRationArr.count - 1 {
            labelsMatrixView3.addRecord(record: [String(i), WaterRationArr[i], String(requirments.waterArrayFinal[i])])
        }
        
        // second ration
        self.labelsMatrixView4 = NALLabelsMatrixView(frame: CGRect.init(x: self.fifthView.frame.origin.x, y: 0, width: self.fifthView.frame.size.width - 20, height: self.fifthView.frame.size.height), columns: [60, Int(self.fifthView.frame.size.width - 80) / 2 , Int(self.fifthView.frame.size.width - 80) / 2])
        self.fifthView.addSubview(self.labelsMatrixView4)
        labelsMatrixView4.addRecord(record: ["No", "Premix Results", "Value"])
        for i in 0...PremixArr.count - 1 {
            labelsMatrixView4.addRecord(record: [String(i), PremixArr[i], String(requirments.primexArrayFinal[i])])
        }
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
}
