//
//  PremixCollectionData.swift
//  FeedInsight
//
//  Created by Mac 2014 on 24/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import Foundation
import UIKit


class DataAppend {
    static func getAllPremixData() -> [PremixCollectionCell] {
        var arrData = [PremixCollectionCell]()
        arrData = [
            PremixCollectionCell(img: UIImage(named: "premix")!, titleStr: "Premix Check"),
            PremixCollectionCell(img: UIImage(named: "calculator")!, titleStr: "Unit Converter"),
            PremixCollectionCell(img: UIImage(named: "pdfIcon")!, titleStr: "VMP Guide"),
            PremixCollectionCell(img: UIImage(named: "pdfIcon")!, titleStr: "Feed Profiles")
        ]
        return arrData
    }
    
    static func getAllAnimalData() -> [AnimalCollectionCell] {
        var animalData = [AnimalCollectionCell]()
        animalData = [
            AnimalCollectionCell(animalImg:  UIImage(named: "ruminants")!, animalStr: "Ruminants"),
            AnimalCollectionCell(animalImg:  UIImage(named: "aqua")!, animalStr: "Aqua"),
            AnimalCollectionCell(animalImg:  UIImage(named: "equines")!, animalStr: "Equines"),
            AnimalCollectionCell(animalImg:  UIImage(named: "chicken")!, animalStr: "Chicken"),
            AnimalCollectionCell(animalImg:  UIImage(named: "equines")!, animalStr: "Equines"),
            AnimalCollectionCell(animalImg:  UIImage(named: "ruminants")!, animalStr: "Ruminants")
        ]
        return animalData
    }
    
    static func getAllPickAnimalData() -> [pickAnimal] {
        var pickAnimalData = [pickAnimal]()
        pickAnimalData = [
            pickAnimal(pickAnimalStr: "Dairy Cows"),
            pickAnimal(pickAnimalStr: "Beef Cows"),
            pickAnimal(pickAnimalStr: "Sheep/Goat"),
            pickAnimal(pickAnimalStr: "Camel"),
            pickAnimal(pickAnimalStr: "Deer")
        ]
        return pickAnimalData
    }
    
    static func getAllSignupData() -> [SignupModel] {
        var SignupDataArr = [SignupModel]()
        SignupDataArr = [
            SignupModel(signupStr: "Research", singupImg:  UIImage(named: "research-unselected")!),
            SignupModel(signupStr: "Farming", singupImg:  UIImage(named: "farm-unselected")!),
            SignupModel(signupStr: "FeedManufacturing", singupImg: UIImage(named: "feedmanufacturing-unselected")!)
        ]
        return SignupDataArr
    }
}
