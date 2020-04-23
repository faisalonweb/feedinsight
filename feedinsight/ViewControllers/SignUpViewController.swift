//
//  SignUpViewController.swift
//  FeedInsight
//
//  Created by Mac on 13/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var countryCodeField: UITextField!
    @IBOutlet weak var dropDownLabel: UIImageView!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var collectionCell: UICollectionViewCell!
    @IBOutlet weak var IndustryField: UITextField!
    @IBOutlet weak var pickAnimalField: UITextField!
    @IBOutlet weak var businessField: UITextField!
    @IBOutlet weak var pickRoleField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    let textArr = ["Farming","Food Manufacturing","three","four","five","six"]
    
       let imageArr = [UIImage (named: "iForming"), UIImage(named: "imanufacture"),UIImage (named: "brush"), UIImage(named: "brush"),UIImage(named: "brush"),UIImage(named: "brush")]
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signIntapped(_ sender: UIButton) {
    }
    
    @IBAction func signInBtntap(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
                             
                             let layout = UICollectionViewFlowLayout()
                             layout.itemSize = CGSize(width: itemSize, height: itemSize)
                             
                             layout.minimumInteritemSpacing = 2
                             layout.minimumLineSpacing = 2
                             
                             collectionView.collectionViewLayout = layout
        //NameField.text = "nat"
//        NameField.layer.cornerRadius = NameField.frame.size.height/2
//        NameField.clipsToBounds = true

        // Do any additional setup after loading the view.
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
