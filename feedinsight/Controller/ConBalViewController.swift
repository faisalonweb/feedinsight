//
//  ConBalViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 12/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

var percentageArray = [Double]()
class ConBalViewController: UIViewController {
    
    @IBOutlet weak var baltblview: UITableView!
    // initilaze report parameters
    
    var companystr1 : String = ""
    var animalgroupstr2 : String = ""
    var datestr3 : String = ""
    var referncestr4 : String = ""
    var ruminanttypestr5 : String = ""
    var preparedbystr6 : String = ""
    var reporttypestr7 : String = ""
    var pscistatestr8 : String = ""
    
    var nutrientNames = ["Nutrients","P","Ca","Mg","K","S","Na","Cl","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    
    let players = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vit. A","Vit. D3","Vit. E","Niacin","Biotin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension ConBalViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nutrientNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == baltblview,
           let cell = tableView.dequeueReusableCell(withIdentifier: "supplycell") as? SupplyPDFTableViewCell {
            if (indexPath.row == 0) {
                cell.layer.cornerRadius = 10
                cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                cell.nutrientUnits?.text = "Unit"
                cell.nutrientUnits?.textColor = UIColor.white
                cell.nutrientTotal?.textColor = UIColor.white
                cell.nutrientPremix?.textColor = UIColor.white
                cell.nutrientFeed?.textColor = UIColor.white
                cell.nutrientWater?.textColor = UIColor.white
                cell.nutrientNames?.textColor = UIColor.white
                cell.nutrientTotal?.text = "Percent %"
                return cell
            }
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red: 169/255, green: 169/255.0, blue: 169/255.0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor.white
            }
            if(fromDatabase == "yes") {
                var value : Double = requiredArray[indexPath.row - 1]
                value = value.roundToDecimal(1)
                let stringValue = String(value)
                cell.nutrientFeed?.text = stringValue
                
                let value1 : Double = rationArray[indexPath.row - 1]
                let value2 : Double = premixArray[indexPath.row - 1]
                var value3 : Double = 0.0
                if(indexPath.row > 7) {
                    value3 = 0.0
                } else {
                    let value : Double = waterArray[indexPath.row - 1]
                    value3 = value
                }
                var value4 : Double = value1 + value2 + value3
                value4 = value4.roundToDecimal(1)
                let stringValue1 = String(value4)
                cell.nutrientPremix?.text = stringValue1
                
                var value5 : Double = value4 - value
                value5 = value5.roundToDecimal(1)
                cell.nutrientNames?.text = nutrientNames[indexPath.row]
                cell.nutrientWater?.text = String(value5)
                var percent : Double = (value4/value) * 100
                percent = percent.roundToDecimal(1)
                percentageArray.append(percent)
                cell.nutrientTotal?.text = String(percent)
                if(indexPath.row == 17) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "addGuageView"), object: nil)
                }
            } else {
                
                var value : Double = Requirments.shared().reqArrayFinal[indexPath.row - 1]
                value = value.roundToDecimal(1)
                let stringValue = String(value)
                cell.nutrientFeed?.text = stringValue
                
                let value1 : Double = Requirments.shared().rationArrayFinal[indexPath.row - 1]
                let value2 : Double = Requirments.shared().primexArrayFinal[indexPath.row - 1]
                var value3 : Double = 0.0
                if(indexPath.row > 7) {
                    value3 = 0.0
                } else {
                    let value : Double = Requirments.shared().waterArrayFinal[indexPath.row - 1]
                    value3 = value
                }
                var value4 : Double = value1 + value2 + value3
                value4 = value4.roundToDecimal(1)
                let stringValue1 = String(value4)
                cell.nutrientPremix?.text = stringValue1
                
                var value5 : Double = value4 - value
                value5 = value5.roundToDecimal(1)
                cell.nutrientNames?.text = nutrientNames[indexPath.row]
                cell.nutrientWater?.text = String(value5)
                var percent : Double = (value4/value) * 100
                percent = percent.roundToDecimal(1)
                percentageArray.append(percent)
                cell.nutrientTotal?.text = String(percent)
                if(indexPath.row == 17) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "addGuageView"), object: nil)
                }
            }
            cell.layer.cornerRadius = 10
            return cell
        }
        return UITableViewCell()
    }
    
}
