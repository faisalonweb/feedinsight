//
//  Requirments.swift
//  FeedInsight
//
//  Created by Mac 2014 on 20/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import Foundation
import UIKit


precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return Double(pow(Double(radix), Double(power)))
}
class Requirments {
    
    private static var sharedFunction : Requirments = {
        let requirments = Requirments()
        return requirments
    }()
    
    class func shared () -> Requirments {
        return sharedFunction
    }
    private init(){
        
    }
    
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
    var iMicroText: Double = 0
    var mnMicroText: Double = 0
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
        // multiple factor
        reqArrayFinal.removeAll()        
        self.VitaminA()
        self.VitaminD3()
        self.VitaminE()
        self.BiotinB7()
        self.NiacinB3()
        self.Zinc()
        self.Manganese()
        self.Copper()
        self.Selenium()
        self.Iodine()
        self.Cobalt()
        self.Calcium()
        self.phosphorusCalculate()
        self.Magnesium()
        self.Sulphur()
        self.Chloride()
        self.Sodium()
        self.Potassium()
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
            let pVal = Double(finalProductList[i].P) ?? 0.0
            rationP = rationP + (valueAfterDryMatter[i] * pVal)
            let pAbsVal = Double(finalProductList[i].PAbs) ?? 0.0
            rationPAbs = rationPAbs + (valueAfterDryMatter[i] * pAbsVal)
            let caVal = Double(finalProductList[i].Ca) ?? 0.0
            rationCa = rationCa + (valueAfterDryMatter[i] * caVal)
            let caAbsVal = Double(finalProductList[i].CaAbs) ?? 0.0
            rationCaAbs = rationCaAbs + (valueAfterDryMatter[i] * caAbsVal)
            let mgVal = Double(finalProductList[i].Mg) ?? 0.0
            rationMg = rationMg + (valueAfterDryMatter[i] * mgVal)
            let mgAbsVal = Double(finalProductList[i].MgAbs) ?? 0.0
            rationMgAbs = rationMgAbs + (valueAfterDryMatter[i] * mgAbsVal)
            let kVal = Double(finalProductList[i].K) ?? 0.0
            rationK = rationK + (valueAfterDryMatter[i] * kVal)
            let SVal = Double(finalProductList[i].S) ?? 0.0
            rationS = rationS + (valueAfterDryMatter[i] * SVal)
            let NaVal = Double(finalProductList[i].Na) ?? 0.0
            rationNa = rationNa + (valueAfterDryMatter[i] * NaVal)
            let ClVal = Double(finalProductList[i].Cl) ?? 0.0
            rationCl = rationCl + (valueAfterDryMatter[i] * ClVal)
            let FeVal = Double(finalProductList[i].Fe) ?? 0.0
            rationFe = rationFe + (valueAfterDryMatter[i] * FeVal)
            let ZnVal = Double(finalProductList[i].Zn) ?? 0.0
            rationZn = rationZn + (valueAfterDryMatter[i] * ZnVal)
            let CuVal = Double(finalProductList[i].Cu) ?? 0.0
            rationCu = rationCu + (valueAfterDryMatter[i] * CuVal)
            let mnVal = Double(finalProductList[i].Mn) ?? 0.0
            rationMn = rationMn + (valueAfterDryMatter[i] * mnVal)
            let seVal = Double(finalProductList[i].Se) ?? 0.0
            rationSe = rationSe + (valueAfterDryMatter[i] * seVal)
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
        rationArrayFinal.removeAll()
        rationArrayFinal.append(rationVitaminA)
        rationArrayFinal.append(rationVitaminD3)
        rationArrayFinal.append(rationVitaminE)
        rationArrayFinal.append(rationBiotin)
        rationArrayFinal.append(rationNiacin)
        rationArrayFinal.append(rationZn)
        rationArrayFinal.append(rationMn)
        rationArrayFinal.append(rationCu)
        rationArrayFinal.append(rationSe)
        rationArrayFinal.append(rationI)
        rationArrayFinal.append(rationCo)
        rationArrayFinal.append(rationCa)
        rationArrayFinal.append(rationP)
        rationArrayFinal.append(rationMg)
        rationArrayFinal.append(rationNa)
        rationArrayFinal.append(rationCl)
        rationArrayFinal.append(rationS)
        rationArrayFinal.append(rationK)
    }
    
    func appendPremixValues () {
        // multiple factor
        primexArrayFinal.removeAll()
        primexArrayFinal.append(aiuVitamin)
        primexArrayFinal.append(diuVitamin)
        primexArrayFinal.append(eiuVitamin)
        primexArrayFinal.append(biotinVitamin)
        primexArrayFinal.append(niacinVitamin)
        primexArrayFinal.append(znMicroText)
        primexArrayFinal.append(mnMicroText)
        primexArrayFinal.append(cuMicroText)
        primexArrayFinal.append(seMicroText)
        primexArrayFinal.append(iMicroText)
        primexArrayFinal.append(coMicroText)
        primexArrayFinal.append(caMacroText)
        primexArrayFinal.append(pMacroText)
        primexArrayFinal.append(mgMacroText)
        primexArrayFinal.append(naMacroText)
        primexArrayFinal.append(clMacroText)
        primexArrayFinal.append(sMacroText)
        primexArrayFinal.append(kMacroText)
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
                
            }
            
            
        default:
            print("animal group not found")
        }
        // multiple factor
        waterArrayFinal.removeAll()
        waterArrayFinal.append(waterCaVal)
        waterArrayFinal.append(waterPVal)
        waterArrayFinal.append(waterMgVal)
        waterArrayFinal.append(waterNaVal)
        waterArrayFinal.append(waterClVal)
        waterArrayFinal.append(waterSVal)
        waterArrayFinal.append(waterKVal)
        
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
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (1.2 + (4.66 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22)) * g
            final = final + final1
            // Last Trimester        // calculte 1GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            let WBC = 41.7 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (19.1-5.46*(40-WBC))
                final2 = 7.38/(1 + 2.718 ^^ a)
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.9
            final = final + final3
        
        case "Sheep/Goat" :
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.905 * DMI + 0.3 + 0.002 * mycurrentweight
            print("Sheep phosphorus result : \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (1.2 + (3.19 * bwt1 ^^ 0.28 * mycurrentweight ^^ -0.28)) * g
            final = final + final1
            // Last Trimester // calculte 1GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 21.4)
            var final2 : Double = 0.0
            if(gpro > 66.0) {
                final2 = 0.9
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.5
            final = final + final3
            
        case "Beef cow" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Beef phosphorus result : \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (1.2 + (4.66 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22)) * g
            final = final + final1
            // Last Trimester // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            let WBC = 41.7 - (dp1 / 7)
            var final2 : Double = 0.0
            if(gpro > 66.0) {
                let a : Double = 19.1-5.46*(40-WBC)
                final2 = 7.38/(1 + 2.718 ^^ a)
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.9
            final = final + final3
            
        case "Buffalo" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Buffalo phosphorus result \(final)")
            
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (1.2 + (4.66 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22)) * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 44.2)
            var final2 = 0.0
            let WBC = 44.2 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (19.1-5.46*(40-WBC))
                final2 = 7.38/(1 + 2.718 ^^ a)
                //final2 = =if(GPRO>66, if(AT="Buffalo",7.38/(1+EXP(19.1-5.46*(40-WBC))),""),"")
            }
            
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1
            final = final + final3
            
        case "Deer" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.905 * DMI + 0.3 + 0.002 * mycurrentweight
            print("Deer phosphorus result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (1.2 + (3.19 * bwt1 ^^ 0.28 * mycurrentweight ^^ -0.28)) * g
            final = final + final1
            // Last Trimester // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 28.7)
            var final2 : Double = 0.0
            if(gpro > 66.0) {
                final2 = 0.9
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.95
            final = final + final3
            
        case "Camel" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Camel phosphorus result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (1.2 + (4.66 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22)) * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 60.0)
            var final2 = 0.0
            let WBC = 60.0 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (19.1-5.46*(40-WBC))
                final2 = 7.38/(1 + 2.718 ^^ a)
                //final2 = =if(GPRO>66, if(AT="Camel",7.38/(1+EXP(19.1-5.46*(40-WBC))),""),"")
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.9
            final = final + final3
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (9.83 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22) * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            let WBC = 41.7 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (18.8-5.03*(40-WBC))
                final2 = 23.5/(1 + 2.718 ^^ a)
                // final 2 = =if(GPRO>66, if(AT="Dairy Cow",23.5/(1+EXP(18.8-5.03*(40-WBC))),""),"")
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.2
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            print("Sheep phosphorus result : \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (6.75 * bwt1 ^^ 0.28 * mycurrentweight ^^ -0.28) * g
            final = final + final1
            // Last Trimester // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 21.4)
            var final2 : Double = 0.0
            if(gpro > 66.0) {
                final2 = 1.5
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.9
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            print("Beef phosphorus result : \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (9.83 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22) * g
            final = final + final1
            // Last Trimester // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 : Double = 0.0
            let WBC = 41.7 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (18.8-5.03*(40-WBC))
                final2 = 23.5/(1 + 2.718 ^^ a)
                //final2 = 0.9
                //=if(GPRO>66, if(AT="Beef Cow",23.5/(1+EXP(18.8-5.03*(40-WBC))),""),"")
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.25
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            print("Buffalo phosphorus result \(final)")
            
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (9.83 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22) * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 44.2)
            var final2 = 0.0
            let WBC = 44.2 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (18.8-5.03*(40-WBC))
                final2 = 23.5/(1 + 2.718 ^^ a)
                //final2 = =if(GPRO>66, if(AT="Buffalo",23.5/(1+EXP(18.8-5.03*(40-WBC))),""),"")
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.25
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            print("Deer phosphorus result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (6.75 * bwt1 ^^ 0.28 * mycurrentweight ^^ -0.28) * g
            final = final + final1
            // Last Trimester // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 28.7)
            var final2 : Double = 0.0
            if(gpro > 66.0) {
                final2 = 2.0
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.25
            final = final + final3
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.83 * DMI + 0.002 * mycurrentweight
            print("Camel phosphorus result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = (9.83 * bwt1 ^^ 0.22 * mycurrentweight ^^ -0.22) * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 60.0)
            var final2 = 0.0
            let WBC = 60.0 - (dp1 / 7)
            if(gpro > 66.0) {
                let a : Double = (18.8-5.03*(40-WBC))
                final2 = 23.5/(1 + 2.718 ^^ a)
                //final2 = =if(GPRO>66, if(AT="Camel",23.5/(1+EXP(18.8-5.03*(40-WBC))),""),"")
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.25
            final = final + final3
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
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
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
        case "Sheep/Goat" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.014 * mycurrentweight
            print("Sheep result : \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 21.4)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.03
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.18
            final = final + final3
        case "Beef cow" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Beef result : \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
        case "Buffalo" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Buffalo result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 44.2)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
        case "Deer" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Deer result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 28.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.05
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
        case "Camel" :
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            final = 0.011 * mycurrentweight
            print("Camel result \(final)")
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 60.0)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
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
            // Gain
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.6 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.5
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.8 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 21.4)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.2
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.4
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.6 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.5
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.6 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 44.2)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.5
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.8 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 28.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.8
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.6 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 60.0)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 1.5
            final = final + final3
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
//        if(self.anionic == false) {
//            final = DMI * 10
//        }
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
            // Gain
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.45
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.9 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 21.4)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.45
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.45
            final = final + final3
            
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 44.2)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.45
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.2 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 28.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.45
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1.4 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 60.0)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1.3
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.45
            final = final + final3
            
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
//        if(anionic == false) {
//            final = DMI * 3
//        } else {
//            final = final * 1.1
//        }
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
            // Gain
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 0.7 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 21.4)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.4
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
            
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
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 41.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
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
            
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 44.2)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 28.7)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 0.4
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.3
            final = final + final3
            
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
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            let g = (bwt1 - mycurrentweight) / dc1
            let final1 = 1 * g
            final = final + final1
            // Last Trimester        // calculte GPRO
            let dp = self.daysPregnant
            let dp1 = Double(dp!) ?? 0
            let gpro = 100 * ((dp1 / 7) / 60.0)
            var final2 = 0.0
            if(gpro > 66.0) {
                final2 = 1
            }
            final = final + final2
            // Lactation
            let mp = self.milkProduction
            let mp1 = Double(mp!) ?? 0
            let final3 : Double = mp1 * 0.15
            final = final + final3
            
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
//        if(self.anionic == true) {
//            final = DMI * 3
//        }
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
        print("Final Array \(final)")
//        if(self.anionic == true) {
//            final = DMI * 3.5
//        }
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
        print("Final Array \(final)")
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
        print("Final Array \(final)")
        //final = final * 1.2
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
        print("Final Array \(final)")
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
        print("Final Array \(final)")
        //final = final * 1.1
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
        print("Final Array \(final)")
        //final = final * 1.1
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
        print("Final Array \(final)")
//        if(self.anionic == true) {
//            final = 7
//        } else if (metaBolic == true) {
//            final = final * 1.4
//        } else {
//            final = final * 1.3
//        }
        
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
                
            }
            
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
        //final = final * 1.5
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
                
            }
            
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
        //final = final * 1.2
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
                
            }
            
            
        default:
            print("animal group not found")
        }
        print("Final Array \(final)")
//        if(heatStress == true || anionic == true || metaBolic == true) {
//            final = 1000
//        } else {
//            final = final * 1.2
//        }
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
        print("Final Array \(final)")
//        if(heatStress == true || anionic == true) {
//            final = final * 1.5
//        }
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
//        print("Final Array \(final)")
//        if(self.physiologicalState == "Lactating") {
//            final = 20
//        }
        self.reqArrayFinal.append(final)
    }
    
}
