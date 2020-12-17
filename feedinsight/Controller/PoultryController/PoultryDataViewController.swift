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
    
    let nutrientValues = [10,
                          12000,
                          5000,
                          80,
                          3.2,
                          3.2,
                          8.6,
                          65,
                          20,
                          4.3,
                          0.22,
                          2.2,
                          0.017,
                          110,
                          120,
                          16,
                          1.25,
                          0.3,
                          0,
                          20]
    
    let nutrientUnits = ["Unit","IU","IU","IU/mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg","mg", "mg"]
    
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

extension PoultryDataViewController: UITableViewDelegate , UITableViewDataSource{
    
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
            var value : Double = Double(nutrientValues[indexPath.row])
            value = value.roundToDecimal(1)
            var stringValue = String(value)
            stringValue = value.removeZerosFromEnd()
            cell.nutrientValue?.text = stringValue
            cell.layer.cornerRadius = 10
            return cell
        }
        
        return UITableViewCell()
        
    }

}
