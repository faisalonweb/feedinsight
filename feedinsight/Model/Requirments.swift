//
//  Requirments.swift
//  FeedInsight
//
//  Created by Mac 2014 on 20/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import Foundation
import UIKit

class Requirments {
    
    var companyName : String?
    var animalGroup : String?
    var physiologicalState : String?
    var currentBodyWeight : String?
    var targetBodyWeight : String?
    var achieveTargetWeight : String?
    var daysInMilk : String?
    var daysPregnant : String?
    var milkProduction : String?
    var animalKind : String?
    var heatStress : Bool!
    var metaBolic : Bool!
    var anionic : Bool!
    var woolProduction : Bool!
    
    
    func setStateValue (companyName : String , animalGroup : String , physiologicalState : String , currentBodyWeight : String , targetBodyWeight : String , achieveTargerWeight : String , daysInMilk : String , daysPregnant : String , milkProduction :String , animalKind : String , heatStress : Bool , metaBolic : Bool , anionic : Bool , woolProduction : Bool) {
        
        self.companyName = companyName
        self.animalGroup = animalGroup
        self.physiologicalState = physiologicalState
        self.currentBodyWeight = currentBodyWeight
        self.targetBodyWeight = targetBodyWeight
        self.achieveTargetWeight = achieveTargerWeight
        self.animalKind = animalKind
        self.daysInMilk = daysInMilk
        self.daysPregnant = daysPregnant
        self.milkProduction = milkProduction
        self.heatStress = heatStress
        self.metaBolic = metaBolic
        self.anionic = anionic
        self.woolProduction = woolProduction
        
        print("hello from requirments modeal \(self.animalKind ?? "None")")
       
    }
    func phosphorusCalculate () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.83 * 0.1 + 0.002 * mycurrentweight
            print("goat phosphorus result : \(final)")

        case "Sheep/Goat" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.905 * 0.1 + 0.3 + 0.002 * mycurrentweight
            print("Sheep phosphorus result : \(final)")

        case "Beef cow" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.83 * 0.1 + 0.002 * mycurrentweight
            print("Beef phosphorus result : \(final)")

        case "Buffalo" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.83 * 0.1 + 0.002 * mycurrentweight
            print("Buffalo phosphorus result \(final)")

        case "Deer" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.905 * 0.1 + 0.3 + 0.002 * mycurrentweight
            print("Deer phosphorus result \(final)")

        case "Camel" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.83 * 0.1 + 0.002 * mycurrentweight
            print("Camel phosphorus result \(final)")


