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
    // Requirment Values
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
    var DMI : Double!
    var reqArrayFinal = [Double]()
    // Ration Data Array
    var finalProductList: [Person] = []
    var finalDropdownfloatValue = [String]()
    var valueAfterDryMatter = [Double]()
    // Ration Values
    var rationCa:Double = 0
    var rationCaAbs:Double = 0
    var rationP: Double = 0
    var rationPAbs: Double = 0
    var rationMg: Double = 0
    var rationMgAbs: Double = 0
    var rationK: Double = 0
    var rationS: Double = 0
    var rationNa: Double = 0
    var rationCl: Double = 0
    var rationFe: Double = 0
    var rationZn: Double = 0
    var rationCu: Double = 0
    var rationMn: Double = 0
    var rationSe: Double = 0
    var rationCo: Double = 0
    var rationI: Double = 0
    var rationVitaminA: Double = 0
    var rationVitaminD3: Double = 0
    var rationVitaminE: Double = 0
    var rationNiacin: Double = 0
    var rationBiotin : Double = 0
    var rationArrayFinal = [Double]()
    // Water Values
    var waterPVal : Double = 0
    var waterCaVal : Double = 0
    var waterMgVal : Double = 0
    var waterKVal : Double = 0
    var waterNaVal : Double = 0
    var waterClVal : Double = 0
    var waterSVal : Double = 0
    var waterArrayFinal = [Double]()
    // Premix Values
    var productName: String?
    var productDose: Double = 0
    var pMacroText: Double = 0
    var caMacroText: Double = 0
    var mgMacroText: Double = 0
    var kMacroText: Double = 0
    var naMacroText: Double = 0
    var clMacroText: Double = 0
    var sMacroText: Double = 0
    var coMicroText: Double = 0
    var cuMicroText: Double = 0
    var cuOrganicMicroText: Double = 0
    var seMicroText: Double = 0
    var seOrganicMicroText: Double = 0
    var znMicroText: Double = 0
    var znOrganicMicroText: Double = 0
    var aiuVitamin: Double = 0
    var diuVitamin: Double = 0
    var eiuVitamin: Double = 0
    var niacinVitamin: Double = 0
    var biotinVitamin: Double = 0
    var primexArrayFinal = [Double]()
    
    func calculateRequirmentsData() {
        self.phosphorusCalculate()
        self.Calcium()
        self.Magnesium()
        self.Potassium()
        self.Sodium()
        self.Chloride()
        self.Sulphur()
        self.Cobalt()
        self.Copper()
        self.Iodine()
        self.Manganese()
        self.Zinc()
        self.Selenium()
        self.VitaminA()
        self.VitaminD3()
        self.VitaminE()
        self.NiacinB3()
        self.BiotinB7()
    }
    func calculateRationData () {
        for i in 0..<finalDropdownfloatValue.count {
            var value = Double(finalDropdownfloatValue[i])! * Double(finalProductList[i].DryMatter)!
            value = value / 100.0
            valueAfterDryMatter.append(value)
        }
        calculateRationDataParameters()
    }
    func calculateRationDataParameters() {
        for i in 0..<finalDropdownfloatValue.count {
            rationP = rationP + (valueAfterDryMatter[i] * Double(finalProductList[i].P)!)
            rationPAbs = rationPAbs + (valueAfterDryMatter[i] * Double(finalProductList[i].PAbs)!)
            rationCa = rationCa + (valueAfterDryMatter[i] * Double(finalProductList[i].Ca)!)
            rationCaAbs = rationCaAbs + (valueAfterDryMatter[i] * Double(finalProductList[i].CaAbs)!)
            rationMg = rationMg + (valueAfterDryMatter[i] * Double(finalProductList[i].Mg)!)
            rationMgAbs = rationMgAbs + (valueAfterDryMatter[i] * Double(finalProductList[i].MgAbs)!)
            rationK = rationK + (valueAfterDryMatter[i] * Double(finalProductList[i].K)!)
            rationS = rationS + (valueAfterDryMatter[i] * Double(finalProductList[i].S)!)
            rationNa = rationNa + (valueAfterDryMatter[i] * Double(finalProductList[i].Na)!)
            rationCl = rationCl + (valueAfterDryMatter[i] * Double(finalProductList[i].Cl)!)
            rationFe = rationFe + (valueAfterDryMatter[i] * Double(finalProductList[i].Fe)!)
            rationZn = rationZn + (valueAfterDryMatter[i] * Double(finalProductList[i].Zn)!)
            rationCu = rationCu + (valueAfterDryMatter[i] * Double(finalProductList[i].Cu)!)
            rationMn = rationMn + (valueAfterDryMatter[i] * Double(finalProductList[i].Mn)!)
            rationSe = rationSe + (valueAfterDryMatter[i] * Double(finalProductList[i].Se)!)
            let coVal = Double(finalProductList[i].Co) ?? 0.0
            rationCo = rationCo + (valueAfterDryMatter[i] * coVal)
            let iVal = Double(finalProductList[i].I) ?? 0.0
            rationI = rationI + (valueAfterDryMatter[i] * iVal)
            let VitaminA = Double(finalProductList[i].VitaminA) ?? 0.0
            rationVitaminA = rationVitaminA + (valueAfterDryMatter[i] * VitaminA)
            let VitaminE = Double(finalProductList[i].VitaminE) ?? 0.0
            rationVitaminE = rationVitaminE + (valueAfterDryMatter[i] * VitaminE)
            let VitaminD3 = Double(finalProductList[i].VitaminD3) ?? 0.0
            rationVitaminD3 = rationVitaminD3 + (valueAfterDryMatter[i] * VitaminD3)
            let Niacin = Double(finalProductList[i].Niacin) ?? 0.0
            rationNiacin = rationNiacin + (valueAfterDryMatter[i] * Niacin)
            let Biotin = Double(finalProductList[i].Biotin) ?? 0.0
            rationBiotin = rationBiotin + (valueAfterDryMatter[i] * Biotin)
        }
        rationP = rationP * 10.0
        rationPAbs = rationPAbs * 10.0
        rationCa = rationCa * 10.0
        rationCaAbs = rationCaAbs * 10.0
        rationMg = rationMg * 10.0
        rationMgAbs = rationMgAbs * 10.0
        rationK = rationK * 10.0
        rationS = rationS * 10.0
        rationNa = rationNa * 10.0
        rationCl = rationCl * 10.0
        rationArrayFinal.append(rationCa)
//        rationArrayFinal.append(rationCaAbs)
        rationArrayFinal.append(rationP)
//        rationArrayFinal.append(rationPAbs)
        rationArrayFinal.append(rationMg)
//        rationArrayFinal.append(rationMgAbs)
        rationArrayFinal.append(rationK)
        rationArrayFinal.append(rationS)
        rationArrayFinal.append(rationNa)
        rationArrayFinal.append(rationCl)
//        rationArrayFinal.append(rationFe)
        rationArrayFinal.append(rationZn)
        rationArrayFinal.append(rationCu)
        rationArrayFinal.append(rationMn)
        rationArrayFinal.append(rationSe)
        rationArrayFinal.append(rationCo)
        rationArrayFinal.append(rationI)
        rationArrayFinal.append(rationVitaminA)
        rationArrayFinal.append(rationVitaminD3)
        rationArrayFinal.append(rationVitaminE)
        rationArrayFinal.append(rationNiacin)
        rationArrayFinal.append(rationBiotin)
        
        print("done")
    }
    
    func appendPremixValues () {
        primexArrayFinal.append(pMacroText)
        primexArrayFinal.append(caMacroText)
        primexArrayFinal.append(mgMacroText)
        primexArrayFinal.append(kMacroText)
        primexArrayFinal.append(naMacroText)
        primexArrayFinal.append(clMacroText)
        primexArrayFinal.append(sMacroText)
        primexArrayFinal.append(coMicroText)
        primexArrayFinal.append(cuMicroText)
        primexArrayFinal.append(0.0)
        primexArrayFinal.append(0.0)
        primexArrayFinal.append(seMicroText)
        primexArrayFinal.append(znMicroText)
        primexArrayFinal.append(aiuVitamin)
        primexArrayFinal.append(diuVitamin)
        primexArrayFinal.append(eiuVitamin)
        primexArrayFinal.append(niacinVitamin)
        primexArrayFinal.append(biotinVitamin)
    }
    func waterCalculations () {
        let animalType = self.animalKind
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                waterPVal = (150.0 * waterPVal) * 0.001
                waterKVal = (150.0 * waterKVal) * 0.001
                waterSVal = (150.0 * waterSVal) * 0.001
                waterCaVal = (150.0 * waterCaVal) * 0.001
                waterClVal = (150.0 * waterClVal) * 0.001
                waterMgVal = (150.0 * waterMgVal) * 0.001
                waterNaVal = (150.0 * waterNaVal) * 0.001
            }
            else if (physiologicalState == "Growing"){
                waterPVal = (70.0 * waterPVal) * 0.001
                waterKVal = (70.0 * waterKVal) * 0.001
                waterSVal = (70.0 * waterSVal) * 0.001
                waterCaVal = (70.0 * waterCaVal) * 0.001
                waterClVal = (70.0 * waterClVal) * 0.001
                waterMgVal = (70.0 * waterMgVal) * 0.001
                waterNaVal = (70.0 * waterNaVal) * 0.001
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                waterPVal = (100.0 * waterPVal) * 0.001
                waterKVal = (100.0 * waterKVal) * 0.001
                waterSVal = (100.0 * waterSVal) * 0.001
                waterCaVal = (100.0 * waterCaVal) * 0.001
                waterClVal = (100.0 * waterClVal) * 0.001
                waterMgVal = (100.0 * waterMgVal) * 0.001
                waterNaVal = (100.0 * waterNaVal) * 0.001
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                waterPVal = (20.0 * waterPVal) * 0.001
                waterKVal = (20.0 * waterKVal) * 0.001
                waterSVal = (20.0 * waterSVal) * 0.001
                waterCaVal = (20.0 * waterCaVal) * 0.001
                waterClVal = (20.0 * waterClVal) * 0.001
                waterMgVal = (20.0 * waterMgVal) * 0.001
                waterNaVal = (20.0 * waterNaVal) * 0.001
            }
            else if (physiologicalState == "Growing"){
                waterPVal = (8.0 * waterPVal) * 0.001
                waterKVal = (8.0 * waterKVal) * 0.001
                waterSVal = (8.0 * waterSVal) * 0.001
                waterCaVal = (8.0 * waterCaVal) * 0.001
                waterClVal = (8.0 * waterClVal) * 0.001
                waterMgVal = (8.0 * waterMgVal) * 0.001
                waterNaVal = (8.0 * waterNaVal) * 0.001
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                waterPVal = (15.0 * waterPVal) * 0.001
                waterKVal = (15.0 * waterKVal) * 0.001
                waterSVal = (15.0 * waterSVal) * 0.001
                waterCaVal = (15.0 * waterCaVal) * 0.001
                waterClVal = (15.0 * waterClVal) * 0.001
                waterMgVal = (15.0 * waterMgVal) * 0.001
                waterNaVal = (15.0 * waterNaVal) * 0.001
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                waterPVal = (150.0 * waterPVal) * 0.001
                waterKVal = (150.0 * waterKVal) * 0.001
                waterSVal = (150.0 * waterSVal) * 0.001
                waterCaVal = (150.0 * waterCaVal) * 0.001
                waterClVal = (150.0 * waterClVal) * 0.001
                waterMgVal = (150.0 * waterMgVal) * 0.001
                waterNaVal = (150.0 * waterNaVal) * 0.001
            }
            else if (physiologicalState == "Growing"){
                waterPVal = (70.0 * waterPVal) * 0.001
                waterKVal = (70.0 * waterKVal) * 0.001
                waterSVal = (70.0 * waterSVal) * 0.001
                waterCaVal = (70.0 * waterCaVal) * 0.001
                waterClVal = (70.0 * waterClVal) * 0.001
                waterMgVal = (70.0 * waterMgVal) * 0.001
                waterNaVal = (70.0 * waterNaVal) * 0.001
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                waterPVal = (100.0 * waterPVal) * 0.001
                waterKVal = (100.0 * waterKVal) * 0.001
                waterSVal = (100.0 * waterSVal) * 0.001
                waterCaVal = (100.0 * waterCaVal) * 0.001
                waterClVal = (100.0 * waterClVal) * 0.001
                waterMgVal = (100.0 * waterMgVal) * 0.001
                waterNaVal = (100.0 * waterNaVal) * 0.001
            }
            else {
                print("physiological is empty")
            }
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                waterPVal = (150.0 * waterPVal) * 0.001
                waterKVal = (150.0 * waterKVal) * 0.001
                waterSVal = (150.0 * waterSVal) * 0.001
                waterCaVal = (150.0 * waterCaVal) * 0.001
                waterClVal = (150.0 * waterClVal) * 0.001
                waterMgVal = (150.0 * waterMgVal) * 0.001
                waterNaVal = (150.0 * waterNaVal) * 0.001
            }
            else if (physiologicalState == "Growing"){
                waterPVal = (70.0 * waterPVal) * 0.001
                waterKVal = (70.0 * waterKVal) * 0.001
                waterSVal = (70.0 * waterSVal) * 0.001
                waterCaVal = (70.0 * waterCaVal) * 0.001
                waterClVal = (70.0 * waterClVal) * 0.001
                waterMgVal = (70.0 * waterMgVal) * 0.001
                waterNaVal = (70.0 * waterNaVal) * 0.001
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                waterPVal = (100.0 * waterPVal) * 0.001
                waterKVal = (100.0 * waterKVal) * 0.001
                waterSVal = (100.0 * waterSVal) * 0.001
                waterCaVal = (100.0 * waterCaVal) * 0.001
                waterClVal = (100.0 * waterClVal) * 0.001
                waterMgVal = (100.0 * waterMgVal) * 0.001
                waterNaVal = (100.0 * waterNaVal) * 0.001
            }
            else {
                print("physiological is empty")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                waterPVal = (20.0 * waterPVal) * 0.001
                waterKVal = (20.0 * waterKVal) * 0.001
                waterSVal = (20.0 * waterSVal) * 0.001
                waterCaVal = (20.0 * waterCaVal) * 0.001
                waterClVal = (20.0 * waterClVal) * 0.001
                waterMgVal = (20.0 * waterMgVal) * 0.001
                waterNaVal = (20.0 * waterNaVal) * 0.001
            }
            else if (physiologicalState == "Growing"){
                waterPVal = (8.0 * waterPVal) * 0.001
                waterKVal = (8.0 * waterKVal) * 0.001
                waterSVal = (8.0 * waterSVal) * 0.001
                waterCaVal = (8.0 * waterCaVal) * 0.001
                waterClVal = (8.0 * waterClVal) * 0.001
                waterMgVal = (8.0 * waterMgVal) * 0.001
                waterNaVal = (8.0 * waterNaVal) * 0.001
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                waterPVal = (15.0 * waterPVal) * 0.001
                waterKVal = (15.0 * waterKVal) * 0.001
                waterSVal = (15.0 * waterSVal) * 0.001
                waterCaVal = (15.0 * waterCaVal) * 0.001
                waterClVal = (15.0 * waterClVal) * 0.001
                waterMgVal = (15.0 * waterMgVal) * 0.001
                waterNaVal = (15.0 * waterNaVal) * 0.001
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                waterPVal = (300.0 * waterPVal) * 0.001
                waterKVal = (300.0 * waterKVal) * 0.001
                waterSVal = (300.0 * waterSVal) * 0.001
                waterCaVal = (300.0 * waterCaVal) * 0.001
                waterClVal = (300.0 * waterClVal) * 0.001
                waterMgVal = (300.0 * waterMgVal) * 0.001
                waterNaVal = (300.0 * waterNaVal) * 0.001
            }
            else if (physiologicalState == "Growing"){
                waterPVal = (100.0 * waterPVal) * 0.001
                waterKVal = (100.0 * waterKVal) * 0.001
                waterSVal = (100.0 * waterSVal) * 0.001
                waterCaVal = (100.0 * waterCaVal) * 0.001
                waterClVal = (100.0 * waterClVal) * 0.001
                waterMgVal = (100.0 * waterMgVal) * 0.001
                waterNaVal = (100.0 * waterNaVal) * 0.001
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                waterPVal = (200.0 * waterPVal) * 0.001
                waterKVal = (200.0 * waterKVal) * 0.001
                waterSVal = (200.0 * waterSVal) * 0.001
                waterCaVal = (200.0 * waterCaVal) * 0.001
                waterClVal = (200.0 * waterClVal) * 0.001
                waterMgVal = (200.0 * waterMgVal) * 0.001
                waterNaVal = (200.0 * waterNaVal) * 0.001
            }
            else {
                print("physiological is empty")
            }
            
            
        default:
            print("animal group not found")
        }
        waterArrayFinal.append(waterPVal)
        waterArrayFinal.append(waterCaVal)
        waterArrayFinal.append(waterMgVal)
        waterArrayFinal.append(waterKVal)
        waterArrayFinal.append(waterSVal)
        waterArrayFinal.append(waterNaVal)
        waterArrayFinal.append(waterClVal)
        
    }
    
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
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("goat phosphorus result : \(final)")
            
        case "Sheep/Goat" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.905 * DMI + 0.3 + 0.002 * mycurrentweight
            print("Sheep phosphorus result : \(final)")
            
        case "Beef cow" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Beef phosphorus result : \(final)")
            
        case "Buffalo" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Buffalo phosphorus result \(final)")
            
        case "Deer" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.905 * DMI + 0.3 + 0.002 * mycurrentweight
            print("Deer phosphorus result \(final)")
            
        case "Camel" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Camel phosphorus result \(final)")
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    func Calcium () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.67 * DMI + 0.01 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.67 * DMI + 0.01 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.67 * DMI + 0.01 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.67 * DMI + 0.01 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.663 * DMI + 0.008 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Magnesium() {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("goat result : \(final)")
            
        case "Sheep/Goat" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.014 * mycurrentweight
            print("Sheep result : \(final)")
            
        case "Beef cow" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Beef result : \(final)")
            
        case "Buffalo" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Buffalo result \(final)")
            
        case "Deer" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Deer result \(final)")
            
        case "Camel" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Camel result \(final)")
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    func Potassium () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.115 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.07 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Sodium () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.015 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Chloride() {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.035 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else {
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.023 * mycurrentweight
                print("Lactation result : \(final)")
            }
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Sulphur () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            final = 2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Sheep/Goat" :
            
            if (self.woolProduction == true){
                final = 2.7 * DMI // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                final = 2 * DMI // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
        case "Beef Cows" :
            
            final = 2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Buffalo" :
            
            final = 2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Deer" :
            
            if (self.woolProduction == true){
                final = 2.7 * DMI // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                final = 2.2 * DMI // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
        case "Camel" :
            
            final = 2.7 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    func Cobalt () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            final = 0.3 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Sheep/Goat" :
            
            final = 0.3 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Beef Cows" :
            
            final = 0.3 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Buffalo" :
            
            final = 0.3 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Deer" :
            
            final = 0.3 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Camel" :
            
            final = 0.3 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Copper () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            final = 10 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Sheep/Goat" :
            
            final = 10 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Beef Cows" :
            
            final = 10 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Buffalo" :
            
            final = 10 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 15 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 25 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
            
        case "Camel" :
            
            final = 10 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Iodine () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 0.8 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 0.5 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 0.8 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 0.5 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 0.8 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 0.5 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 0.8 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 0.5 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 0.8 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 0.5 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
            
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                
                final = 0.8 * DMI     // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            else {
                
                final = 0.5 * DMI    // DMI is dry matter intake
                print("Lactation result : \(final)")
            }
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Manganese () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Sheep/Goat" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Beef Cows" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Buffalo" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Deer" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Camel" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Zinc () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Sheep/Goat" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Beef Cows" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Buffalo" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Deer" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Camel" :
            
            final = 50 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func Selenium () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            
            final = 0.2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Sheep/Goat" :
            
            final = 0.2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Beef Cows" :
            
            final = 0.2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Buffalo" :
            
            final = 0.2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Deer" :
            
            final = 0.2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
        case "Camel" :
            
            final = 0.2 * DMI // DMI is dry matter intake
            print("Lactation result : \(final)")
            
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    func VitaminA () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 110 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 80 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 110 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 178 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 333 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 152 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 84 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 47 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 60 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 110 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 80 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 110 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 178 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 333 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 152 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 110 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 80 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 110 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func VitaminD3 () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 5.7 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 5.7 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 5.7 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 30 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func VitaminE () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Sheep/Goat" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 6 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 10 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        case "Beef Cows" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.8 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 0.8 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Buffalo" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
        case "Deer" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 6 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 10 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
        case "Camel" :
            
            if (self.physiologicalState == "Lactating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Lactation result : \(final)")
            }
            else if (self.physiologicalState == "Growing"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.25 * mycurrentweight
                print("Growing result : \(final)")
            }
            else if (self.physiologicalState == "Dry-Gestating"){
                let currentweight = self.currentBodyWeight
                let mycurrentweight = Double(currentweight!) ?? 0
                final = 1.6 * mycurrentweight
                print("Dry Gestation result : \(final)")
            }
            else {
                print("physiological is empty")
            }
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func NiacinB3 () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 10 * mycurrentweight
            print("goat result : \(final)")
            
        case "Sheep/Goat" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 9 * mycurrentweight
            print("Sheep result : \(final)")
            
        case "Beef cow" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 10 * mycurrentweight
            print("Beef result : \(final)")
            
        case "Buffalo" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 10 * mycurrentweight
            print("Buffalo result \(final)")
            
        case "Deer" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 9 * mycurrentweight
            print("Deer result \(final)")
            
        case "Camel" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 10 * mycurrentweight
            print("Camel result \(final)")
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
    func BiotinB7 () {
        let animalType = self.animalKind
        var final : Double = 0
        switch animalType {
        case "Dairy Cows" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.03 * mycurrentweight
            print("goat result : \(final)")
            
        case "Sheep/Goat" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.03 * mycurrentweight
            print("Sheep result : \(final)")
            
        case "Beef cow" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.03 * mycurrentweight
            print("Beef result : \(final)")
            
        case "Buffalo" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.03 * mycurrentweight
            print("Buffalo result \(final)")
            
        case "Deer" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.03 * mycurrentweight
            print("Deer result \(final)")
            
        case "Camel" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.03 * mycurrentweight
            print("Camel result \(final)")
            
            
        default:
            print("animal group not found")
        }
        self.reqArrayFinal.append(final)
    }
    
}
