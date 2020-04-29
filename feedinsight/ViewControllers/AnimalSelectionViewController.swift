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
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 20
        
        animalCollectionView.collectionViewLayout = layout
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalcollectionCell", for: indexPath) as! AnimalCollectionViewCell
        
        //let cellIndex = indexPath.item
        
        cell.animalImage.image = imageArr[indexPath.item]
        cell.animalLabel.text = textArr[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}