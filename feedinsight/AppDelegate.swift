//
//  AppDelegate.swift
//  stack
//
//  Created by Mac 2014 on 07/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
import FirebaseAuth
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    let currencyCode = "Pkr"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    class func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func getStringValueFormattedAsCurrency(value: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        numberFormatter.currencyCode = currencyCode
        numberFormatter.maximumFractionDigits = 2
        let formattedValue = numberFormatter.string(from: NumberFormatter().number(from: value)!)
        return formattedValue!
    }
    
    func getDocDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
}

