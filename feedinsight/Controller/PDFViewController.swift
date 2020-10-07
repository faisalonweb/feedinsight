//
//  PDFViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController{
    
    

    @IBOutlet weak var reqtblview: UITableView!
    @IBOutlet weak var supplytblview: UITableView!
    
    @IBOutlet weak var balancetblview: UITableView!
    
    @IBOutlet weak var viewRound: UIView!
    var nutrientNames = ["Nutrients","Phosphorus","Calcium","Phosphrous","Potasium","Phosphrous","Phosphorus","Magensium","Potasium","Calcium","Phosphrous","Phosphrous","Magensium","Potasium","Calcium","Potasium","Calcium","Magensium","Phosphrous"]
    var nutrientValues = ["Total","54","34","44","45","46","27","56","23","67","87","99","88","45","43","76","93","39","41"]
    var nutrientFeedArr = ["Feed","54","34","44","45","46","27","56","23","67","87","99","88","45","43","76","93","39","41"]
    var nutrientPremixArr = ["Premix","54","34","44","45","46","27","56","23","67","87","99","88","45","43","76","93","39","41"]
    var nutrientWaterArr = ["Water","54","34","44","45","46","27","56","23","67","87","99","88","45","43","76","93","39","41"]
    var nutrientperArr = ["245","245","245","245","245","245","245","245","245","245","245","245","245","245","245","345","345","345","345"]
    
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        
    }
    
  
   

}
extension PDFViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 580/18
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nutrientNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        if tableView == reqtblview,
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellreq") as? NewPDFTableViewCell {
           
            if (indexPath.row == 0) {
                cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                cell.nutrientUnit?.text = "Unit"
                //cell.nutrientName?.text = ""
                cell.nutrientUnit?.textColor = UIColor.white
                cell.nutrientValue?.textColor = UIColor.white
                cell.nutrientValue?.text = "Total"
                cell.nutrientName?.textColor = UIColor.white
                return cell
                
            }
            
            cell.nutrientName?.text = nutrientNames[indexPath.row]
            cell.nutrientValue?.text = nutrientValues[indexPath.row]
            cell.layer.cornerRadius = 10
                return cell
            } else if tableView == supplytblview,
                let cell = tableView.dequeueReusableCell(withIdentifier: "supplycell") as? SupplyPDFTableViewCell {
                
                if (indexPath.row == 0) {
                    cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                    cell.nutrientUnits?.text = "Unit"
                    cell.nutrientUnits?.textColor = UIColor.white
                    cell.nutrientTotal?.textColor = UIColor.white
                    cell.nutrientPremix?.textColor = UIColor.white
                    cell.nutrientFeed?.textColor = UIColor.white
                    cell.nutrientWater?.textColor = UIColor.white
                    cell.nutrientNames?.textColor = UIColor.white
                    cell.nutrientTotal?.text = "Total"
                    return cell
                }
                
                cell.nutrientNames?.text = nutrientNames[indexPath.row]
                cell.nutrientTotal?.text = nutrientValues[indexPath.row]
                cell.layer.cornerRadius = 10
                return cell
            }
            else if tableView == balancetblview,
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellbal") as? BalanceTableViewCell {
                
                if (indexPath.row == 0) {
                    cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                    cell.nutreintUnits?.text = "Unit"
                    cell.nutreintUnits?.textColor = UIColor.white
                    cell.nutrientValues?.textColor = UIColor.white
                    cell.nutrientPercent?.textColor = UIColor.white
                    cell.nutrientNames?.textColor =  UIColor.white
                    cell.nutrientValues?.text = "Total"
                    return cell
                }
                
                cell.nutrientNames?.text = nutrientNames[indexPath.row]
                cell.nutrientValues?.text = nutrientValues[indexPath.row]
                cell.nutrientPercent?.text = nutrientperArr[indexPath.row]
                cell.layer.cornerRadius = 10
                return cell
            }

            return UITableViewCell()
        
    }

}
