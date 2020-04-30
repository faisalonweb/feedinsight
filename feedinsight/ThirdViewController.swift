//
//  ThirdViewController.swift
//  stack
//
//  Created by Mac 2014 on 08/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var corRad: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let textArr = ["Premix Checker","Unit Converter","Premix Checker","Unit Conveter","Premix Checker","Unit Conveter"]

    let imageArr = [UIImage (named: "premix"), UIImage(named: "calculator"),UIImage (named: "premix"), UIImage(named: "calculator"),UIImage(named: "premix"),UIImage(named: "calculator")]

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        corRad.layer.cornerRadius = 15
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize + 30, height: itemSize + 30)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 20
        
        collectionView.collectionViewLayout = layout
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
     
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        <#code#>
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return textArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdviewcell", for: indexPath) as! premixCollectionViewCell
                              
                              let cellIndex = indexPath.item
                              
                          
                              cell.txtView.text = textArr[cellIndex]
        cell.imgView.image = imageArr[cellIndex]
                              
                              return cell
    }
    
    
   
    
    
    
    
    
}
