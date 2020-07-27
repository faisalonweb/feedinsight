//
//  reportViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 15/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class reportViewController: UIViewController {
    
    var names = ["Report Cow","Report Fish","Report Camel","Report Buffalo","Report Ruminants","Report Animal"]
   
    let imageArr: [UIImage] = [
             UIImage(named: "ruminants")!,
             UIImage(named: "aqua")!,
             UIImage(named: "equines")!,
             UIImage(named: "chicken")!,
             UIImage(named: "equines")!,
             UIImage(named: "ruminants")!,
         ]
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = self.tableView.indexPathForSelectedRow{ self.tableView.deselectRow(at: indexPath, animated: animated)} 
    }
    

   
}

extension reportViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func numberOfSections(in tableView: UITableView) -> Int {
         return names.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabviewcell", for: indexPath) as! cellrTableViewCell
        
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
        cell.label.text = names[indexPath.section]
        cell.img.image = imageArr[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcone = storyboard?.instantiateViewController(withIdentifier: "reportpreviewViewController") as? reportpreviewViewController;
        vcone?.previmage = imageArr[indexPath.section]
        vcone?.prevlabel =  names[indexPath.section]
        self.navigationController?.pushViewController(vcone!, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 20
       }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView = UIView()
       headerView.backgroundColor = UIColor.clear
       return headerView
    }
    
    
}
