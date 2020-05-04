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
        let textArr = ["Farming","FoodManufacturing","three","four","five","six"]
        
//        let imageArr = [UIImage (named: "brush"), UIImage(named: "brush"),UIImage (named: "brush"), UIImage(named: "brush"),UIImage(named: "brush"),UIImage(named: "brush")]
        
        let imageArr: [UIImage] = [
            UIImage(named: "ruminants")!,
            UIImage(named: "aqua")!,
            UIImage(named: "equines")!,
            UIImage(named: "chicken")!,
            UIImage(named: "equines")!,
            UIImage(named: "ruminants")!,
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
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                   return textArr.count
               }
               
               func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! SignUpCollectionViewCell
                   
                   let cellIndex = indexPath.item
                   
                   cell.industryImage.image = imageArr[cellIndex]
                   cell.industryLabel.text = textArr[cellIndex]
                 
                if(indexPath.row % 2 == 0)
                {
                    cell.industryLabel.textColor = UIColor.black
                    //cell.backgroundColor = UIColor.white
                }
                else{
                    cell.backgroundColor =  UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
                }
              //  UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
                  // cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
             
                   return cell
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
