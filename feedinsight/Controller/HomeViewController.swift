//
//  ThirdViewController.swift
//  stack
//
//  Created by Mac 2014 on 08/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import CoreXLSX
import GoogleMobileAds
import Foundation

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var advertismentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var clickOnSeeAll: UIButton!
    var arrData = [PremixCollectionCell]()
    let textArr = ["Premix Check","Unit Conveter"]
    let imageArr = [UIImage(named: "premix"),UIImage(named: "calculator")]
    var bannerView: GADBannerView!
    override func viewDidLoad() {
        arrData = DataAppend.getAllPremixData()
        super.viewDidLoad()
        
        // Add GaugeView
        let test = GaugeView(frame: CGRect(x: 10, y: 40, width: 100, height: 100))
        test.backgroundColor = .clear
        self.view.addSubview(test)
        
        let test1 = GaugeView(frame: CGRect(x: 111, y: 40, width: 100, height: 100))
        test1.backgroundColor = .clear
        self.view.addSubview(test1)
        
        let test2 = GaugeView(frame: CGRect(x: 212, y: 40, width: 100, height: 100))
        test2.backgroundColor = .clear
        self.view.addSubview(test2)
        
        let test3 = GaugeView(frame: CGRect(x: 10, y: 145, width: 100, height: 100))
        test3.backgroundColor = .clear
        self.view.addSubview(test3)
        
        let test4 = GaugeView(frame: CGRect(x: 111, y: 145, width: 100, height: 100))
        test4.backgroundColor = .clear
        self.view.addSubview(test4)
        
        let test5 = GaugeView(frame: CGRect(x: 212, y: 145, width: 100, height: 100))
        test5.backgroundColor = .clear
        self.view.addSubview(test5)
        
        let test6 = GaugeView(frame: CGRect(x: 10, y: 250, width: 100, height: 100))
        test6.backgroundColor = .clear
        self.view.addSubview(test6)
        
        let test7 = GaugeView(frame: CGRect(x: 111, y: 250, width: 100, height: 100))
        test7.backgroundColor = .clear
        self.view.addSubview(test7)
        
        let test8 = GaugeView(frame: CGRect(x: 212, y: 250, width: 100, height: 100))
        test8.backgroundColor = .clear
        self.view.addSubview(test8)
        
        let test9 = GaugeView(frame: CGRect(x: 10, y: 355, width: 100, height: 100))
        test9.backgroundColor = .clear
        self.view.addSubview(test9)
        
        let test10 = GaugeView(frame: CGRect(x: 111, y: 355, width: 100, height: 100))
        test10.backgroundColor = .clear
        self.view.addSubview(test10)
        
        let test11 = GaugeView(frame: CGRect(x: 212, y: 355, width: 100, height: 100))
        test11.backgroundColor = .clear
        self.view.addSubview(test11)
        
        let test12 = GaugeView(frame: CGRect(x: 10, y: 460, width: 100, height: 100))
        test12.backgroundColor = .clear
        self.view.addSubview(test12)
        
        let test13 = GaugeView(frame: CGRect(x: 111, y: 460, width: 100, height: 100))
        test13.backgroundColor = .clear
        self.view.addSubview(test13)
        
        let test14 = GaugeView(frame: CGRect(x: 212, y: 460, width: 100, height: 100))
        test14.backgroundColor = .clear
        self.view.addSubview(test14)
        
        let test15 = GaugeView(frame: CGRect(x: 10, y: 565, width: 100, height: 100))
        test15.backgroundColor = .clear
        self.view.addSubview(test15)
        
        
        
        
//        test.segmentColors = [UIColor.white, UIColor.white, UIColor.white, UIColor.green,UIColor.green, UIColor.yellow, UIColor.yellow, UIColor.red]
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
        // end
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-8321259434016641/8943852654"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.frame.size.height = advertismentView.frame.size.height
        bannerView.frame.size.width = advertismentView.frame.size.width
        advertismentView.addSubview(bannerView)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdviewcell", for: indexPath) as! premixCollectionViewCell
        cell.premixData = arrData[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if(indexPath.row == 0) {
            let animalViewController = storyboard.instantiateViewController(withIdentifier: "AnimalSelectionViewController") as! AnimalSelectionViewController
            self.navigationController?.pushViewController(animalViewController, animated: true)
        } else if(indexPath.row == 1) {
            let unitConvertorVC = storyboard.instantiateViewController(withIdentifier: "unitConvertorVC") as! UnitConvertorViewController
            self.navigationController?.pushViewController(unitConvertorVC, animated: true)
        }
        
    }
    var portait:CGFloat=0
    var landscap:CGFloat=0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(UIScreen.main.bounds.width < 415)
        {
            getScreenSize()
            print("h11")
            print("zise is : ", UIScreen.main.bounds.width)
            let itemSize = UIScreen.main.bounds.width/3 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 20
            collectionView.collectionViewLayout = layout
            portait = UIScreen.main.bounds.width
            landscap = UIScreen.main.bounds.height
        }
        else
        {
            getScreenSize()
            print("h12")
            print("zise is : ", UIScreen.main.bounds.width)
            let itemSize = UIScreen.main.bounds.width/4 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 20
            collectionView.collectionViewLayout = layout
            landscap = UIScreen.main.bounds.width
            portait = UIScreen.main.bounds.height
        }
    }
    var screenWidth:CGFloat=0
    var screenHeight:CGFloat=0
    var sizee:CGFloat=0
    func getScreenSize(){
        screenWidth=UIScreen.main.bounds.width
        screenHeight=UIScreen.main.bounds.height
        print("SCREEN RESOLUTION: "+screenWidth.description+" x "+screenHeight.description)
        sizee = screenWidth
    }
    
//    @IBAction func clickOnSeeAll(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let animalViewController = storyboard.instantiateViewController(withIdentifier: "AnimalSelectionViewController") as! AnimalSelectionViewController
//        self.navigationController?.pushViewController(animalViewController, animated: true)
//    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            getScreenSize()
            var screenHeight1:CGFloat=0
            screenHeight1 = UIScreen.main.bounds.width
            if(screenHeight1 == portait)
            {
                print("h11111")
                print("zise did not changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.width/3 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                collectionView.collectionViewLayout = layout
            }
            if(screenHeight1 == landscap) {
                getScreenSize()
                print("h1")
                print("zise is changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.width/4 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                collectionView.collectionViewLayout = layout
                getScreenSize()
            }
        } else {
            var screenHeight2:CGFloat=0
            screenHeight2 = UIScreen.main.bounds.width
            getScreenSize()
            if(screenHeight2 == portait) {
                print("h111")
                print("zise did not changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.width/4 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                collectionView.collectionViewLayout = layout
                getScreenSize()
            }
            if(screenHeight2 == landscap) {
                print("Portrait")
                print("screenHeight2 : ", screenHeight2)
                getScreenSize()
                let itemSize = UIScreen.main.bounds.height/3 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                collectionView.collectionViewLayout = layout
            }
        }
    }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

