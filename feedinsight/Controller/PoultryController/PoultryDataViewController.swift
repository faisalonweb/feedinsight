//
//  PoultryDataViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 17/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class PoultryDataViewController: UIViewController {

    @IBOutlet weak var reqtblview: UITableView!
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
                          Requirments.shared().poultryIron,]
    
    let nutrientUnits = ["Unit","IU","IU","IU/mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg", "mg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTable),
                                               name: NSNotification.Name(rawValue: "updateTableData"),
                                               object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func updateTable(notification: NSNotification) {
        nutrientValues = ["Values",
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
        self.reqtblview.reloadData()
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

extension PoultryDataViewController: UITableViewDelegate , UITableViewDataSource{
    
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
        if tableView == reqtblview,
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellreq") as? NewPDFTableViewCell {
            if (indexPath.row == 0) {
                cell.layer.cornerRadius = 10
                cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                cell.nutrientUnit?.text = "Unit"
                cell.nutrientUnit?.textColor = UIColor.white
                cell.nutrientValue?.textColor = UIColor.white
                cell.nutrientValue?.text = "Value"
                cell.nutrientName?.textColor = UIColor.white
                return cell
            }
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red: 169/255, green: 169/255.0, blue: 169/255.0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor.white
            }
            cell.nutrientName?.text = nutrientNames[indexPath.row]
            cell.nutrientUnit?.text = nutrientUnits[indexPath.row]
            if(nutrientValues[indexPath.row] == "") {
                cell.nutrientValue?.text = "0"
            } else {
                cell.nutrientValue?.text = toString(nutrientValues[indexPath.row])
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
