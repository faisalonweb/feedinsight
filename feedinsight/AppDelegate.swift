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
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    
    var activeController: UIViewController!
    
    var navigationController: UINavigationController!
    
    //    let mainVC = HomeViewController()
    //    let searchVC = AnimalSelectionViewController()
    //    let profileVC = ProfileLoadViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
//        Auth.auth().addStateDidChangeListener { (_, user) in
//            print("auth state did change \(String(describing: user))")
//            switch user {
//            case nil:
//                guard self.activeController! is HomeViewController else { return }
//                let publicController = sb.instantiateViewController(withIdentifier: "SignInID") as! SigninFscreenViewController
//                self.navigationController.setViewControllers([publicController], animated: false)
//                self.navigationController.popToViewController(publicController, animated: true)
//                self.activeController = publicController
//            default:
//                /// secret view should be shown
//                guard self.activeController! is SigninFscreenViewController else { return }
//                let secretViewController = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                self.navigationController.setViewControllers([secretViewController], animated: false)
//                self.navigationController.popToViewController(secretViewController, animated: true)
//                self.activeController = secretViewController
//            }
//
//        }
        let publicController = sb.instantiateViewController(withIdentifier: "SignInID") as! SigninFscreenViewController
        let secretController = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.activeController = publicController
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.activeController = secretController
                self.navigationController = UINavigationController.init(rootViewController: self.activeController)
                self.window?.rootViewController = self.navigationController
                self.window?.makeKeyAndVisible()
            
            } else {
                self.activeController = publicController
                self.navigationController = UINavigationController.init(rootViewController: self.activeController)
                self.window?.rootViewController = self.navigationController
                self.window?.makeKeyAndVisible()
            }
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

