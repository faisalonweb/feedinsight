//
//  waterrationViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 17/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class waterrationViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
  

    @IBOutlet weak var tblView: UITableView!
    var arr =  ["one","two","three","three","three","three", "three"]
    @IBOutlet weak var profileimage: UIImageView!
    
    
    override func viewDidLoad() {
        tblView.isHidden = true
        super.viewDidLoad()
      profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
       
    }
    

    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
                  navController.popViewController(animated: true)
              }
    }
    
    @IBAction func tableviewClick(_ sender: Any) {
        if tblView.isHidden {
                   animate(toggle: true)
               } else {
                   animate(toggle: false)
               }
        
    }
    func animate (toggle: Bool) {
           if toggle {
               UIView.animate(withDuration: 0.3) {
                   self.tblView.isHidden = false
               }
           } else {
               UIView.animate(withDuration: 0.3) {
                   self.tblView.isHidden = true
               }
           }
       }
        func numberOfSections(in tableView: UITableView) -> Int {
            return arr.count
     }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 10
     }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let headerView = UIView()
         headerView.backgroundColor = UIColor.clear
         return headerView
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! waterrationTableViewCell

        cell.label?.text = arr[indexPath.section]
        cell.date?.text = arr[indexPath.section]
         cell.layer.cornerRadius = 10
         return cell
     }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 58
     }
//     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//         let vcone = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController;
//         vcone?.nameanimal = animalList[indexPath.section]
//
//
//         self.navigationController?.pushViewController(vcone!, animated: true)
//     }
    

}
