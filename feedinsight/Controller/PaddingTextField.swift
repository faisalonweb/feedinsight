//
//  PaddingTextField.swift
//  FeedInsight
//
//  Created by Mac 2014 on 09/05/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class PaddingTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
      }
      
      override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
      }
      
      override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
      }
}
