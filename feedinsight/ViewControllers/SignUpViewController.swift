    //
        //  SignUpViewController.swift
        //  FeedInsight
        //
        //  Created by Mac on 13/04/2020.
        //  Copyright © 2020 faisal. All rights reserved.
        //
        
        import UIKit
        import iOSDropDown
        import ActiveLabel
       
        class SignUpViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate {
           
            
            
            @IBOutlet weak var haveAccountLabel: ActiveLabel!
            @IBOutlet weak var NameField: UITextField!
            @IBOutlet weak var emailField: UITextField!
            @IBOutlet weak var countryCodeField: UITextField! {
                didSet { countryCodeField?.addDoneCancelToolbar() }
            }
            @IBOutlet weak var phoneField: UITextField! {
                didSet { phoneField?.addDoneCancelToolbar() }
            }
            @IBOutlet weak var collectionView: UICollectionView!
            @IBOutlet weak var IndustryField: UITextField!
            @IBOutlet weak var businessField: UITextField!
            @IBOutlet weak var passwordField: UITextField!
            @IBOutlet weak var repasswordField: UITextField!
            @IBOutlet weak var pickanimalfield: DropDown!
            @IBOutlet weak var pickroleField: DropDown!
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
            
            @IBAction func backBtn(_ sender: UIButton) {
                self.dismiss(animated: true, completion: nil)
            }
            @IBAction func signIntapped(_ sender: UIButton) {
            }
            
            @IBAction func signInBtntap(_ sender: Any) {
            }
            func SignupSelection(){
                   print("yesss i cameeee")
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SigninVC") as! LoginViewController
                   self.present(signUpViewController, animated: true, completion: nil)
               }
            
            func btnSelection(){
                print("yesss i cameeee1")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "SigninVC") as! LoginViewController
                self.present(loginViewController, animated: true, completion: nil)
            }
            override func viewDidLoad() {
                super.viewDidLoad()
                collectionView.delegate = self
                collectionView.dataSource = self
                self.NameField.delegate = self
                self.emailField.delegate = self
                self.countryCodeField.delegate = self
                self.phoneField.delegate = self
                self.IndustryField.delegate = self
                self.businessField.delegate = self
                self.passwordField.delegate = self
                self.repasswordField.delegate = self
                
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

                 let customType = ActiveType.custom(pattern: "\\sSign\\sIn") //Looks for "are"
                haveAccountLabel.enabledTypes.append(customType)
                haveAccountLabel.urlMaximumLength = 61
                
                haveAccountLabel.customize { label in
                haveAccountLabel.text = "Have an Account? Sign In"
                    haveAccountLabel.numberOfLines = 1
                    haveAccountLabel.lineSpacing = 4
                    haveAccountLabel.customColor[customType] = UIColor(red: 81/255, green: 23/255, blue: 79/255, alpha: 1.0)
                    haveAccountLabel.customSelectedColor[customType] = UIColor.black
                    haveAccountLabel.configureLinkAttribute = { (type, attributes, isSelected) in
                        var atts = attributes
                        switch type {
                        case customType:
                            atts[NSAttributedString.Key.font] = isSelected ? UIFont.boldSystemFont(ofSize: 12) : UIFont.boldSystemFont(ofSize: 12)
                        default: ()
                        }
                        
                        return atts
                    }
                    label.handleCustomTap(for: customType) { _ in self.btnSelection() }
                }
                
            }
            
            func alert(_ title: String, message: String) {
                let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(vc, animated: true, completion: nil)
            }
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                self.view.endEditing(true)
                return false
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

