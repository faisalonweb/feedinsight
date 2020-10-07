//
//  PDFViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController{
    
    
    @IBOutlet weak var barchartview: BarChartView!
    
    @IBOutlet weak var reqtblview: UITableView!
    @IBOutlet weak var supplytblview: UITableView!
    
    @IBOutlet weak var balancetblview: UITableView!
    @IBOutlet weak var gaugeView: UIView!
    
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
        self.addGaugeView()
        
    }
    
    func addGaugeView() {
        // Create new Rect
        var frm: CGRect = self.gaugeView.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = frm.size.width
        frm.size.height = frm.size.height
        
        let widthNew = (frm.size.width - 30) / 3
        
        let test = GaugeView(frame: CGRect(x: 0, y: 10, width: widthNew, height: widthNew))
        test.backgroundColor = .clear
        self.gaugeView.addSubview(test)
        
        let test1 = GaugeView(frame: CGRect(x: widthNew + 1, y: 10, width: widthNew, height: widthNew))
        test1.backgroundColor = .clear
        self.gaugeView.addSubview(test1)
        
        let test2 = GaugeView(frame: CGRect(x: 2 * widthNew + 1, y: 10, width: widthNew, height: widthNew))
        test2.backgroundColor = .clear
        self.gaugeView.addSubview(test2)
        
        let test3 = GaugeView(frame: CGRect(x: 0, y: 10 + widthNew + 5, width: widthNew, height: widthNew))
        test3.backgroundColor = .clear
        self.gaugeView.addSubview(test3)
        
        let test4 = GaugeView(frame: CGRect(x: widthNew + 1, y: 10 + widthNew + 5, width: widthNew, height: widthNew))
        test4.backgroundColor = .clear
        self.gaugeView.addSubview(test4)
        
        let test5 = GaugeView(frame: CGRect(x: 0 + 2 * widthNew + 1, y: 10 + widthNew + 5, width: widthNew, height: widthNew))
        test5.backgroundColor = .clear
        self.gaugeView.addSubview(test5)
        
        let test6 = GaugeView(frame: CGRect(x: 0, y: 10 + 2 * widthNew + 5, width: widthNew, height: widthNew))
        test6.backgroundColor = .clear
        self.gaugeView.addSubview(test6)
        
        let test7 = GaugeView(frame: CGRect(x: 0 + widthNew + 1, y: 10 + 2 * widthNew + 5, width: widthNew, height: widthNew))
        test7.backgroundColor = .clear
        self.gaugeView.addSubview(test7)
        
        let test8 = GaugeView(frame: CGRect(x: 0 + 2 * widthNew + 1, y: 10 + 2 * widthNew + 5, width: widthNew, height: widthNew))
        test8.backgroundColor = .clear
        self.gaugeView.addSubview(test8)
        
        let test9 = GaugeView(frame: CGRect(x: 0, y: 10 + 3 * widthNew + 5, width: widthNew, height: widthNew))
        test9.backgroundColor = .clear
        self.gaugeView.addSubview(test9)
        
        let test10 = GaugeView(frame: CGRect(x: 0 + widthNew + 1, y: 10 + 3 * widthNew + 5, width: widthNew, height: widthNew))
        test10.backgroundColor = .clear
        self.gaugeView.addSubview(test10)
        
        let test11 = GaugeView(frame: CGRect(x: 0 + 2 * widthNew + 1, y: 10 + 3 * widthNew + 5, width: widthNew, height: widthNew))
        test11.backgroundColor = .clear
        self.gaugeView.addSubview(test11)
        
        let test12 = GaugeView(frame: CGRect(x: 0, y: 10 + 4 * widthNew + 5, width: widthNew, height: widthNew))
        test12.backgroundColor = .clear
        self.gaugeView.addSubview(test12)
        
        let test13 = GaugeView(frame: CGRect(x: 0 + widthNew + 1, y: 10 + 4 * widthNew + 5, width: widthNew, height: widthNew))
        test13.backgroundColor = .clear
        self.gaugeView.addSubview(test13)
        
        let test14 = GaugeView(frame: CGRect(x: 0 + 2 * widthNew + 1, y: 10 + 4 * widthNew + 5, width: widthNew, height: widthNew))
        test14.backgroundColor = .clear
        self.gaugeView.addSubview(test14)
        
        let test15 = GaugeView(frame: CGRect(x: 0, y: 10 + 5 * widthNew + 5, width: widthNew, height: widthNew))
        test15.backgroundColor = .clear
        self.gaugeView.addSubview(test15)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                // Pa
                // 0 , 225
                var value : Double = 1000
                test.value1 = value.roundToDecimal(1)
                value = value / 225
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1) {
                // Ca
                // 0 , 500
                var value : Double = 245
                test1.value1 = value.roundToDecimal(1)
                value = value / 500
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test1.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Mg
                // 0 , 1375
                var value : Double = 245
                test2.value1 = value.roundToDecimal(1)
                value = value / 1375
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test2.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                // Potassium
                // 0 , 400
                var value : Double = 245
                test3.value1 = value.roundToDecimal(1)
                value = value / 400
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test3.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1) {
                // Sodium
                // 0 , 500
                var value : Double = 245
                test4.value1 = value.roundToDecimal(1)
                value = value / 500
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test4.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Chloride
                // 0 , 1625
                var value : Double = 245
                test5.value1 = value.roundToDecimal(1)
                value = value / 1625
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test5.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                // Sulfur
                // 0 , 200
                var value : Double = 245
                test6.value1 = value.roundToDecimal(1)
                value = value / 200
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test6.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1) {
                // Zinc
                // 0 , 1125
                var value : Double = 245
                test7.value1 = value.roundToDecimal(1)
                value = value / 1125
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test7.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Manganese
                // 0 , 3750
                var value : Double = 245
                test8.value1 = value.roundToDecimal(1)
                value = value / 3750
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test8.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                // Copper
                // 0 , 375
                var value : Double = 245
                test9.value1 = value.roundToDecimal(1)
                value = value / 375
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test9.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1) {
                // Selenium
                // 0 , 1750
                var value : Double = 245
                test10.value1 = value.roundToDecimal(1)
                value = value / 1750
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test10.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Cobalt
                // 0 , 3750
                var value : Double = 245
                test11.value1 = value.roundToDecimal(1)
                value = value / 3750
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test11.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Iodine
                // 0 , 1000
                var value : Double = 245
                test12.value1 = value.roundToDecimal(1)
                value = value / 1000
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test12.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Vitamin E
                // 0 , 200
                var value : Double = 245
                test13.value1 = value.roundToDecimal(1)
                value = value / 200
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test13.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Vitamin D
                // 0 , 225
                var value : Double = 245
                test14.value1 = value.roundToDecimal(1)
                value = value / 225
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test14.value = value
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                // Vitamin A
                // 0 , 1950
                var value : Double = 245
                test15.value1 = value.roundToDecimal(1)
                value = value / 1950
                value = value * 100
                if(value > 100.0) {
                    value = 105.0
                }
                value = value.roundToDecimal(1)
                test15.value = value
            }
        }
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
            cell.nutrientValue?.text = nutrientValues[indexPath.row]
            cell.layer.cornerRadius = 10
            return cell
        } else if tableView == supplytblview,
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
            cell.nutrientTotal?.text = nutrientValues[indexPath.row]
            cell.layer.cornerRadius = 10
            return cell
        }
        else if tableView == balancetblview,
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellbal") as? BalanceTableViewCell {
            if (indexPath.row == 0) {
                cell.layer.cornerRadius = 10
                cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                cell.nutreintUnits?.text = "Unit"
                cell.nutreintUnits?.textColor = UIColor.white
                cell.nutrientValues?.textColor = UIColor.white
                cell.nutrientPercent?.textColor = UIColor.white
                cell.nutrientNames?.textColor =  UIColor.white
                cell.nutrientValues?.text = "Total"
                return cell
            }
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red: 169/255, green: 169/255.0, blue: 169/255.0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor.white
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
