//
//  ReportViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 23/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension ReportViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PDFTableViewCell
        
        cell.titleLabel?.text = "Pdf Report 2.0"
        cell.dateLabel?.text = "20/20/20"
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcone = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController;
        vcone?.stateStatus = true
//        vcone?.nameanimal = animalList[indexPath.section]
//        vcone?.ReportName = reportNameList[indexPath.section]
//        vcone?.documentId = docIdList[indexPath.section]
//        vcone?.groupcompany =  companynameList[indexPath.section]
//        vcone?.statepsychlogical =  psystateList[indexPath.section]
//        vcone?.bodycurrentweigth =  currentweightList[indexPath.section]
//        vcone?.bodytargetweight =  targetweightList[indexPath.section]
//        vcone?.achievedays =  daysachieveList[indexPath.section]
//        vcone?.milkindays =  daysmilkList[indexPath.section]
//        vcone?.pregnantdays =  dayspregnantList[indexPath.section]
//        vcone?.productionmilk =  milkproductionList[indexPath.section]
//        vcone?.dietbole =  dietstate[indexPath.section]
//        vcone?.disorderbole =  disorderstate[indexPath.section]
//        vcone?.heatbole =  heatstate[indexPath.section]
//        vcone?.productionbole =  productionstate[indexPath.section]
//        vcone?.hdLabel = categoryList[indexPath.section]
        self.navigationController?.pushViewController(vcone!, animated: true)
    }
}
