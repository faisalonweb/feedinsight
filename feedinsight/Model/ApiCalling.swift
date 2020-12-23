//
//  ApiCalling.swift
//  FeedInsight
//
//  Created by Mac 2014 on 15/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

class ApiCalling {
    var animalList = [NSDictionary]()
    var waterList = [NSDictionary]()
    var rationList = [NSDictionary]()
    var customPoultryData = [NSDictionary]()
    var premixList = [NSDictionary]()
    var loginList = [NSDictionary]()
    func LoadProfile(completion: @escaping ([NSDictionary]) -> ()) {
        Firestore.firestore().collection("animalState").document(Auth.auth().currentUser?.uid ?? "").collection("animalState").getDocuments{(snapshot,error) in
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let documentData = document.data()
                    print (documentData)
                    self.animalList.append(documentData as NSDictionary)
                }
                completion(self.animalList)
            }
            else {
                print("pakis")
            }
        }
    }
    func WaterData(completion: @escaping ([NSDictionary])-> ()) {
        Firestore.firestore().collection("waterReports").document(Auth.auth().currentUser?.uid ?? "").collection("waterReports").getDocuments{(snapshot,error) in
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let documentData = document.data()
                    print (documentData)
                    self.waterList.append(documentData as NSDictionary)
                }
                completion(self.waterList)
            }
            else {
                print("Error in Water")
            }
        }
    }
    func RationData(completion: @escaping ([NSDictionary])-> ()) {
        Firestore.firestore().collection("rationReports").document(Auth.auth().currentUser?.uid ?? "").collection("rationReports").getDocuments{(snapshot,error) in
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let documentData = document.data()
                    print (documentData)
                    self.rationList.append(documentData as NSDictionary)
                    
                }
                completion(self.rationList)
            }
            else {
                print("Error In Ration")
            }
        }
    }
    
    func customPoultryData(completion: @escaping ([NSDictionary])-> ()) {
        Firestore.firestore().collection("poultryCustomData").document(Auth.auth().currentUser?.uid ?? "").collection("poultryCustomData").getDocuments{(snapshot,error) in
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let documentData = document.data()
                    print (documentData)
                    self.customPoultryData.append(documentData as NSDictionary)
                    
                }
                completion(self.customPoultryData)
            }
            else {
                print("Error In Ration")
            }
        }
    }
    
    
    func PremixData(completion: @escaping ([NSDictionary])-> ()) {
        Firestore.firestore().collection("premixReports").document(Auth.auth().currentUser?.uid ?? "").collection("premixReports").getDocuments{(snapshot,error) in
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let documentData = document.data()
                    print (documentData)
                    self.premixList.append(documentData as NSDictionary)
                   
                }
                completion(self.premixList)
            }
            else {
                print("Error in Premix")
            }
        }
    }
    func LoginData(completion: @escaping ([String : Any])-> ()) {
        let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            else if querySnapshot!.documents.count != 1 {
              print("User not found, Please try again.")
            }
            else {
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                completion(dataDescription!)
            }
        }
    }
    
}
