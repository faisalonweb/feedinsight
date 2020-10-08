//
//  PDFViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Charts

class PDFViewController: UIViewController{
    
    
    @IBOutlet weak var barchartview: BarChartView!
    @IBOutlet weak var reqtblview: UITableView!
    @IBOutlet weak var supplytblview: UITableView!
    @IBOutlet weak var balancetblview: UITableView!
    @IBOutlet weak var gaugeView: UIView!
    @IBOutlet weak var viewRound: UIView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var ruminantType: UILabel!
    @IBOutlet weak var animalGroup: UILabel!
    @IBOutlet weak var psciState: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var referenceLabel: UILabel!
    @IBOutlet weak var preparedByLabel: UILabel!
    @IBOutlet weak var reportType: UILabel!
    @IBOutlet weak var magOrganic: UILabel!
    @IBOutlet weak var magInorganic: UILabel!
    @IBOutlet weak var magCurrentRatio: UILabel!
    @IBOutlet weak var magRecomRatio: UILabel!
    @IBOutlet weak var selOrganic: UILabel!
    @IBOutlet weak var selInOrganic: UILabel!
    @IBOutlet weak var selCurrentRatio: UILabel!
    @IBOutlet weak var selRecomRatio: UILabel!
    @IBOutlet weak var coOrganic: UILabel!
    @IBOutlet weak var coInOrganic: UILabel!
    @IBOutlet weak var coCurrentRatio: UILabel!
    @IBOutlet weak var coRecomRatio: UILabel!
    @IBOutlet weak var znOrganic: UILabel!
    @IBOutlet weak var znInorganic: UILabel!
    @IBOutlet weak var znCurrentRatio: UILabel!
    @IBOutlet weak var znRecomRatio: UILabel!
    let defaults = UserDefaults(suiteName:"User")
    var reportName : String = ""
    var reportDate : String = ""
    
    
    var nutrientNames = ["Nutrients","P","Ca","Mg","K","S","Na","Cl","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    
    var percentageArray = [Double]()
    
    let players = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vit. A","Vit. D3","Vit. E","Niacin","Biotin"]
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        // Set Data
        self.companyName.text = Requirments.shared().companyName
        self.ruminantType.text = Requirments.shared().animalKind
        self.animalGroup.text = Requirments.shared().animalGroup
        self.psciState.text = Requirments.shared().physiologicalState
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.preparedByLabel.text = userName as? String
        }
        self.reportType.text = "Premix Check"
        
        self.dateLabel.text = self.reportDate
        self.referenceLabel.text = self.reportName
        
        barchartview.animate(yAxisDuration: 1.0)
        barchartview.pinchZoomEnabled = false
        barchartview.drawBarShadowEnabled = false
        barchartview.drawBordersEnabled = false
        barchartview.doubleTapToZoomEnabled = false
        barchartview.drawGridBackgroundEnabled = true
        barchartview.chartDescription?.text = "Bar Chart View"
        setChart(dataPoints: players, values: Requirments.shared().rationArrayFinal.map { Double($0) })

    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barchartview.noDataText = "You need to provide data for the chart."
        barchartview.xAxis.setLabelCount(18, force: true)
        barchartview.xAxis.valueFormatter = IndexAxisValueFormatter(values: players)
        barchartview.xAxis.granularity = 0.5
        barchartview.xAxis.labelPosition = .bottom
        barchartview.xAxis.drawGridLinesEnabled = false
        
        barchartview.leftAxis.enabled = false
        barchartview.rightAxis.granularity = 0.5
        barchartview.rightAxis.axisMinimum = 0.0
        
        
        guard let description = barchartview.chartDescription else {return}
        description.text = ""
        barchartview.leftAxis.drawGridLinesEnabled = false
        barchartview.xAxis.drawGridLinesEnabled = false
        
