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
    @IBOutlet weak var secView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    var RationArr = ["Dry Matter%","Ca","P","P (Abs)" ,"Mg", "Mg(Abs)" , "K","S","Na","Cl","Fe","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    var WaterRationArr = ["P","Ca","Mg", "K","S","Na","Cl"]
    var requirmentsArr = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vitamin A","Vitamin D3","Vitamin E","Niacin B3","Biotin B7"]
    var PremixArr = ["P","Ca","Mg","K","Mg","K","Na","Cl","S","Co","Cu(Inorganic)","Cu(Organic)","Se(inorganic)","Se(Organic)","Zn(Inorganic)","Zn(Organic)","AIU","DIU","EIU","Niacin(mg)","Biotin(mg)"]
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        self.labelsMatrixView1 = NALLabelsMatrixView(frame: CGRect.init(x: self.secView.frame.origin.x, y: 0, width: self.secView.frame.size.width - 20, height: self.secView.frame.size.height), columns: [60, Int(self.secView.frame.size.width - 80) / 2 , Int(self.secView.frame.size.width - 80) / 2])
        self.secView.addSubview(self.labelsMatrixView1)
        labelsMatrixView1.addRecord(record: ["No", "Requirments", "Value"])
        for i in 0...requirmentsArr.count - 1 {
            labelsMatrixView1.addRecord(record: [String(i), requirmentsArr[i], "Value"])
        }
        
        // second ration
        self.labelsMatrixView2 = NALLabelsMatrixView(frame: CGRect.init(x: self.secView.frame.origin.x, y: 0, width: self.secView.frame.size.width - 20, height: self.secView.frame.size.height), columns: [60, Int(self.secView.frame.size.width - 80) / 2 , Int(self.secView.frame.size.width - 80) / 2])
        self.secView.addSubview(self.labelsMatrixView2)
        labelsMatrixView2.addRecord(record: ["No", "Requirments", "Value"])
        for i in 0...RationArr.count - 1 {
            labelsMatrixView2.addRecord(record: [String(i), RationArr[i], "Value"])
        }
        
        // second ration
        self.labelsMatrixView3 = NALLabelsMatrixView(frame: CGRect.init(x: self.secView.frame.origin.x, y: 0, width: self.secView.frame.size.width - 20, height: self.secView.frame.size.height), columns: [60, Int(self.secView.frame.size.width - 80) / 2 , Int(self.secView.frame.size.width - 80) / 2])
        self.secView.addSubview(self.labelsMatrixView3)
        labelsMatrixView3.addRecord(record: ["No", "Requirments", "Value"])
        for i in 0...WaterRationArr.count - 1 {
            labelsMatrixView3.addRecord(record: [String(i), WaterRationArr[i], "Value"])
        }
        
        // second ration
        self.labelsMatrixView4 = NALLabelsMatrixView(frame: CGRect.init(x: self.secView.frame.origin.x, y: 0, width: self.secView.frame.size.width - 20, height: self.secView.frame.size.height), columns: [60, Int(self.secView.frame.size.width - 80) / 2 , Int(self.secView.frame.size.width - 80) / 2])
        self.secView.addSubview(self.labelsMatrixView4)
        labelsMatrixView4.addRecord(record: ["No", "Requirments", "Value"])
        for i in 0...PremixArr.count - 1 {
            labelsMatrixView4.addRecord(record: [String(i), PremixArr[i], "Value"])
        }
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
}
