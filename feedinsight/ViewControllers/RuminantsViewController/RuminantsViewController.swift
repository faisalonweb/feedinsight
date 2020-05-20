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
        cell.ruminantLabel.text = textArr[cellIndex]
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
   
    
    var slectedValue = ""
    var titlename = ""
    var titleImage = UIImage(named:"")
    @IBAction func SelectAnimal(_ sender: Any) {
        
    }
    override func viewDidLoad() {
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
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize + 30, height: itemSize - 40)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 15
        
        animalTypeCollection.collectionViewLayout = layout
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton

        
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "showDetailSegue"){
//                let displayVC = segue.destination as! StateViewController
//            displayVC.detail = slectedValue
//        }
//    }
    
    
}
