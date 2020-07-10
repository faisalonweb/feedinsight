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
import FirebaseAuth


class userdataViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{
    
    @IBOutlet weak var changebutton: UIButton!
    @IBOutlet weak var userdropdown: DropDown!
    @IBOutlet weak var roledropdown: DropDown!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var locationField: DropDown!
    @IBOutlet weak var userpic: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var userotherindus: UITextField!
    
    @IBOutlet weak var userbuss: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var userconfirmpassword: UITextField!
    
    
    
    var db: Firestore!
    var collectionselectedcell : String = "pak"
    
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
       
       let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")

        // Get data
        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            } else if querySnapshot!.documents.count != 1 {
                print("More than one documents or none")
            } else {
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                let currentusername = dataDescription?["name"]
                let currentuseremail = dataDescription?["email"]
                let currentuserphone = dataDescription?["phone"]
                let currentuserindustry = dataDescription?["industry"]
                let currentuserbusiness = dataDescription?["business"]
                let currentuserpass = dataDescription?["password"]
                let currentuserpickanimal = dataDescription?["pickanimal"]
                let currentuserlocation = dataDescription?["location"]
                let currentuserrole = dataDescription?["pickrole"]
                let currentusercollectionindustry =  dataDescription?["CollectionIndustry"]
               
//                else { return }
                self.username.text = currentusername as? String
                self.useremail.text = currentuseremail as? String
                self.userphone.text = currentuserphone as? String
                self.userotherindus.text = currentuserindustry as? String
                self.userbuss.text = currentuserbusiness as? String
                self.userpassword.text = currentuserpass as? String
                self.userconfirmpassword.text = currentuserpass as? String
                self.userdropdown.text = currentuserpickanimal as? String
                self.locationField.text = currentuserlocation as? String
                self.roledropdown.text = currentuserrole as? String
                self.collectionselectedcell = currentusercollectionindustry as! String
                self.collectionView.reloadData()
//                print("user email is : \(currentuseremail ?? 0)")
//                print("user name is : \(currentusername ?? 0)")
//                  print("collection cell name is : \(self.collectionselectedcell)")
            }
        }
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
    
    
    @IBAction func backbutton(_ sender: Any) {
        let vcone = storyboard?.instantiateViewController(withIdentifier: "tabar") as? UITabBarController; self.navigationController?.pushViewController(vcone!, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usercell", for: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
               cell.imageusr.image = imageArr[cellIndex]
               cell.labelusr.text = textArr[cellIndex]
//        print(cell.labelusr.text!)
        print("collection cell name is : \(self.collectionselectedcell)")
        if(self.collectionselectedcell == cell.labelusr.text!) {
          cell.backgroundColor = UIColor.green
          print("match is done")
        }
        cell.layer.cornerRadius = 10
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
