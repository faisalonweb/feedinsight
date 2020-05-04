   //
    //  SignUpViewController.swift
    //  FeedInsight
    //
    //  Created by Mac on 13/04/2020.
    //  Copyright © 2020 faisal. All rights reserved.
    //
    
    import UIKit
    import iOSDropDown
    class SignUpViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
       
        
        @IBOutlet weak var NameField: UITextField!
        @IBOutlet weak var emailField: UITextField!
        @IBOutlet weak var countryCodeField: UITextField!
        @IBOutlet weak var dropDownLabel: UIImageView!
        @IBOutlet weak var phoneField: UITextField!
        @IBOutlet weak var collectionView: UICollectionView!
        //    @IBOutlet weak var collectionCell: UICollectionViewCell!
        @IBOutlet weak var IndustryField: UITextField!
        @IBOutlet weak var businessField: UITextField!
        @IBOutlet weak var passwordField: UITextField!
        @IBOutlet weak var repasswordField: UITextField!
        @IBOutlet weak var pickanimalfield: DropDown!
        @IBOutlet weak var pickroleField: DropDown!
        let textArr = ["Research","Farming","FoodManufacturing"]
        
//        let imageArr = [UIImage (named: "brush"), UIImage(named: "brush"),UIImage (named: "brush"), UIImage(named: "brush"),UIImage(named: "brush"),UIImage(named: "brush")]   // research-selected , farm-selected , feedmanufacturing-selected  ,
        
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
        
        @IBAction func backBtn(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
        @IBAction func signIntapped(_ sender: UIButton) {
        }
        
        @IBAction func signInBtntap(_ sender: Any) {
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.delegate = self
            collectionView.dataSource = self
            let itemSize = UIScreen.main.bounds.width/3 - 2
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: itemSize, height: itemSize)
            
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 16
            
            collectionView.collectionViewLayout = layout
            
            pickanimalfield.optionArray = ["Option 1", "Option 2", "Option 3"]
            pickanimalfield.optionIds = [1,23,54,22]
            pickanimalfield.didSelect{(selectedText , index ,id) in
            }
            pickroleField.optionArray = ["Option 1", "Option 2", "Option 3"]
            pickroleField.optionArray = ["Admin","user","manager"]
            pickroleField.didSelect{(selectedText , index ,id) in
            }
            // color
//            let color = ""
//            let encoding = color.data(using: String.Encoding.utf8, allowLossyConversion:true)
            //let options = [NSDocu]
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                   return textArr.count
               }
               
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! SignUpCollectionViewCell
                   let cellIndex = indexPath.item
                   cell.industryImage.image = imageArr[cellIndex]
                   cell.industryLabel.text = textArr[cellIndex]
                   return cell
               }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as! SignUpCollectionViewCell
             let cellIndex = indexPath.item
            cell.industryImage.image = imageArr1[cellIndex]
            
        
        }
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as! SignUpCollectionViewCell
                    let cellIndex = indexPath.item
                    cell.industryImage.image = imageArr[cellIndex]
        }
        
        
        /*
         
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

