//
//  AnimalSelectionViewController.swift
//  FeedInsight
//
//  Created by Mac on 23/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class AnimalSelectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var animalCollectionView: UICollectionView!
    @IBOutlet weak var companynameLabel: UILabel!
    @IBOutlet weak var userProfileView: UIImageView!
    @IBOutlet weak var notificaitonViewA: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    //    @IBOutlet weak var animalCollectionViewCell: AnimalCollectionViewCell!
    
    
    let textArr = ["Ruminants","Aqua","Equines","Poultry","Goat","Cow"]
    
    let imageArr: [UIImage] = [
        UIImage(named: "ruminants")!,
        UIImage(named: "aqua")!,
        UIImage(named: "equines")!,
        UIImage(named: "chicken")!,
        UIImage(named: "equines")!,
        UIImage(named: "ruminants")!,
    ]
    //
    var animalData = [AnimalCollectionCell]()
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
                                                       layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
                                                       layout.minimumInteritemSpacing = 2
                                                       layout.minimumLineSpacing = 20
                                                       animalCollectionView.collectionViewLayout = layout
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
                     layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
                      layout.minimumInteritemSpacing = 2
                      layout.minimumLineSpacing = 20
                      animalCollectionView.collectionViewLayout = layout
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
                                              layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
                                              layout.minimumInteritemSpacing = 2
                                              layout.minimumLineSpacing = 20
                                              animalCollectionView.collectionViewLayout = layout
                }
                if(screenHeight1 == landscap)
                {
                    getScreenSize()
                   
                    print("h1")
                    print("zise is changed : ", UIScreen.main.bounds.width)
                     let itemSize = UIScreen.main.bounds.width/4 - 2
                     let layout = UICollectionViewFlowLayout()
                    layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
                     layout.minimumInteritemSpacing = 2
                     layout.minimumLineSpacing = 20
                     animalCollectionView.collectionViewLayout = layout
                     getScreenSize()
                }
                                
                  
               } else {
                 var screenHeight2:CGFloat=0
                screenHeight2 = UIScreen.main.bounds.width
                           
                getScreenSize()     ///yeh galta hota h
                if(screenHeight2 == portait)
                {
                     print("h111")
                      print("zise did not changed : ", UIScreen.main.bounds.width)
                  let itemSize = UIScreen.main.bounds.width/4 - 2
                                                                              let layout = UICollectionViewFlowLayout()
                                                                             layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
                                                                              layout.minimumInteritemSpacing = 2
                                                                              layout.minimumLineSpacing = 20
                                                                              animalCollectionView.collectionViewLayout = layout
                                                                              getScreenSize()
                    
                  
                    
                }
                if(screenHeight2 == landscap)
                {
                    print("Portrait")
                      print("screenHeight2 : ", screenHeight2)
                     getScreenSize()
                                      print("h2")
                                      print("zise is changed : ", UIScreen.main.bounds.width)
                   let itemSize = UIScreen.main.bounds.height/3 - 2
                           let layout = UICollectionViewFlowLayout()
                           layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
                           layout.minimumInteritemSpacing = 2
                           layout.minimumLineSpacing = 20
                           animalCollectionView.collectionViewLayout = layout
                }
                      
                  
               }
           }
    
    //
  
    override func viewDidLoad() {
           self.navigationController?.isNavigationBarHidden = true
        animalData = DataAppend.getAllAnimalData()
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        animalCollectionView.delegate = self
        animalCollectionView.dataSource = self
        
        notificaitonViewA?.layer.cornerRadius = (notificaitonViewA?.frame.size.width ?? 0.0) / 2
        notificaitonViewA?.clipsToBounds = true
        notificaitonViewA?.layer.borderWidth = 3.0
        notificaitonViewA?.layer.borderColor = UIColor.white.cgColor
        
        userProfileView?.layer.cornerRadius = (userProfileView?.frame.size.width ?? 0.0) / 2
        userProfileView?.clipsToBounds = true
        userProfileView?.layer.borderWidth = 3.0
        userProfileView?.layer.borderColor = UIColor.white.cgColor
        
//        let itemSize = UIScreen.main.bounds.width/3 - 2
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: itemSize + 15, height: itemSize + 15)
//        layout.minimumInteritemSpacing = 2
//        layout.minimumLineSpacing = 20
//        animalCollectionView.collectionViewLayout = layout   
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalcollectionCell", for: indexPath) as! AnimalCollectionViewCell
        //let cellIndex = indexPath.item
//        cell.animalImage.image = imageArr[indexPath.item]
//        cell.animalLabel.text = textArr[indexPath.item]
        cell.animalData = animalData[indexPath.row]
//        cell.animalImage.image = animalData[indexPath.row].animalImg
//        cell.animalLabel.text = animalData[indexPath.row].animalStr
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
//        cell.layer.borderColor = UIColor.lightGray.cgColor
//        cell.layer.borderWidth = 0.5
//        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RuminantspickViewController") as? RuminantspickViewController
        vc?.titlename = textArr[indexPath.row]
        vc?.titleImage = imageArr[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }

//
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
