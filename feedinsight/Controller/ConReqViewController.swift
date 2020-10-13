//
//  ConReqViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 12/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ConReqViewController: UIViewController {

    @IBOutlet weak var reqtblview: UITableView!
    var fromDatabase : String = ""
    var nutrientNames = ["Nutrients","P","Ca","Mg","K","S","Na","Cl","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    var requiredArray = [Double]()
    var percentageArray = [Double]()
    
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


extension ConReqViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nutrientNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == reqtblview,
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellreq") as? NewPDFTableViewCell {
            if (indexPath.row == 0) {
                cell.layer.cornerRadius = 10
                cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                cell.nutrientUnit?.text = "Unit"
                cell.nutrientUnit?.textColor = UIColor.white
                cell.nutrientValue?.textColor = UIColor.white
                cell.nutrientValue?.text = "Total"
                cell.nutrientName?.textColor = UIColor.white
                return cell
            }
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red: 169/255, green: 169/255.0, blue: 169/255.0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor.white
            }
            cell.nutrientName?.text = nutrientNames[indexPath.row]
            
            if(fromDatabase == "yes") {
                var value : Double = requiredArray[indexPath.row - 1]
                value = value.roundToDecimal(1)
                let stringValue = String(value)
                cell.nutrientValue?.text = stringValue
            } else {
                var value : Double = Requirments.shared().reqArrayFinal[indexPath.row - 1]
                value = value.roundToDecimal(1)
                let stringValue = String(value)
                cell.nutrientValue?.text = stringValue
            }
            
            
            cell.layer.cornerRadius = 10
            return cell
        }
        
        return UITableViewCell()
        
    }

}
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}



