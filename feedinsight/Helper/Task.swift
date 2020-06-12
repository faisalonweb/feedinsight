//
//  Task.swift
//  FeedInsight
//
//  Created by Mac on 08/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import Foundation


struct Task{
    var name:String
    var categorySelected: String
    var id: String
     
    var dictionary: [String: Any] {
        return [
            "name": name,
            "categorySelected": categorySelected
        ]
    }
}

extension Task{
    init?(dictionary: [String : Any], id: String) {
        guard   let name = dictionary["name"] as? String,
            let categorySelected = dictionary["categorySelected"] as? String
            else { return nil }
         
        self.init(name: name, categorySelected: categorySelected, id: id)
    }
}
