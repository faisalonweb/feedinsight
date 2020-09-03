//
//  ResultsViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 03/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var secView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    var RationArr = ["Dry Matter%","Ca","P","P (Abs)" ,"Mg", "Mg(Abs)" , "K","S","Na","Cl","Fe","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    var WaterRationArr = ["P","Ca","Mg", "K","S","Na","Cl"]
    var requirmentsArr = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vitamin A","Vitamin D3","Vitamin E","Niacin B3","Biotin B7"]
    var PremixArr = ["P","Ca","Mg","K","Mg","K","Na","Cl","S","Co","Cu(Inorganic)","Cu(Organic)","Se(inorganic)","Se(Organic)","Zn(Inorganic)","Zn(Organic)","AIU","DIU","EIU","Niacin(mg)","Biotin(mg)"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
         profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        var yvalue = 35
        for n in 0...17 {
            let label = UILabel(frame: CGRect(x: 0, y: yvalue, width: 200, height: 15))
            label.textAlignment = NSTextAlignment.center
            label.text = requirmentsArr[n]
            self.secView.addSubview(label)
            yvalue = yvalue + 16
            print(n)
        }
        yvalue = 35
        for n in 0...17 {
            let label = UILabel(frame: CGRect(x: 220, y: yvalue, width: 200, height: 15))
            label.textAlignment = NSTextAlignment.center
            label.text = "Value"
            self.secView.addSubview(label)
            yvalue = yvalue + 16
            print(n)
        }
        yvalue = 35
        for n in 0...21 {
            let label = UILabel(frame: CGRect(x: 0, y: yvalue, width: 200, height: 15))
            label.textAlignment = NSTextAlignment.center
            label.text = RationArr[n]
            self.thirdView.addSubview(label)
            yvalue = yvalue + 16
            print(n)
        }
        yvalue = 35
        for n in 0...21 {
            let label = UILabel(frame: CGRect(x: 210, y: yvalue, width: 200, height: 15))
            label.textAlignment = NSTextAlignment.center
            label.text = "Value"
            self.thirdView.addSubview(label)
            yvalue = yvalue + 16
            print(n)
        }
        yvalue = 35
               for n in 0...6 {
                   let label = UILabel(frame: CGRect(x: 0, y: yvalue, width: 200, height: 15))
                   label.textAlignment = NSTextAlignment.center
                   label.text = WaterRationArr[n]
                   self.fourthView.addSubview(label)
                   yvalue = yvalue + 16
                   print(n)
               }
               yvalue = 35
               for n in 0...6 {
                   let label = UILabel(frame: CGRect(x: 210, y: yvalue, width: 200, height: 15))
                   label.textAlignment = NSTextAlignment.center
                   label.text = "Value"
                   self.fourthView.addSubview(label)
                   yvalue = yvalue + 16
                   print(n)
               }
        yvalue = 35
               for n in 0...20 {
                   let label = UILabel(frame: CGRect(x: 0, y: yvalue, width: 200, height: 15))
                   label.textAlignment = NSTextAlignment.center
                   label.text = PremixArr[n]
                   self.fifthView.addSubview(label)
                   yvalue = yvalue + 16
                   print(n)
               }
               yvalue = 35
               for n in 0...20 {
                   let label = UILabel(frame: CGRect(x: 210, y: yvalue, width: 200, height: 15))
                   label.textAlignment = NSTextAlignment.center
                   label.text = "Value"
                   self.fifthView.addSubview(label)
                   yvalue = yvalue + 16
                   print(n)
               }
               
               
        
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
}
