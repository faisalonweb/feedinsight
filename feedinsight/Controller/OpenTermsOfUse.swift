//
//  EditProfileVCViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 08/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import WebKit

class OpenTermsOfUse: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Terms of Use"
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.view.backgroundColor = UIColor.white
        let btnMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "BackArrowImage"), style: .plain, target: self, action: #selector(btnMenuAction))
        self.navigationItem.leftBarButtonItem = btnMenu
        if let pdf = Bundle.main.url(forResource: "terms", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webView.load(req as URLRequest)
        }
    }
    @objc func btnMenuAction() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    

}