        let entry1 = BarChartDataEntry(x: 0, yValues: [ Requirments.shared().rationArrayFinal[0],
                                                        Requirments.shared().primexArrayFinal[0],
                                                        Requirments.shared().waterArrayFinal[0]])
        let entry2 = BarChartDataEntry(x: 1, yValues: [ Requirments.shared().rationArrayFinal[1],
                                                        Requirments.shared().primexArrayFinal[1],
                                                        Requirments.shared().waterArrayFinal[1]])
        let entry3 = BarChartDataEntry(x: 2, yValues: [ Requirments.shared().rationArrayFinal[2],
                                                        Requirments.shared().primexArrayFinal[2],
                                                        Requirments.shared().waterArrayFinal[2]])
        let entry4 = BarChartDataEntry(x: 3, yValues: [ Requirments.shared().rationArrayFinal[3],
                                                        Requirments.shared().primexArrayFinal[3],
                                                        Requirments.shared().waterArrayFinal[3]])
        let entry5 = BarChartDataEntry(x: 4, yValues: [ Requirments.shared().rationArrayFinal[4],
                                                        Requirments.shared().primexArrayFinal[4],
                                                        Requirments.shared().waterArrayFinal[4]])
        let entry6 = BarChartDataEntry(x: 5, yValues: [ Requirments.shared().rationArrayFinal[5],
                                                        Requirments.shared().primexArrayFinal[5],
                                                        Requirments.shared().waterArrayFinal[5]])
        let entry7 = BarChartDataEntry(x: 6, yValues: [ Requirments.shared().rationArrayFinal[6],
                                                        Requirments.shared().primexArrayFinal[6],
                                                        Requirments.shared().waterArrayFinal[6]])
        let entry8 = BarChartDataEntry(x: 7, yValues: [ Requirments.shared().rationArrayFinal[7],
                                                        Requirments.shared().primexArrayFinal[7],0])
        let entry9 = BarChartDataEntry(x: 8, yValues: [ Requirments.shared().rationArrayFinal[8],
                                                        Requirments.shared().primexArrayFinal[8],0])
        let entry10 = BarChartDataEntry(x: 9, yValues: [ Requirments.shared().rationArrayFinal[9],
                                                         Requirments.shared().primexArrayFinal[9],0])
        let entry11 = BarChartDataEntry(x: 10, yValues: [ Requirments.shared().rationArrayFinal[10],
                                                          Requirments.shared().primexArrayFinal[10],0])
        let entry12 = BarChartDataEntry(x: 11, yValues: [ Requirments.shared().rationArrayFinal[11],
                                                          Requirments.shared().primexArrayFinal[11],0])
        let entry13 = BarChartDataEntry(x: 12, yValues: [ Requirments.shared().rationArrayFinal[12],
                                                          Requirments.shared().primexArrayFinal[12],0])
        let entry14 = BarChartDataEntry(x: 13, yValues: [ Requirments.shared().rationArrayFinal[13],
                                                          Requirments.shared().primexArrayFinal[13],0])
        let entry15 = BarChartDataEntry(x: 14, yValues: [ Requirments.shared().rationArrayFinal[14],
                                                          Requirments.shared().primexArrayFinal[14],0])
        let entry16 = BarChartDataEntry(x: 15, yValues: [ Requirments.shared().rationArrayFinal[15],
                                                          Requirments.shared().primexArrayFinal[15],0])
        let entry17 = BarChartDataEntry(x: 16, yValues: [ Requirments.shared().rationArrayFinal[16],
                                                          Requirments.shared().primexArrayFinal[16],0])
        let entry18 = BarChartDataEntry(x: 17, yValues: [ Requirments.shared().rationArrayFinal[17],
                                                          Requirments.shared().primexArrayFinal[17],0])
        
        let dataSet = BarChartDataSet(entries: [ entry1, entry2,entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10, entry11, entry12, entry13, entry14, entry15, entry16, entry17, entry18 ], label: nil)
        
        //dataSet.colors = [UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0), UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0)]
        
