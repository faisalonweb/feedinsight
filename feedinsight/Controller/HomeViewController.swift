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
        let animalViewController = storyboard.instantiateViewController(withIdentifier: "AnimalSelectionViewController") as! AnimalSelectionViewController
        self.navigationController?.pushViewController(animalViewController, animated: true)
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