        default:
            print("animal group not found")
        }
    }
    func Calcium () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.67 * 0.1 + 0.01 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.67 * 0.1 + 0.01 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.67 * 0.1 + 0.01 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.67 * 0.1 + 0.01 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.663 * 0.1 + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        default:
            print("animal group not found")
        }
    }

    func Magnesium() {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.011 * mycurrentweight
            print("goat result : \(final)")

        case "Sheep/Goat" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.014 * mycurrentweight
            print("Sheep result : \(final)")

        case "Beef cow" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.011 * mycurrentweight
            print("Beef result : \(final)")

        case "Buffalo" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.011 * mycurrentweight
            print("Buffalo result \(final)")

        case "Deer" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.011 * mycurrentweight
            print("Deer result \(final)")

        case "Camel" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.011 * mycurrentweight
            print("Camel result \(final)")


        default:
            print("animal group not found")
        }
    }
    func Potassium () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }

        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }



        default:
            print("animal group not found")
        }
    }

    func Sodium () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }

        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }



        default:
            print("animal group not found")
        }
    }

    func Chloride() {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }


        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }

        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }



        default:
            print("animal group not found")
        }
    }

    func Sulphur () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            let final = 2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Sheep/Goat" :

            if (self.woolProduction == true){
                let final = 2.7 * 0.1 // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                let final = 2 * 0.1 // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }

        case "Beef Cows" :

            let final = 2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Buffalo" :

            let final = 2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Deer" :

            if (self.woolProduction == true){
                let final = 2.7 * 0.1 // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                let final = 2.2 * 0.1 // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }

        case "Camel" :

            let final = 2.7 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")



        default:
            print("animal group not found")
        }
    }
    func Cobalt () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            let final = 0.3 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Sheep/Goat" :

            let final = 0.3 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Beef Cows" :

            let final = 0.3 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Buffalo" :

            let final = 0.3 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Deer" :

            let final = 0.3 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Camel" :

            let final = 0.3 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")



        default:
            print("animal group not found")
        }
    }

    func Copper () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            let final = 10 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Sheep/Goat" :

            let final = 10 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Beef Cows" :

            let final = 10 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Buffalo" :

            let final = 10 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Deer" :

            if (self.physiologicalState == "Lactating"){

                let final = 15 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 25 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }


        case "Camel" :

            let final = 10 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")



        default:
            print("animal group not found")
        }
    }

    func Iodine () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            if (self.physiologicalState == "Lactating"){

                let final = 0.8 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 0.5 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }

        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){

                let final = 0.8 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 0.5 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }

        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){

                let final = 0.8 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 0.5 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }

        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){

                let final = 0.8 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 0.5 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){

                let final = 0.8 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 0.5 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }


        case "Camel" :

            if (self.physiologicalState == "Lactating"){

                let final = 0.8 * 0.1     // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }
            else {

                let final = 0.5 * 0.1    // 0.1 is dry matter intake
                print("Lactation result : \(final)")
            }



        default:
            print("animal group not found")
        }
    }

    func Manganese () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Sheep/Goat" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Beef Cows" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Buffalo" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Deer" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Camel" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")



        default:
            print("animal group not found")
        }
    }

    func Zinc () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Sheep/Goat" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Beef Cows" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Buffalo" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Deer" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Camel" :

            let final = 50 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")



        default:
            print("animal group not found")
        }
    }

    func Selenium () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :

            let final = 0.2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Sheep/Goat" :

            let final = 0.2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Beef Cows" :

            let final = 0.2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Buffalo" :

            let final = 0.2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Deer" :

            let final = 0.2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")

        case "Camel" :

            let final = 0.2 * 0.1 // 0.1 is dry matter intake
            print("Lactation result : \(final)")



        default:
            print("animal group not found")
        }
    }
    func VitaminA () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 110 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 80 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 110 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 178 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 333 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 152 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 84 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 47 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 60 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 110 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 80 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 110 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 178 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 333 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 152 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 110 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 80 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 110 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        default:
            print("animal group not found")
        }
    }

    func VitaminD3 () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 5.7 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 5.7 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 5.7 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        default:
            print("animal group not found")
        }
    }

    func VitaminE () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Sheep/Goat" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 6 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 10 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        case "Beef Cows" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.8 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 0.8 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Buffalo" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }

        case "Deer" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 6 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 10 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :

            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.25 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                let final = 1.6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }


        default:
            print("animal group not found")
        }
    }

    func NiacinB3 () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 10 * mycurrentweight
            print("goat result : \(final)")

        case "Sheep/Goat" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 9 * mycurrentweight
            print("Sheep result : \(final)")

        case "Beef cow" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 10 * mycurrentweight
            print("Beef result : \(final)")

        case "Buffalo" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 10 * mycurrentweight
            print("Buffalo result \(final)")

        case "Deer" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 9 * mycurrentweight
            print("Deer result \(final)")

        case "Camel" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 10 * mycurrentweight
            print("Camel result \(final)")


        default:
            print("animal group not found")
        }
    }

    func BiotinB7 () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.03 * mycurrentweight
            print("goat result : \(final)")

        case "Sheep/Goat" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.03 * mycurrentweight
            print("Sheep result : \(final)")

        case "Beef cow" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.03 * mycurrentweight
            print("Beef result : \(final)")

        case "Buffalo" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.03 * mycurrentweight
            print("Buffalo result \(final)")

        case "Deer" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.03 * mycurrentweight
            print("Deer result \(final)")

        case "Camel" :

            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            let final = 0.03 * mycurrentweight
            print("Camel result \(final)")


        default:
            print("animal group not found")
        }
    }
    
}
