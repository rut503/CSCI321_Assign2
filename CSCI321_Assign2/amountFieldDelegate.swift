//
//  amountFieldDelegate.swift
//  CSCI321_Assign2
//
//  Created by Aviraj Parmar on 9/29/20.
//  Copyright © 2020 Rut Codes. All rights reserved.
//

import Foundation
import UIKit

class amountFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textAfterUpdate = textField.text! as NSString
        let newString = textAfterUpdate.replacingCharacters(in: range, with: string)
        
        if newString.isEmpty {
            return true
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if let _ = numberFormatter.number(from: newString) {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
