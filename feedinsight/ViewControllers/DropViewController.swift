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
    // @IBOutlet weak var dropDown : DropDown!

    // The list of array to display. Can be changed dynamically
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
       // DropField.optionArray = ["Option 1", "Option 2", "Option 3"]
          //Its Id Values and its optional
       //   DropField.optionIds = [1,23,54,22]
        

          // Image Array its optional
          //DropField.ImageArray = [🙊,🥞]
          // The the Closure returns Selected Index and String
        //  DropField.didSelect{(selectedText , index ,id) in
        //  self.Ectralabel.text = "Selected String: \(selectedText) \n index: \(index)"
          
        //}
        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
