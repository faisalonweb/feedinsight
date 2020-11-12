//
//  ConSupViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 12/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ConSupViewController: UIViewController {
    
    @IBOutlet weak var suptblview: UITableView!
    var companystr1 : String = ""
    var animalgroupstr2 : String = ""
    var datestr3 : String = ""
    var referncestr4 : String = ""
    var ruminanttypestr5 : String = ""
    var preparedbystr6 : String = ""
    var reporttypestr7 : String = ""
    var pscistatestr8 : String = ""
    
    var players = ["Nutrients","P","Ca","Mg","K","S","Na","Cl","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    
    let nutrientNames = ["Nutrients",
                         "Vit. A",
                         "Vit. D3",
                         "Vit. E",
                         "Biotin",
                         "Niacin",
                         "Zn",
                         "Mn",
                         "Cu",
                         "Se",
                         "I",
                         "Co",
                         "Ca",
                         "P",
                         "Mg",
                         "Na",
                         "Cl",
                         "S",
                         "K"]
    
    let nutrientUnits = ["Unit","IU","IU","IU/mg","mg","mg","mg","mg","mg","mg","mg","mg","gm","gm","gm","gm","gm","gm","gm"]
    
    var percentageArray = [Double]()
    
    
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
extension ConSupViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nutrientNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == suptblview,
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
                cell.nutrientTotal?.text = "Total"
                return cell
            }
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red: 169/255, green: 169/255.0, blue: 169/255.0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor.white
            }
            cell.nutrientNames?.text = nutrientNames[indexPath.row]
            cell.nutrientUnits?.text = nutrientUnits[indexPath.row]
            
            if(fromDatabase == "yes") {
                var value : Double = rationArray[indexPath.row - 1]
                value = value.roundToDecimal(1)
                var stringValue = String(value)
                stringValue = value.removeZerosFromEnd()
                cell.nutrientFeed?.text = stringValue
                
                var value1 : Double = premixArray[indexPath.row - 1]
                value1 = value1.roundToDecimal(1)
                var stringValue1 = String(value1)
                stringValue1 = value1.removeZerosFromEnd()
                cell.nutrientPremix?.text = stringValue1
                var value4 : Double = 0.0
                if(indexPath.row > 7) {
                    value4 = 0.0
                    cell.nutrientWater?.text = "0.0"
                } else {
                    var value2 : Double = waterArray[indexPath.row - 1]
                    value2 = value2.roundToDecimal(1)
                    value4 = value2
                    
                    let stringValue2 = String(value2)
                    cell.nutrientWater?.text = stringValue2
                }
                
                var value3 : Double = value + value1 + value4
                value3 = value3.roundToDecimal(1)
                var stringValue3 = String(value3)
                stringValue3 = value3.removeZerosFromEnd()
                cell.nutrientTotal?.text = stringValue3
            } else {
                var value : Double = Requirments.shared().rationArrayFinal[indexPath.row - 1]
                value = value.roundToDecimal(1)
                var stringValue = String(value)
                stringValue = value.removeZerosFromEnd()
                cell.nutrientFeed?.text = stringValue
                
                var value1 : Double = Requirments.shared().primexArrayFinal[indexPath.row - 1]
                value1 = value1.roundToDecimal(1)
                var stringValue1 = String(value1)
                stringValue1 = value1.removeZerosFromEnd()
                cell.nutrientPremix?.text = stringValue1
                var value4 : Double = 0.0
                if(indexPath.row > 7) {
                    value4 = 0.0
                    cell.nutrientWater?.text = "0.0"
                } else {
                    var value2 : Double = Requirments.shared().waterArrayFinal[indexPath.row - 1]
                    value2 = value2.roundToDecimal(1)
                    value4 = value2
                    
                    let stringValue2 = String(value2)
                    cell.nutrientWater?.text = stringValue2
                }
                
                var value3 : Double = value + value1 + value4
                value3 = value3.roundToDecimal(1)
                var stringValue3 = String(value3)
                stringValue3 = value3.removeZerosFromEnd()
                cell.nutrientTotal?.text = stringValue3
            }
            cell.layer.cornerRadius = 10
            return cell
        }
        return UITableViewCell()
    }
    
}