        dataSet.colors = [UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0), UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0), UIColor(red: 28/255, green: 115/255.0, blue: 193/255.0, alpha: 1.0)]
        let chartData = BarChartData(dataSet: dataSet)
        chartData.setDrawValues(false)
        barchartview.data = chartData
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
                var value : Double = self.percentageArray[0]
                test.value1 = value.roundToDecimal(1)
                test.value2 = "Pa"
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
                var value : Double = self.percentageArray[1]
                test1.value1 = value.roundToDecimal(1)
                test1.value2 = "Ca"
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
                var value : Double = self.percentageArray[2]
                test2.value2 = "Mg"
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
                var value : Double = self.percentageArray[3]
                test3.value1 = value.roundToDecimal(1)
                test3.value2 = "K"
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
                var value : Double = self.percentageArray[4]
                test4.value1 = value.roundToDecimal(1)
                test4.value2 = "Na"
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
                var value : Double = self.percentageArray[5]
                test5.value1 = value.roundToDecimal(1)
                test5.value2 = "Cl"
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
                var value : Double = self.percentageArray[6]
                test6.value1 = value.roundToDecimal(1)
                test6.value2 = "S"
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
                var value : Double = self.percentageArray[7]
                test7.value1 = value.roundToDecimal(1)
                test7.value2 = "Zn"
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
                var value : Double = self.percentageArray[8]
                test8.value1 = value.roundToDecimal(1)
                test8.value2 = "Mn"
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
                var value : Double = self.percentageArray[9]
                test9.value1 = value.roundToDecimal(1)
                test9.value2 = "Cu"
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
                var value : Double = self.percentageArray[10]
                test10.value1 = value.roundToDecimal(1)
                test10.value2 = "Se"
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
                var value : Double = self.percentageArray[11]
                test11.value1 = value.roundToDecimal(1)
                test11.value2 = "Co"
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
                var value : Double = self.percentageArray[12]
                test12.value1 = value.roundToDecimal(1)
                test12.value2 = "I"
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
                var value : Double = self.percentageArray[13]
                test13.value1 = value.roundToDecimal(1)
                test13.value2 = "Vitamin E"
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
                var value : Double = self.percentageArray[14]
                test14.value1 = value.roundToDecimal(1)
                test14.value2 = "Vitamin D"
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
                var value : Double = self.percentageArray[15]
                test15.value1 = value.roundToDecimal(1)
                test15.value2 = "Vitamin A"
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
            var value : Double = Requirments.shared().reqArrayFinal[indexPath.row - 1]
            value = value.roundToDecimal(1)
            let stringValue = String(value)
            cell.nutrientValue?.text = stringValue
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
            
            var value : Double = Requirments.shared().rationArrayFinal[indexPath.row - 1]
            value = value.roundToDecimal(1)
            let stringValue = String(value)
            cell.nutrientFeed?.text = stringValue
            
            
            var value1 : Double = Requirments.shared().primexArrayFinal[indexPath.row - 1]
            value1 = value1.roundToDecimal(1)
            let stringValue1 = String(value1)
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
            let stringValue3 = String(value3)
            cell.nutrientTotal?.text = stringValue3
            
            
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
            let value : Double = Requirments.shared().reqArrayFinal[indexPath.row - 1]
            let value1 : Double = Requirments.shared().rationArrayFinal[indexPath.row - 1]
            let value2 : Double = Requirments.shared().primexArrayFinal[indexPath.row - 1]
            var value3 : Double = 0.0
            if(indexPath.row > 7) {
                value3 = 0.0
            } else {
                let value : Double = Requirments.shared().waterArrayFinal[indexPath.row - 1]
                value3 = value
            }
            let value4 : Double = value1 + value2 + value3
            var value5 : Double = value4 - value
            value5 = value5.roundToDecimal(1)
            cell.nutrientNames?.text = nutrientNames[indexPath.row]
            cell.nutrientValues?.text = String(value5)
            var percent : Double = (value4/value) * 100
            percent = percent.roundToDecimal(1)
            percentageArray.append(percent)
            cell.nutrientPercent?.text = String(percent)
            if(indexPath.row == 17) {
                self.addGaugeView()
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
