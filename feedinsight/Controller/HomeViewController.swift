//
//  ThirdViewController.swift
//  stack
//
//  Created by Mac 2014 on 08/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
//import GoogleMobileAds
import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var advertismentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var clickOnSeeAll: UIButton!
    @IBOutlet weak var adsImgView: UIImageView!
    
    let imageArr: [UIImage] = [
        UIImage(named: "premix")!,
        UIImage(named: "calculator")!,
        UIImage(named: "pdfIcon")!,
        UIImage(named: "pdfIcon")!,
    ]
    
    let imageArrAds: [UIImage] = [
        //UIImage(named: "adImg1")!,
        UIImage(named: "adImg2")!,
    ]
    let lablArr = ["Premix Check","Unit Converter","VMP Guide","Feed Profiles"]
    var screenWidth:CGFloat=0
    var screenHeight:CGFloat=0
    var sizee:CGFloat=0
    var sidebarView: SidebarView!
    var blackScreen: UIView!
    let defaults = UserDefaults(suiteName:"User")
    var arrData = [PremixCollectionCell]()
//    var bannerView: GADBannerView!
    override func viewDidLoad() {
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.adsImgView.addGestureRecognizer(tapOnImage)
        self.adsImgView.isUserInteractionEnabled = true
        arrData = DataAppend.getAllPremixData()
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let array = imageArrAds
        repeatAnimateImagesChanges(images: array as NSArray, imageView: self.adsImgView)
        
//        let btnMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(btnMenuAction))
//        btnMenu.tintColor=UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
//        self.navigationItem.leftBarButtonItem = btnMenu
//
//        sidebarView=SidebarView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
//        sidebarView.delegate=self
//        sidebarView.layer.zPosition=100
//        self.view.isUserInteractionEnabled=true
//        self.navigationController?.view.addSubview(sidebarView)
//
//        blackScreen=UIView(frame: self.view.bounds)
//        blackScreen.backgroundColor=UIColor(white: 0, alpha: 0.5)
//        blackScreen.isHidden=true
//        self.navigationController?.view.addSubview(blackScreen)
//        blackScreen.layer.zPosition=99
//        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
//        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }
    
    @objc func tapOnImageAction() {
        if let url = URL(string: "http://www.totalnutrition.pk") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
//    @objc func btnMenuAction() {
//        self.tabBarController?.tabBar.isHidden = true
//        blackScreen.isHidden=false
//        UIView.animate(withDuration: 0.3, animations: {
//            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 250, height: self.sidebarView.frame.height)
//        }) { (complete) in
//            self.blackScreen.frame=CGRect(x: self.sidebarView.frame.width, y: 0, width: self.view.frame.width-self.sidebarView.frame.width, height: self.view.bounds.height+100)
//        }
//    }
//
//    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
//        self.tabBarController?.tabBar.isHidden = false
//        blackScreen.isHidden=true
//        blackScreen.frame=self.view.bounds
//        UIView.animate(withDuration: 0.3) {
//            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
//        }
//    }

//    func sidebarDidSelectRow(row: Row) {
//        blackScreen.isHidden=true
//        blackScreen.frame=self.view.bounds
//        self.tabBarController?.tabBar.isHidden = false
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        UIView.animate(withDuration: 0.3) {
//            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
//        }
//        switch row {
//        case .editProfile:
//            self.tabBarController?.selectedIndex = 2
//        case .home:
//            print("Messages")
//        case .controlPanel:
//            print("Contact")
//        case .terms:
//            let ResultsViewController = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
//            ResultsViewController.pdfType = "pdf3"
//            self.navigationController?.pushViewController(ResultsViewController, animated: true)
//        case .help:
//            print("Help")
//        case .signOut:
//            print("Sign out")
//            logOutAccount()
//        case .none:
//            break
//        }
//    }
    
//    func logOutAccount () {
//        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout from feedInsight?", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "YES", style: UIAlertAction.Style.destructive, handler: { action in
//            let firebaseAuth = Auth.auth()
//            do {
//                try firebaseAuth.signOut()
//                let defaults = UserDefaults(suiteName:"User")
//                let dictionary = defaults!.dictionaryRepresentation()
//                dictionary.keys.forEach { key in
//                    defaults!.removeObject(forKey: key)
//                    self.defaults!.synchronize()
//                }
//                self.defaults!.synchronize()
//                let vcone = self.storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController;
//                self.navigationController?.pushViewController(vcone!, animated: true)
//
//            } catch let signOutError as NSError {
//                print ("Error signing out: %@", signOutError)
//            }
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
    
    func repeatAnimateImagesChanges(images:NSArray, imageView:UIImageView) {
        if(images.count == 0) {
            return
        }
        var newImage = images.firstObject as! UIImage
        if(imageView.image != nil) {
            for i in 0..<images.count {
                newImage = images.object(at: i) as! UIImage
                if(imageView.image?.isEqual(newImage))! {
                    newImage = i == images.count - 1 ? images.firstObject as! UIImage : images.object(at: i + 1) as! UIImage
                    break
                }
            }
        }
        imageView.image = newImage
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.repeatAnimateImagesChanges(images: images, imageView: imageView)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdviewcell", for: indexPath) as! premixCollectionViewCell
        if(indexPath.row == 1) {
            cell.contentView.layer.opacity = 0.3;
            cell.isUserInteractionEnabled = false
        }
        cell.imgView.image = imageArr[indexPath.row]
        cell.txtView.text = lablArr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if(indexPath.row == 0) {
            let animalViewController = storyboard.instantiateViewController(withIdentifier: "NewRumiViewController") as! NewRumiViewController
            self.navigationController?.pushViewController(animalViewController, animated: true)
        } else if(indexPath.row == 1) {
            let unitConvertorVC = storyboard.instantiateViewController(withIdentifier: "unitConvertorVC") as! UnitConvertorViewController
            self.navigationController?.pushViewController(unitConvertorVC, animated: true)
        } else if(indexPath.row == 2){
            let ResultsViewController = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            ResultsViewController.pdfType = "pdf1"
            self.navigationController?.pushViewController(ResultsViewController, animated: true)
        } else if(indexPath.row == 3){
            let ResultsViewController = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            ResultsViewController.pdfType = "pdf2"
            self.navigationController?.pushViewController(ResultsViewController, animated: true)
        }
        
    }
    var portait:CGFloat=0
    var landscap:CGFloat=0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        if(UIScreen.main.bounds.width < 415) {
            getScreenSize()
            let itemSize = UIScreen.main.bounds.width/3 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 20
            collectionView.collectionViewLayout = layout
            portait = UIScreen.main.bounds.width
            landscap = UIScreen.main.bounds.height
        } else {
            getScreenSize()
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
