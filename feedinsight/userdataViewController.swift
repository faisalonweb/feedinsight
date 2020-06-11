//
//  userdataViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 10/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import Firebase


class userdataViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{
    
    @IBOutlet weak var changebutton: UIButton!
    @IBOutlet weak var userdropdown: DropDown!
    @IBOutlet weak var roledropdown: DropDown!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var locationField: DropDown!
    @IBOutlet weak var userpic: UIImageView!
    var db: Firestore!
    
    var pickerData1: [String] = [String]()
    var workarray: [String] = [String]()
    private let locationManager = LocationManager()
    
    let textArr = ["Research","Farming","FoodManufacturing"]
    let imageArr: [UIImage] = [
           UIImage(named: "research-unselected")!,
           UIImage(named: "farm-unselected")!,
           UIImage(named: "feedmanufacturing-unselected")!,
       ]
       let imageArr1: [UIImage] = [
           UIImage(named: "research-selected")!,
           UIImage(named: "farm-selected")!,
           UIImage(named: "feedmanufacturing-selected")!,
       ]
    private func setCurrentLocation() {
           
           guard let exposedLocation = self.locationManager.exposedLocation else {
               print("*** Error in \(#function): exposedLocation is nil")
               return
           }
           
           self.locationManager.getPlace(for: exposedLocation) { placemark in
               guard let placemark = placemark else { return }
               
               var output = "Our location is:"
               if let country = placemark.country {
                   output = output + "\n\(country)"
               }
               if let state = placemark.administrativeArea {
                   output = output + "\n\(state)"
               }
               if let town = placemark.locality {
                   output = output + "\n\(town)"
               }
               self.locationField.text = output
           }
       }
    override func viewDidLoad() {

        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
               let lineArray = text.components(separatedBy: "\n")
               for eachLA in lineArray
               {
                   workarray = eachLA.components(separatedBy: ",")
                   pickerData1.append(workarray[0])
                   
               }
        locationField.optionArray = pickerData1
               locationField.didSelect{(selectedText , index ,id) in
               }
        
        userdropdown.optionArray = ["Cow","Deer","Camel"]
               userdropdown.didSelect{(selectedText , index ,id) in
               }
        roledropdown.optionArray = ["Admin","Client","Lender"]
                      roledropdown.didSelect{(selectedText , index ,id) in
                      }
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
               let layout = UICollectionViewFlowLayout()
               layout.scrollDirection = .horizontal
               layout.itemSize = CGSize(width: itemSize, height: itemSize)
               layout.minimumInteritemSpacing = 2
               layout.minimumLineSpacing = 16
               collectionView.collectionViewLayout = layout
        
      
        userpic.layer.cornerRadius = userpic.frame.size.width/2
                      userpic.clipsToBounds = true
                      userpic.layer.borderWidth = 2.0
                      userpic.layer.borderColor = UIColor.white.cgColor
         changebutton.layer.cornerRadius = 8
                      
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usercell", for: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
               cell.imageusr.image = imageArr[cellIndex]
               cell.labelusr.text = textArr[cellIndex]
               return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.imageusr.image = imageArr1[cellIndex]
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.imageusr.image = imageArr[cellIndex]
    }
    
   
    

   
  

}
