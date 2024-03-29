//
//  ViewController.swift
//  CSCI321_Assign2
//
//  Created by Rutvik Patel (Z1865128).
//  Created by Aviraj Parmar (Z1861160).
//  Copyright © 2020 Rut Codes. All rights reserved.
//

import Foundation
import UIKit

/**
 class amountFieldDelegate
 this class is to check weather the field enter with decimal point is valid or not it also wont let you enter an invalid decimal point.
 
 - Citation: Taken from Professor's Lecture.
 
 - Returns: true if the field is valid and let you continue or false if the field is invalid and does not let you continue
 
 */
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
