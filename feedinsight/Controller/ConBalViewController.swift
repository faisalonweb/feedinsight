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
                         "Ca*",
                         "P*",
                         "Mg*",
                         "Na",
                         "Cl",
                         "S",
                         "K"]
    
    let nutrientUnits = ["Unit","IU","IU","IU/mg","mg","mg","mg","mg","mg","mg","mg","mg","gm","gm","gm","gm","gm","gm","gm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
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
            cell.nutrientNames?.text = nutrientNames[indexPath.row]
            cell.nutrientUnits?.text = nutrientUnits[indexPath.row]
            if(fromDatabase == "yes") {
                var value : Double = requiredArray[indexPath.row - 1]
                value = value.roundToDecimal(1)
                var stringValue = String(value)
                stringValue = value.removeZerosFromEnd()
                cell.nutrientFeed?.text = stringValue
                
                let value1 : Double = rationArray[indexPath.row - 1]
                let value2 : Double = premixArray[indexPath.row - 1]
                var value3 : Double = 0.0
                let valueh : Double = waterArray[indexPath.row - 1]
                value3 = valueh
                var value4 : Double = value1 + value2 + value3
                value4 = value4.roundToDecimal(1)
                var stringValue1 = String(value4)
                stringValue1 = value4.removeZerosFromEnd()
                cell.nutrientPremix?.text = stringValue1
                
                var value5 : Double = value4 - value
                value5 = value5.roundToDecimal(1)
                cell.nutrientWater?.text = String(value5.removeZerosFromEnd())
                var percent : Double = (value4/value) * 100
                percent = percent.roundToDecimal(1)
                percentageArray.append(percent)
                
                if(percent < 100.0) {
                    cell.nutrientTotal?.textColor = UIColor.systemRed
                    cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                } else {
                    if(indexPath.row == 1) {
                        if(percent > 1107.7) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 2) {
                        if(percent > 169.2) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 3) {
                        if(percent > 135.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 4) {
                        if(percent > 0.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 5) {
                        if(percent > 0.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 6) {
                        if(percent > 909.1) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 7) {
                        if(percent > 3636.4) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 8) {
                        if(percent > 333.3) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 9) {
                        if(percent > 1470.6) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 10) {
                        if(percent > 7142.9) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 11) {
                        if(percent > 3333.3) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 12) {
                        if(percent > 436.4) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 13) {
                        if(percent > 255.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 14) {
                        if(percent > 1012.9) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 15) {
                        if(percent > 160.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 16) {
                        if(percent > 1153.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 17) {
                        if(percent > 400.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 18) {
                        if(percent > 200.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    }
                }
                
//                if(indexPath.row == 18) {
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: "addGuageView"), object: nil)
//                }
            } else {
                
                var value : Double = Requirments.shared().reqArrayFinal[indexPath.row - 1]
                value = value.roundToDecimal(1)
                let stringValue = String(value.removeZerosFromEnd())
                cell.nutrientFeed?.text = stringValue
                
                let value1 : Double = Requirments.shared().rationArrayFinal[indexPath.row - 1]
                let value2 : Double = Requirments.shared().primexArrayFinal[indexPath.row - 1]
                var value3 : Double = 0.0
                let valuen : Double = Requirments.shared().waterArrayFinal[indexPath.row - 1]
                value3 = valuen
                var value4 : Double = value1 + value2 + value3
                value4 = value4.roundToDecimal(1)
                let stringValue1 = String(value4.removeZerosFromEnd())
                cell.nutrientPremix?.text = stringValue1
                
                var value5 : Double = value4 - value
                value5 = value5.roundToDecimal(1)
                
                cell.nutrientWater?.text = String(value5.removeZerosFromEnd())
                var percent : Double = (value4/value) * 100
                percent = percent.roundToDecimal(1)
                percentageArray.append(percent)
                if(percent < 100.0) {
                    cell.nutrientTotal?.textColor = UIColor.systemRed
                    cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                } else {
                    if(indexPath.row == 1) {
                        if(percent > 1107.7) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 2) {
                        if(percent > 169.2) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 3) {
                        if(percent > 135.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 4) {
                        if(percent > 0.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 5) {
                        if(percent > 0.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 6) {
                        if(percent > 909.1) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 7) {
                        if(percent > 3636.4) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 8) {
                        if(percent > 333.3) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 9) {
                        if(percent > 1470.6) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 10) {
                        if(percent > 7142.9) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 11) {
                        if(percent > 3333.3) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 12) {
                        if(percent > 436.4) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 13) {
                        if(percent > 255.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 14) {
                        if(percent > 1012.9) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 15) {
                        if(percent > 160.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 16) {
                        if(percent > 1153.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 17) {
                        if(percent > 400.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    } else if(indexPath.row == 18) {
                        if(percent > 200.0) {
                            cell.nutrientTotal?.textColor = UIColor.black
                            let mainString = String(percent.removeZerosFromEnd()) + " !"
                            let stringToColor = "!"
                            let range = (mainString as NSString).range(of: stringToColor)
                            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
                            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: range)
                            cell.nutrientTotal?.attributedText = mutableAttributedString
                        } else {
                            cell.nutrientTotal?.textColor = UIColor.black
                            cell.nutrientTotal?.text = String(percent.removeZerosFromEnd())
                        }
                    }
                }
                
//                if(indexPath.row == 18) {
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: "addGuageView"), object: nil)
//                }
            }
            cell.layer.cornerRadius = 10
            return cell
        }
        return UITableViewCell()
    }
    
}
