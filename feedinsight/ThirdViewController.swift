//
//  ThirdViewController.swift
//  stack
//
//  Created by Mac 2014 on 08/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    let textArr = ["one","two","three","four","five","six"]
    
       let imageArr = [UIImage (named: "brush"), UIImage(named: "brush"),UIImage (named: "brush"), UIImage(named: "brush"),UIImage(named: "brush"),UIImage(named: "brush")]
       
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionWidth = collectionView.frame.width
//        return CGSize(width: collectionWidth/2, height: collectionWidth/2)
//    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       let padding: CGFloat = 25
//          let collectionCellSize = collectionView.frame.size.width - padding
//
//        return CGSize(width: collectionCellSize/2, height: collectionCellSize/2)
         let size = collectionView.bounds.size.width / 2
        return CGSize(width: size, height: 262)
    }
    //
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
   
    
    
    

}
