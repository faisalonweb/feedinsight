//
//  PoultryThreeRowsComparisonViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 23/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class PoultryThreeRowsComparisonViewController: UIViewController {
    @IBOutlet weak var suptblview: UITableView!
    let nutrientNames = ["Nutrients",
                         "Vitamin A",
                         "Vitamin D3",
                         "Vitamin E",
                         "Vitamin K",
                         "Vitamin B1",
                         "Vitamin B2",
                         "Vitamin B3",
                         "Vitamin B5",
                         "Vitamin B6",
                         "Vitamin B7",
                         "Vitamin B9",
                         "Vitamin B12",
                         "Zinc",
                         "Manganese",
                         "Copper",
                         "Iodine",
                         "Selenium",
                         "Cobalt",
                         "Iron",
    ]
    
    @IBOutlet weak var p1Constraint: NSLayoutConstraint!
    @IBOutlet weak var p2Constraint: NSLayoutConstraint!
    @IBOutlet weak var p3Constraint: NSLayoutConstraint!
    
    var nutrientValues = ["Values",
                          Requirments.shared().poultryVitaminA,
                          Requirments.shared().poultryVitaminD3,
                          Requirments.shared().poultryVitaminE,
                          Requirments.shared().poultryVitaminK,
                          Requirments.shared().poultryVitaminB1,
                          Requirments.shared().poultryVitaminB2,
                          Requirments.shared().poultryVitaminB3,
                          Requirments.shared().poultryVitaminB5,
                          Requirments.shared().poultryVitaminB6,
                          Requirments.shared().poultryVitaminB7,
                          Requirments.shared().poultryVitaminB9,
                          Requirments.shared().poultryVitaminB12,
                          Requirments.shared().poultryZInc,
                          Requirments.shared().poultryManganese,
                          Requirments.shared().poultryCopper,
                          Requirments.shared().poultryIodine,
                          Requirments.shared().poultrySelenium,
                          Requirments.shared().poultryCobalt,
                          Requirments.shared().poultryIron]
    
    let nutrientUnits = ["Unit","IU","IU","IU/mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg", "mg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PoultryThreeRowsComparisonViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 60
        } else {
            return 32
        }
        
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
                for i in 0 ..< Requirments.shared().selectedPoultryArray.count {
                    if(i == 0) {
                        cell.nutrientFeed?.text = Requirments.shared().selectedPoultryArray[i]
                    } else if(i == 1) {
                        cell.nutrientPremix?.text = Requirments.shared().selectedPoultryArray[i]
                    } else if(i == 2) {
                        cell.nutrientWater?.text = Requirments.shared().selectedPoultryArray[i]
                    } else if(i == 3) {
                        cell.nutrientTotal?.text = Requirments.shared().selectedPoultryArray[i]
                    }
                }
                cell.nutrientUnits?.textColor = UIColor.white
                cell.nutrientTotal?.textColor = UIColor.white
                cell.nutrientPremix?.textColor = UIColor.white
                cell.nutrientFeed?.textColor = UIColor.white
                cell.nutrientWater?.textColor = UIColor.white
                cell.nutrientNames?.textColor = UIColor.white
                return cell
            }
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red: 169/255, green: 169/255.0, blue: 169/255.0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor.white
            }
            cell.nutrientNames?.text = nutrientNames[indexPath.row]
            cell.nutrientUnits?.text = nutrientUnits[indexPath.row]
            for i in 0 ..< Requirments.shared().selectedPoultryArray.count {
                if(i == 0) {
                    if(toString(Requirments.shared().selectedPoultryArrayValues[0][indexPath.row - 1]) == "") {
                        cell.nutrientFeed?.text = "0"
                    } else {
                        cell.nutrientFeed?.text = toString(Requirments.shared().selectedPoultryArrayValues[0][indexPath.row - 1])
                    }
                } else if(i == 1) {
                    if(toString(Requirments.shared().selectedPoultryArrayValues[1][indexPath.row - 1]) == "") {
                        cell.nutrientPremix?.text = "0"
                    } else {
                        cell.nutrientPremix?.text = toString(Requirments.shared().selectedPoultryArrayValues[1][indexPath.row - 1])
                    }
                } else if(i == 2) {
                    if(toString(Requirments.shared().selectedPoultryArrayValues[2][indexPath.row - 1]) == "") {
                        cell.nutrientWater?.text = "0"
                    } else {
                        cell.nutrientWater?.text = toString(Requirments.shared().selectedPoultryArrayValues[2][indexPath.row - 1])
                    }
                    cell.nutrientWater?.text = toString(Requirments.shared().selectedPoultryArrayValues[2][indexPath.row - 1])
                } else if(i == 3) {
                    if(toString(Requirments.shared().selectedPoultryArrayValues[3][indexPath.row - 1]) == "") {
                        cell.nutrientTotal?.text = "0"
                    } else {
                        cell.nutrientTotal?.text = toString(Requirments.shared().selectedPoultryArrayValues[3][indexPath.row - 1])
                    }
                }
            }
            if(Requirments.shared().selectedPoultryArray.count == 2) {
                cell.nutrientWater?.text = "0"
                cell.nutrientTotal?.text = "0"
            } else if(Requirments.shared().selectedPoultryArray.count == 3) {
                cell.nutrientTotal?.text = "0"
            }
            
            cell.layer.cornerRadius = 10
            return cell
        }
        return UITableViewCell()
    }
    
    func toString(_ value: Any?) -> String {
      return String(describing: value ?? "0.0")
    }
}
