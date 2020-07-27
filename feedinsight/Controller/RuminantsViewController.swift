//
//  RuminantsViewController.swift
//  FeedInsight
//
//  Created by Mac on 13/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class RuminantsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! RuminantCollectionViewCell
          slectedValue = ""
        let cellIndex = indexPath.item
        cell.pickanimalData = pickAnimalArr[cellIndex]
        slectedValue = cell.ruminantLabel.text!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController
        vc?.name = textArr[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
//        performSegue(withIdentifier: "showDetailSegue", sender: self)
    }
    

    
    @IBOutlet weak var UserInfoView: UIView!
    @IBOutlet weak var notificationView: UIImageView!
    
    @IBOutlet weak var headAnimalLabel: UILabel!
    @IBOutlet weak var headImageview: UIImageView!
    @IBOutlet weak var UserNameOutlet: UILabel!
    @IBOutlet weak var AnimalTypeView: UICollectionView!
    
    @IBOutlet weak var animalTypeCollection: UICollectionView!
    @IBOutlet weak var UserCompanyName: UILabel!
    @IBOutlet weak var UserProfilePicture: UIImageView!
    
    var textArr = ["Dairy Cows","Beef Cows","Sheep/Goat","Camel","Deer"]
   
    var pickAnimalArr = [pickAnimal]()
    var slectedValue = ""
    var titlename = ""
    var titleImage = UIImage(named:"")
      var sizee1:CGFloat=0
    var sizee2:CGFloat=0
    var portait:CGFloat=0
       var landscap:CGFloat=0
    @IBAction func SelectAnimal(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if(UIScreen.main.bounds.width < 415)
              {
                  getScreenSize()
                sizee2 = sizee1
                 print("h11")
                  print("zise is : ", UIScreen.main.bounds.width)
                         let itemSize = UIScreen.main.bounds.width/3 - 2
                         let layout = UICollectionViewFlowLayout()
                         layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                         layout.minimumInteritemSpacing = 2
                         layout.minimumLineSpacing = 15
                  animalTypeCollection.collectionViewLayout = layout
                    portait = UIScreen.main.bounds.width
                 landscap = UIScreen.main.bounds.height
              }
              else
              {
                  getScreenSize()
                  sizee2 = sizee1
                 print("h12")
                   print("zise is : ", UIScreen.main.bounds.width)
                  let itemSize = UIScreen.main.bounds.width/4 - 2
                  let layout = UICollectionViewFlowLayout()
                  layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                  layout.minimumInteritemSpacing = 2
                  layout.minimumLineSpacing = 15
                  animalTypeCollection.collectionViewLayout = layout
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
        sizee1 = sizee
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
                                               layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                                               
                                               layout.minimumInteritemSpacing = 2
                                               layout.minimumLineSpacing = 15
                                        animalTypeCollection.collectionViewLayout = layout
            }
            if(screenHeight1 == landscap)
            {
                getScreenSize()
                sizee2 = sizee1
                print("h1")
                print("zise is changed : ", UIScreen.main.bounds.width)
                 let itemSize = UIScreen.main.bounds.width/4 - 2
                 let layout = UICollectionViewFlowLayout()
                 layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                 layout.minimumInteritemSpacing = 2
                 layout.minimumLineSpacing = 15
                 animalTypeCollection.collectionViewLayout = layout
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
                                                                          layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                                                                          layout.minimumInteritemSpacing = 2
                                                                          layout.minimumLineSpacing = 15
                                                                          animalTypeCollection.collectionViewLayout = layout
                                                                          getScreenSize()
                
              
                
            }
            if(screenHeight2 == landscap)
            {
                print("Portrait")
                  print("screenHeight2 : ", screenHeight2)
                 getScreenSize()
                 sizee2 = sizee1
                               var screenHeight12:CGFloat=0
                 var screenwidth13:CGFloat=0
                screenHeight12 = UIScreen.main.bounds.width
                screenwidth13 = UIScreen.main.bounds.height
                
                                  print("h2")
                                  print("zise is changed : ", UIScreen.main.bounds.width)
                                    let itemSize = UIScreen.main.bounds.height/3 - 2
                                                                                let layout = UICollectionViewFlowLayout()
                                                                                layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
                                                                                
                                                                                layout.minimumInteritemSpacing = 2
                                                                                layout.minimumLineSpacing = 15
                                                                         animalTypeCollection.collectionViewLayout = layout
            }
                  
              
           }
       }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLoad() {
      //  self.navigationController?.isNavigationBarHidden = true
        pickAnimalArr = DataAppend.getAllPickAnimalData()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                                    self.navigationController?.navigationBar.shadowImage = UIImage()
               let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
               navigationItem.leftBarButtonItem = backButton
        super.viewDidLoad()
        print("titlename")
        if(titlename == "Poultry")
           {
             textArr = ["Broiler","Layer","Breeders"]
           }
        if(titlename == "Aqua")
        {
          textArr = ["Fish","Shrimps"]
        }
        
        headAnimalLabel.text = titlename
        headImageview.image = titleImage
        notificationView?.layer.cornerRadius = (notificationView?.frame.size.width ?? 0.0) / 2
        notificationView?.clipsToBounds = true
        notificationView?.layer.borderWidth = 3.0
        notificationView?.layer.borderColor = UIColor.white.cgColor
        
        UserProfilePicture?.layer.cornerRadius = (UserProfilePicture?.frame.size.width ?? 0.0) / 2
        UserProfilePicture?.clipsToBounds = true
        UserProfilePicture?.layer.borderWidth = 3.0
        UserProfilePicture?.layer.borderColor = UIColor.white.cgColor
        
//        let itemSize = UIScreen.main.bounds.width/3 - 2
//
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
//
//        layout.minimumInteritemSpacing = 2
//        layout.minimumLineSpacing = 15
        
        
        
//        if(UIScreen.main.bounds.width < 415)
//        {
//            print("zise is : ", UIScreen.main.bounds.width)
//                   let itemSize = UIScreen.main.bounds.width/3 - 2
//                   let layout = UICollectionViewFlowLayout()
//                   layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
//
//                   layout.minimumInteritemSpacing = 2
//                   layout.minimumLineSpacing = 15
//            animalTypeCollection.collectionViewLayout = layout
//
//        }
//        else
//        {
//             print("zise is : ", UIScreen.main.bounds.width)
//            let itemSize = UIScreen.main.bounds.width/4 - 2
//            let layout = UICollectionViewFlowLayout()
//            layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
//
//            layout.minimumInteritemSpacing = 2
//            layout.minimumLineSpacing = 15
//
//            animalTypeCollection.collectionViewLayout = layout
//        }

        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "showDetailSegue"){
//                let displayVC = segue.destination as! StateViewController
//            displayVC.detail = slectedValue
//        }
//    }
    
    
}
