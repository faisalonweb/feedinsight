//
//  RuminantspickViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 29/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

class RuminantspickViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalPic: UIImageView!
    @IBOutlet weak var backFunc: UIButton!
    @IBOutlet weak var userpic: UIImageView!
    var textArr = ["Dairy Cows","Beef Cows","Sheep/Goat","Camel","Deer","Buffalo"]
    var titlename = ""
    var titleImage = UIImage(named:"")
    let defaults = UserDefaults.standard
    var sizee1:CGFloat=0
    var sizee2:CGFloat=0
    var portait:CGFloat=0
    var landscap:CGFloat=0
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        super.viewDidLoad()
        //userpic?.layer.cornerRadius = (userpic?.frame.size.width ?? 0.0) / 2
        userpic?.layer.cornerRadius = (userpic?.frame.size.width ?? 0.0) / 2
        userpic?.clipsToBounds = true
        userpic?.layer.borderWidth = 3.0
        userpic?.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        super.viewDidLoad()
        animalPic.image = titleImage
        animalName.text = titlename
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let userName = defaults.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.main.async { [weak self] in
            
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.userpic.image = UIImage(data: data!)
            }
        }
        //self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if(UIScreen.main.bounds.width < 415)
        {
            getScreenSize()
            sizee2 = sizee1
            let itemSize = UIScreen.main.bounds.width/3 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 15
            collectionview.collectionViewLayout = layout
            portait = UIScreen.main.bounds.width
            landscap = UIScreen.main.bounds.height
        }
        else
        {
            getScreenSize()
            sizee2 = sizee1
            let itemSize = UIScreen.main.bounds.width/4 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 15
            collectionview.collectionViewLayout = layout
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
        sizee = screenWidth
        sizee1 = sizee
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            getScreenSize()
            var screenHeight1:CGFloat=0
            screenHeight1 = UIScreen.main.bounds.width
            if(screenHeight1 == portait)
            {
                let itemSize = UIScreen.main.bounds.width/3 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 15
                collectionview.collectionViewLayout = layout
            }
            if(screenHeight1 == landscap)
            {
                getScreenSize()
                sizee2 = sizee1
                let itemSize = UIScreen.main.bounds.width/4 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 15
                collectionview.collectionViewLayout = layout
                getScreenSize()
            }
        } else {
            var screenHeight2:CGFloat=0
            screenHeight2 = UIScreen.main.bounds.width
            
            getScreenSize()     ///yeh galta hota h
            if(screenHeight2 == portait)
            {
                let itemSize = UIScreen.main.bounds.width/4 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 15
                collectionview.collectionViewLayout = layout
                getScreenSize()
            }
            if(screenHeight2 == landscap)
            {
                getScreenSize()
                sizee2 = sizee1
                let itemSize = UIScreen.main.bounds.height/3 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 15
                collectionview.collectionViewLayout = layout
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func selectAnimal(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as! RuminantsPickCollectionViewCell
        let cellIndex = indexPath.item
        cell.rumiLabel.text = textArr[cellIndex]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController
        vc?.name = textArr[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
