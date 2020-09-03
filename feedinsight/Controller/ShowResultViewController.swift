//
//  ShowResultViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 03/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ShowResultViewController: UIViewController {
    var labelsMatrixView   : NALLabelsMatrixView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelsMatrixView = NALLabelsMatrixView(frame: CGRect.init(x: 10, y: 60, width: self.view.frame.size.width - 20, height: 200), columns: [60, (Int(self.view.frame.size.width - 80) / 2) , (Int(self.view.frame.size.width - 80) / 2)])
        self.view.addSubview(self.labelsMatrixView)
        labelsMatrixView.addRecord(record: ["No", "Title", "Value"])
        labelsMatrixView.addRecord(record: ["1", "Item1", "Value1"])
        labelsMatrixView.addRecord(record: ["2", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["3", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["4", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["5", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["6", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["7", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["8", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["9", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["10", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["11", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["12", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["13", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["14", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["15", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["16", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["17", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["18", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["1", "Item1", "Value1"])
        labelsMatrixView.addRecord(record: ["2", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["3", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["4", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["5", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["6", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["7", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["8", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["9", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["10", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["11", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["12", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["13", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["14", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["15", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["16", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["17", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["18", "Item2", "Value2"])
    }
}
