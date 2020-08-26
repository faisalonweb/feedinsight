//
//  DropViewController.swift
//  FeedInsight
//
//  Created by Mac on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown

class DropViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayColor.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! dropdownTableViewCell
        cell.textLabel?.text = arrayColor[indexPath.row] as? String
        return cell
    }
    @IBOutlet weak var BtnOutlet: UIButton!
    @IBOutlet weak var tableOutlet: UITableView!
    let arrayColor : NSMutableArray = ["red color", "red color", "red color", "red color", "red color", "red color" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnOutlet.backgroundColor = UIColor.white
        BtnOutlet.layer.cornerRadius = 5
        BtnOutlet.layer.borderWidth = 1
        BtnOutlet.layer.borderColor = UIColor.black.cgColor
        
        // tableOutlet
        tableOutlet.backgroundColor = UIColor.white
        tableOutlet.layer.cornerRadius = 5
        tableOutlet.layer.borderWidth = 1
        tableOutlet.layer.borderColor = UIColor.black.cgColor
        tableOutlet.isHidden = true
    }
    @IBAction func btnTapped(_ sender: UIButton) {
        if tableOutlet.isHidden == true {
            tableOutlet.isHidden = false
        }
        else
        {
            tableOutlet.isHidden = true
        }
    }
}
