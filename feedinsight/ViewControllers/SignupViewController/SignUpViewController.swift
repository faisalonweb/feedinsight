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
    import FirebaseFirestore
    import CoreLocation
                    
    class SignUpViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate, CLLocationManagerDelegate {

                       
                        
                            var currentLocation:CLLocation?
                            @IBOutlet weak var locationField: DropDown!
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
                            var db: Firestore!
                            var pickerData1: [String] = [String]()
                            var workarray: [String] = [String]()
                            private let locationManager = LocationManager()
                
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
                         
                            @IBAction func SignupTap(_ sender: UIButton) {
                                let nameEnter = NameField.text!
                                
                                       self.saveText(theText: nameEnter)
                                // it will get all useers data save in user collection
                                db.collection("users").getDocuments() { (querySnapshot, err) in
                                    if let err = err {
                                        print("Error getting documents: \(err)")
                                    } else {
                                        for document in querySnapshot!.documents {
                                            print("\(document.documentID) => \(document.data())")
                                        }
                                    }
                                }
                            }
                            
                            func saveText(theText: String) {
                                                let passwordEnter = passwordField.text!
                                               let industryEnter =    IndustryField.text!
                                               let busindessEnter =   businessField.text!
                                               let repasswordEnter =  repasswordField.text!
                                               let pickanimalEnter =    pickanimalfield.text!
                                               let pickrolEnter =    pickroleField.text!
                                               let emailEnter = emailField.text!
                                               let phoneEnter = phoneField.text!
                                               let PhCodeenter = countryCodeField.text!
                                               let locationEnter = locationField.text!
                                //
                                let dict : [String : Any] = ["name" : theText, "PASSWORD" : passwordEnter, "REPASSWORD" : repasswordEnter, "industry" : industryEnter, "business" : busindessEnter, "pickanimal" : pickanimalEnter, "pickrole" : pickrolEnter, "email" : emailEnter, "phone" : phoneEnter, "contrycode" : PhCodeenter, "location" : locationEnter]

                                //
                                  let db = Firestore.firestore()
                                  db.collection("users").addDocument(data: dict){ err in
                                                    if let err = err {
                                                        print("Error adding document: \(err)")
                                                    } else {
                                                        print("Document added")
                                                    }
                                                }
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
                                db = Firestore.firestore()
                                self.setCurrentLocation()
                //                db.collection("users").whereField("name", isEqualTo: "nat").getDocuments { (SnapshotMetadata, Error) in
                //                    if (Error != nil) {
                //                        print(Error)
                //                    }
                //                    else
                //                    {
                //                        for document in (SnapshotMetadata?.documents)! {
                //                            let name = document.data()["name"] as? String
                //                            print(name!)
                //                        }
                //                    }
                //
                //                }
                //
                //                let name = " saima"
                //                let age = "19"
                //                let dict : [String : Any] = ["name" : name, "age" : age]
                //                let db = Firestore.firestore()
                //                db.collection("users").document("nat").setData(dict)
                                //
                                
                                // Add a new document with a generated ID
                //                var ref: DocumentReference? = nil
                //                ref = db.collection("users").addDocument(data: [
                //                    "first": "Ada",
                //                    "last": "lace",
                //                    "born": 1815
                //                ]) { err in
                //                    if let err = err {
                //                        print("Error adding document: \(err)")
                //                    } else {
                //                        print("Document added with ID: \(ref!.documentID)")
                //                    }
                //                }
                                
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
                             
                            let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
                                                let lineArray = text.components(separatedBy: "\n")
                                               for eachLA in lineArray
                                               {
                                                    workarray = eachLA.components(separatedBy: ",")
                                                    pickerData1.append(workarray[0])
                                                   
                                               }
                                //print("its array:",pickerData1)
                                
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
                                locationField.optionArray = pickerData1
                                locationField.didSelect{(selectedText , index ,id) in
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

