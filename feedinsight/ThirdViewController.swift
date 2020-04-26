//
//  ThirdViewController.swift
//  stack
//
//  Created by Mac 2014 on 08/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    let textArr = ["one","two","three","four","five","six"]
    
    let imageArr = [UIImage (named: "brush"), UIImage(named: "brush"),UIImage (named: "brush"), UIImage(named: "brush"),UIImage(named: "brush"),UIImage(named: "brush")]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize + 60, height: itemSize + 30)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 20
        
        collectionView.collectionViewLayout = layout
        
    }
    
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 1
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let cellIndex = indexPath.item
        
        cell.imageView.image = imageArr[cellIndex]
        cell.textView.text = textArr[cellIndex]
        
        return cell
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //           return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 80)
    //       }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let collectionWidth = collectionView.frame.width
    //        return CGSize(width: collectionWidth/2, height: collectionWidth/3)
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //           return 5
    //       }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0
    //    }
    
    
    
    
    
}
