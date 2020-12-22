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
    // Poultry Database Arrays
    
    var selectedPoultryArray = [String]()
    var selectedPoultryArrayValues = [[Any]]()
    
    var totalPoultryValuesArray: [[Any]] = [
        [12500,2500,60,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0.5,60],
        [11000,3500,25,3.5,2.5,6.5,40,10,4.5,0.1,1,0.025,85,90,10,1.5,0.25,0,50],
        [11000,3500,100,5,3.5,12,60,15,5,0.3,2,0.035,110,120,12,2,0.3,0,50],
        //[25000000,5000000,120000,4000 ,4000,12000,80000,20000,6000,2000,20,200,60000, 10000, 80000, 80000, 500, 1000, 200],
        //[24000000, 7000000, 30000, 7000, 5000, 13000, 80000, 20000, 9000, 2000, 50, 200, 50000,10000, 85000, 90000, 0, 1500, 250],
        //[22000000, 7000000, 200000, 10000, 7000, 24000, 120000, 30000, 10000, 4000, 70, 600,50000,12000, 110000, 120000, 0 , 2000, 300],
        
        [12000,5000,80,3.2,3.2,8.6,65,20,4.3,0.22,2.2,0.017,110,120,16,1.25,0.3,0,20],
        [10000,4500,65,3,2.5,6.5,60,18,3.2,0.18,1.9,0.017,110,120,16,1.25,0.3,0,20],
        [9000,4000,55,2.2,2.2,5.4,45,15,2.2,0.15,1.6,0.011,110,120,16,1.25,0.3,0,20],
        
        [13000,5000,80,3,3,9,60,15,4,0.15,2,0.02,100,100,15,1,0.35,0,40],
        [10000,5000,50,3,2,8,50,12,3,0.12,2,0.015,100,100,15,1,0.35,0,40],
        [10000,5000,50,3,2,6,50,10,3,0.12,1.5,0.015,100,100,15,1,0.35,0,40],
        
        [15000,3000,75,3,3,8,60,15,4,0.2,1.5,0.02,80,80,10,1,0.2,0,60],
        [12500,2500,70,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0,60],
        [10000,2000,70,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0,60],
        
        //[14000,4500,90,3,3.5,8,65,18,4.5,0.2,2,0.025,100,110,15,1.3,0.3,0,65],
        //[11000,4200,80,2.8,3,7.5,55,15,3.5,0.15,1.8,0.015,105,105,13,1.4,0.28,0,55],
        //[10500,4000,70,2.5,2.5,7,50,12,3,0.12,1.5,0.012,100,100,12,1.2,0.2,0,60],

        [10000,3500,100,3,3,6,35,15,3,0.15,1.5,0.02,110,120,16,1.25,0.3,0,40],
        [11000,3500,100,5,3,12,55,15,4,0.25,2,0.03,110,120,10,2,0.3,0,50],
        
        [11000,3500,100,3,2.75,8,40,15,3,0.25,2,0.025,100,100,"10-15.0",1.5,0.3,0,"20-50"],
        [13000,3500,100,6,3,13,50,20,6,0.3,3,0.035,110,120,"10-15.0",2,0.3,0,"40-55"],
        
        [10000,3500,100,3,3,6,35,15,3,0.15,1.5,0.02,105,90,14,1.25,0.3,0,40],
        [13000,3200,75,5,3.5,12,60,16,5,0.25,2.5,0.035,100,100,10,2,0.35,0,60],
        
        //[10500,3500,110,3.5,3,7,35,15,3.5,0.15,2,0.025,105,130,17,1.3,0.35,0,45],
        //[12000,3600,110,6,4,15,55,16,7,0.3,3,0.3,100,110,14,2,0.35,0,45],
        
        [13000,3000,25,3,2,5,60,15,5,0.2,0.75,0.02,60,60,8,1,0.25,0,60],
        [10000,2500,20,3,2,5,40,12,5,0.05,0.75,0.015,60,70,8,1,0.25,0,60],
        
        [10000,2000,25,5,1,6,30,8,3,0.05,1,0.015,60,100,5,0.5,0.25,0,25],
        [10000,2500,25,5,1,4,30,10,3,0.05,0.5,0.015,60,100,5,0.5,0.25,0,25],
        
        [10000,2000,25,5,1,6,30,8,3,0.05,1,0.02,60,100,5,0.5,0.2,0,25],
        [10000,2000,25,5,1,6,30,8,3,0.05,0.5,0.02,60,100,5,0.5,0.2,0,25],
        
        [10000,3300,25,3.5,2.2,6.6,40,10,4.5,0.1,1,0.023,85,90,15,1.5,0.25,0,30],
        [8000,3300,20,2.5,2.5,5.5,30,8,4,0.75,0.9,0.023,80,90,8,1.2,0.22,0,40],
        
        [12000,3200,80,5,3,10,45,14,5,0.3,2.5,0.03,60,70,8,1,0.2,0,50],
        [12000,3200,80,5,3,10,45,14,5,0.3,2.5,0.03,90,90,10,2,0.3,0,60],
        
        //[11000,3300,70,4,1.5,6,35,12,4,0.3,1.5,0.025,70,100,8,0.8,0.3,0,45],
        //[13000,3500,90,5,3.5,8,45,15,6,0.6,2.5,0.035,80,95,10,1.5,0.4,0,55],
        
        [10000,2500,25,5,2,8,30,10,4,0.1,1,0.02,60,100,5,1,0.3,0,40],
        [17000,4800,75,8.3,5.6,12,66,17,6.8,0.4,3.4,0.047,80,70,8,1,0.5,0,60],
        
        [10000,2500,25,5,2,8,30,10,4,0.1,1,0.02,60,100,5,1,0.3,0,40],
        [10000,3000,75,5,4,10,50,20,6,0.2,2,0.03,60,100,10,1,0.3,0,40],
        
        [10000,2500,25,5,2,8,30,10,4,0.1,1,0.02,60,100,5,1,0.3,0,40],
        [10000,3000,25,5,4,10,50,20,4,0.1,2,0.03,60,100,10,1,0.3,0,40],
        
        [10000,3300,25,3.5,2.2,6.6,40,10,4.5,0.1,1,0.023,85,90,15,1.5,0.25,0,30],
        [12000,4400,75,4,3,12,55,18,5.5,0.3,2.5,0.03,100,100,20,2.5,0.3,0,65],
        
        [12000,3000,40,2,2,8,60,15,3,0.15,1,0.02,80,80,5,1,0.4,0,60],
        [15000,3000,60,5,3,12,60,15,5,0.2,2,0.03,100,100,10,2,0.4,0,60],
        
        //[14000,3000,45,5,3.5,9,55,12,4,0.15,1.5,0.025,85,110,12,1,0.35,0,60],
        //[12000,3500,70,6,4,14,65,20,6,0.25,2.5,0.035,105,90,20,1.8,0.45,0,55]
        
    ]
    
    var broiler_ross: [[Any]] = [
        [12000,5000,80,3.2,3.2,8.6,65,20,4.3,0.22,2.2,0.017,110,120,16,1.25,0.3,0,20],
        [10000,4500,65,3,2.5,6.5,60,18,3.2,0.18,1.9,0.017,110,120,16,1.25,0.3,0,20],
        [9000,4000,55,2.2,2.2,5.4,45,15,2.2,0.15,1.6,0.011,110,120,16,1.25,0.3,0,20]
    ]
    
    var broiler_cobb: [[Any]] = [
        [13000,5000,80,3,3,9,60,15,4,0.15,2,0.02,100,100,15,1,0.35,0,40],
        [10000,5000,50,3,2,8,50,12,3,0.12,2,0.015,100,100,15,1,0.35,0,40],
        [10000,5000,50,3,2,6,50,10,3,0.12,1.5,0.015,100,100,15,1,0.35,0,40]
    ]
    
    var broiler_hubbard: [[Any]] = [
        [15000,3000,75,3,3,8,60,15,4,0.2,1.5,0.02,80,80,10,1,0.2,0,60],
        [12500,2500,70,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0,60],
        [10000,2000,70,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0,60]
    ]
    
    var broiler_other: [[Any]] = [
        [14000,4500,90,3,3.5,8,65,18,4.5,0.2,2,0.025,100,110,15,1.3,0.3,0,65],
        [11000,4200,80,2.8,3,7.5,55,15,3.5,0.15,1.8,0.015,105,105,13,1.4,0.28,0,55],
        [10500,4000,70,2.5,2.5,7,50,12,3,0.12,1.5,0.012,100,100,12,1.2,0.2,0,60]
    ]
    
    var broiler_breeder_ross: [[Any]] = [
        [10000,3500,100,3,3,6,35,15,3,0.15,1.5,0.02,110,120,16,1.25,0.3,0,40],
        [11000,3500,100,5,3,12,55,15,4,0.25,2,0.03,110,120,10,2,0.3,0,50]
    ]
    
    var broiler_breeder_cobb: [[Any]] = [
        [11000,3500,100,3,2.75,8,40,15,3,0.25,2,0.025,100,100,"10-15.0",1.5,0.3,0,"20-50"],
        [13000,3500,100,6,3,13,50,20,6,0.3,3,0.035,110,120,"10-15.0",2,0.3,0,"40-55"]
    ]
    
    var broiler_breeder_hubbard: [[Any]] = [
        [10000,3500,100,3,3,6,35,15,3,0.15,1.5,0.02,105,90,14,1.25,0.3,0,40],
        [13000,3200,75,5,3.5,12,60,16,5,0.25,2.5,0.035,100,100,10,2,0.35,0,60]
    ]
    
    var broiler_breeder_other: [[Any]] = [
        [10500,3500,110,3.5,3,7,35,15,3.5,0.15,2,0.025,105,130,17,1.3,0.35,0,45],
        [12000,3600,110,6,4,15,55,16,7,0.3,3,0.3,100,110,14,2,0.35,0,45]
    ]
    
    var layer_bovan: [[Any]] = [
        [13000,3000,25,3,2,5,60,15,5,0.2,0.75,0.02,60,60,8,1,0.25,0,60],
        [10000,2500,20,3,2,5,40,12,5,0.05,0.75,0.015,60,70,8,1,0.25,0,60]
    ]
    
    var layer_NickChick : [[Any]] = [
        [10000,2000,25,5,1,6,30,8,3,0.05,1,0.015,60,100,5,0.5,0.25,0,25],
        [10000,2500,25,5,1,4,30,10,3,0.05,0.5,0.015,60,100,5,0.5,0.25,0,25]
    ]
    
    var layer_LSL: [[Any]] = [
        [10000,2000,25,5,1,6,30,8,3,0.05,1,0.02,60,100,5,0.5,0.2,0,25],
        [10000,2000,25,5,1,6,30,8,3,0.05,0.5,0.02,60,100,5,0.5,0.2,0,25]
    ]
    
    var layer_hyline: [[Any]] = [
        [10000,3300,25,3.5,2.2,6.6,40,10,4.5,0.1,1,0.023,85,90,15,1.5,0.25,0,30],
        [8000,3300,20,2.5,2.5,5.5,30,8,4,0.75,0.9,0.023,80,90,8,1.2,0.22,0,40]
    ]
    
    var layer_novogen: [[Any]] = [
        [12000,3200,80,5,3,10,45,14,5,0.3,2.5,0.03,60,70,8,1,0.2,0,50],
        [12000,3200,80,5,3,10,45,14,5,0.3,2.5,0.03,90,90,10,2,0.3,0,60]
    ]
    
    var layer_other: [[Any]] = [
        [11000,3300,70,4,1.5,6,35,12,4,0.3,1.5,0.025,70,100,8,0.8,0.3,0,45],
        [13000,3500,90,5,3.5,8,45,15,6,0.6,2.5,0.035,80,95,10,1.5,0.4,0,55]
    ]
    
    var layer_breeder_bovan: [[Any]] = [
        [10000,2500,25,5,2,8,30,10,4,0.1,1,0.02,60,100,5,1,0.3,0,40],
        [17000,4800,75,8.3,5.6,12,66,17,6.8,0.4,3.4,0.047,80,70,8,1,0.5,0,60]
    ]
    
    var layer_breeder_NickChick : [[Any]] = [
        [10000,2500,25,5,2,8,30,10,4,0.1,1,0.02,60,100,5,1,0.3,0,40],
        [10000,3000,75,5,4,10,50,20,6,0.2,2,0.03,60,100,10,1,0.3,0,40]
    ]
    
    var layer_breeder_LSL: [[Any]] = [
        [10000,2500,25,5,2,8,30,10,4,0.1,1,0.02,60,100,5,1,0.3,0,40],
        [10000,3000,25,5,4,10,50,20,4,0.1,2,0.03,60,100,10,1,0.3,0,40]
    ]
    
    var layer_breeder_hyline: [[Any]] = [
        [10000,3300,25,3.5,2.2,6.6,40,10,4.5,0.1,1,0.023,85,90,15,1.5,0.25,0,30],
        [12000,4400,75,4,3,12,55,18,5.5,0.3,2.5,0.03,100,100,20,2.5,0.3,0,65]
    ]
    
    var layer_breeder_novogen: [[Any]] = [
        [12000,3000,40,2,2,8,60,15,3,0.15,1,0.02,80,80,5,1,0.4,0,60],
        [15000,3000,60,5,3,12,60,15,5,0.2,2,0.03,100,100,10,2,0.4,0,60]
    ]
    
    var layer_breeder_other: [[Any]] = [
        [14000,3000,45,5,3.5,9,55,12,4,0.15,1.5,0.025,85,110,12,1,0.35,0,60],
        [12000,3500,70,6,4,14,65,20,6,0.25,2.5,0.035,105,90,20,1.8,0.45,0,55]
    ]
    
    var totalVitAllArrayValues: [[Any]] = [
        [12500,2500,60,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0.5,60],
        [11000,3500,25,3.5,2.5,6.5,40,10,4.5,0.1,1,0.025,85,90,10,1.5,0.25,0,50],
        [11000,3500,100,5,3.5,12,60,15,5,0.3,2,0.035,110,120,12,2,0.3,0,50],
        [12500,2500,60,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0.5,60],
        [11000,3500,25,3.5,2.5,6.5,40,10,4.5,0.1,1,0.025,85,90,10,1.5,0.25,0,50],
        [11000,3500,100,5,3.5,12,60,15,5,0.3,2,0.035,110,120,12,2,0.3,0,50],
    ]
    
    
    // Poultry Variables
    var poultryType : String?
    var poultryStrain : String?
    var poultryPsychlogyState : String?
    var poultryCompanyName : String?
    
    var poultryVitaminA : String?
    var poultryVitaminD3 : String?
    var poultryVitaminE : String?
    var poultryVitaminK : String?
    var poultryVitaminB1 : String?
    var poultryVitaminB2 : String?
    var poultryVitaminB3 : String?
    var poultryVitaminB5 : String?
    var poultryVitaminB6 : String?
    var poultryVitaminB7 : String?
    var poultryVitaminB9 : String?
    var poultryVitaminB12 : String?
    var poultryZInc : String?
    var poultryManganese : String?
    var poultryCopper : String?
    var poultryIodine : String?
    var poultrySelenium : String?
    var poultryCobalt : String?
    var poultryIron : String?
    
    // Ruminants Variables
    
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
    var finalProductList: [DatabaseModel] = []
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
    
    // DEB and DCAB Values
    var deb: String?
    var dcab: String?
    
    var dmiFromDatabase: String?
    var dosageFromDatabase: String?
    
    // Water Values 1
    var waterPVal1 : String?
    var waterCaVal1 : String?
    var waterMgVal1 : String?
    var waterKVal1 : String?
    var waterNaVal1 : String?
    var waterClVal1 : String?
    var waterSVal1 : String?
    
    
    var waterArrayFinal = [Double]()
    var OriginalwaterArrayFinal = [String]()
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
    
    var pMacroText1: String?
    var caMacroText1: String?
    var mgMacroText1: String?
    var kMacroText1: String?
    var naMacroText1: String?
    var clMacroText1: String?
    var sMacroText1: String?
    var coMicroText1: String?
    var iMicroText1: String?
    var mnMicroText1: String?
    var mnOrganicMicroText1: String?
    var cuMicroText1: String?
    var cuOrganicMicroText1: String?
    
    
    
    var seMicroText1: String?
    var seOrganicMicroText1: String?
    var znMicroText1: String?
    var znOrganicMicroText1: String?
    var aiuVitamin1: String?
    var diuVitamin1: String?
    var eiuVitamin1: String?
    var niacinVitamin1: String?
    var biotinVitamin1: String?
    
    
    var primexArrayFinal = [Double]()
    var OriginalprimexArrayFinal = [String]()
    
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
        valueAfterDryMatter.removeAll()
        for i in 0..<finalDropdownfloatValue.count {
            var value = Double(finalDropdownfloatValue[i])! * Double(finalProductList[i].DryMatter)!
            value = value / 100.0
            valueAfterDryMatter.append(value)
        }
        calculateRationDataParameters()
    }
    func calculateRationDataParameters() {
        rationArrayFinal.removeAll()
        rationCa = 0
        rationCaAbs = 0
        rationP = 0
        rationPAbs = 0
        rationMg = 0
        rationMgAbs = 0
        rationK = 0
        rationS = 0
        rationNa = 0
        rationCl = 0
        rationFe = 0
        rationZn = 0
        rationCu = 0
        rationMn = 0
        rationSe = 0
        rationCo = 0
        rationI = 0
        rationVitaminA = 0
        rationVitaminD3 = 0
        rationVitaminE = 0
        rationNiacin = 0
        rationBiotin = 0
        for i in 0..<finalDropdownfloatValue.count {
            let pVal = Double(finalProductList[i].P) ?? 0
            rationP = rationP + (valueAfterDryMatter[i] * pVal)
            let caVal = Double(finalProductList[i].Ca) ?? 0
            rationCa = rationCa + (valueAfterDryMatter[i] * caVal)
            let mgVal = Double(finalProductList[i].Mg) ?? 0
            rationMg = rationMg + (valueAfterDryMatter[i] * mgVal)
            let kVal = Double(finalProductList[i].K) ?? 0
            rationK = rationK + (valueAfterDryMatter[i] * kVal)
            let SVal = Double(finalProductList[i].S) ?? 0
            rationS = rationS + (valueAfterDryMatter[i] * SVal)
            let NaVal = Double(finalProductList[i].Na) ?? 0
            rationNa = rationNa + (valueAfterDryMatter[i] * NaVal)
            let ClVal = Double(finalProductList[i].Cl) ?? 0
            rationCl = rationCl + (valueAfterDryMatter[i] * ClVal)
            let FeVal = Double(finalProductList[i].Fe) ?? 0
            rationFe = rationFe + (valueAfterDryMatter[i] * FeVal)
            let ZnVal = Double(finalProductList[i].Zn) ?? 0
            rationZn = rationZn + (valueAfterDryMatter[i] * ZnVal)
            let CuVal = Double(finalProductList[i].Cu) ?? 0
            rationCu = rationCu + (valueAfterDryMatter[i] * CuVal)
            let mnVal = Double(finalProductList[i].Mn) ?? 0
            rationMn = rationMn + (valueAfterDryMatter[i] * mnVal)
            let seVal = Double(finalProductList[i].Se) ?? 0
            rationSe = rationSe + (valueAfterDryMatter[i] * seVal)
            let coVal = Double(finalProductList[i].Co) ?? 0
            rationCo = rationCo + (valueAfterDryMatter[i] * coVal)
            let iVal = Double(finalProductList[i].I) ?? 0
            rationI = rationI + (valueAfterDryMatter[i] * iVal)
            let VitaminA = Double(finalProductList[i].VitaminA) ?? 0
            rationVitaminA = rationVitaminA + (valueAfterDryMatter[i] * VitaminA)
            let VitaminE = Double(finalProductList[i].VitaminE) ?? 0
            rationVitaminE = rationVitaminE + (valueAfterDryMatter[i] * VitaminE)
            let VitaminD3 = Double(finalProductList[i].VitaminD3) ?? 0
            rationVitaminD3 = rationVitaminD3 + (valueAfterDryMatter[i] * VitaminD3)
            let Niacin = Double(finalProductList[i].Niacin) ?? 0
            rationNiacin = rationNiacin + (valueAfterDryMatter[i] * Niacin)
            let Biotin = Double(finalProductList[i].Biotin) ?? 0
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
    
    func appendOriginalPremixValues () {
        OriginalprimexArrayFinal.removeAll()
        OriginalprimexArrayFinal.append(pMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(caMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(mgMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(kMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(naMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(clMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(sMacroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(iMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(coMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(cuMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(cuOrganicMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(mnMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(mnOrganicMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(seMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(seOrganicMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(znMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(znOrganicMicroText1 ?? "0.0")
        OriginalprimexArrayFinal.append(aiuVitamin1 ?? "0.0")
        OriginalprimexArrayFinal.append(diuVitamin1 ?? "0.0")
        OriginalprimexArrayFinal.append(eiuVitamin1 ?? "0.0")
        OriginalprimexArrayFinal.append(niacinVitamin1 ?? "0.0")
        OriginalprimexArrayFinal.append(biotinVitamin1 ?? "0.0")
    }
    
    func waterCalculations () {
        // Water Values
        waterPVal1 = String(waterPVal)
        waterCaVal1 = String(waterCaVal)
        waterMgVal1 = String(waterMgVal)
        waterKVal1 = String(waterKVal)
        waterNaVal1 = String(waterNaVal)
        waterClVal1 = String(waterClVal)
        waterSVal1 = String(waterSVal)
        OriginalwaterArrayFinal.removeAll()
        OriginalwaterArrayFinal.append(waterCaVal1 ?? "0.0")
        OriginalwaterArrayFinal.append(waterPVal1 ?? "0.0")
        OriginalwaterArrayFinal.append(waterMgVal1 ?? "0.0")
        OriginalwaterArrayFinal.append(waterNaVal1 ?? "0.0")
        OriginalwaterArrayFinal.append(waterClVal1 ?? "0.0")
        OriginalwaterArrayFinal.append(waterSVal1 ?? "0.0")
        OriginalwaterArrayFinal.append(waterKVal1 ?? "0.0")
        
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
        for _ in 0...10 {
            waterArrayFinal.append(0)
        }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
            
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
        if(self.anionic == false) {
            final = DMI * 10
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
            // Gain
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
        if(anionic == false) {
            final = DMI * 3
        } else {
            final = final * 1.1
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
            // Gain
            let currentweight = self.currentBodyWeight
            let mycurrentweight = Double(currentweight!) ?? 0
            // Gain
            let bwt = self.targetBodyWeight
            let bwt1 = Double(bwt!) ?? 0
            let dc = self.achieveTargetWeight
            let dc1 = Double(dc!) ?? 0
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
            var g : Double = 0
            if(dc1 == 0) {
                g = (bwt1 - mycurrentweight) / 1
            } else {
                g = (bwt1 - mycurrentweight) / dc1
            }
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
        if(self.anionic == true) {
            final = DMI * 3
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
        print("Final Array \(final)")
        if(self.anionic == true) {
            final = DMI * 3.5
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
        final = final * 1.2
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
        final = final * 1.1
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
        final = final * 1.1
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
        if(self.anionic == true) {
            final = 7
        } else if (metaBolic == true) {
            final = final * 1.4
        } else {
            final = final * 1.3
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
        final = final * 1.5
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
        final = final * 1.2
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
        if(heatStress == true || anionic == true || metaBolic == true) {
            final = 1000
        } else {
            final = final * 1.2
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
        print("Final Array \(final)")
        if(heatStress == true || anionic == true) {
            final = final * 1.5
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
        if(self.physiologicalState == "Lactating") {
            final = 20
        }
        self.reqArrayFinal.append(final)
    }
    
}
