//
//  ViewController.swift
//  CSCI321_Assign2
//
//  Created by Rutvik Patel on 9/28/20.
//  Copyright © 2020 Rut Codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountTextField: UITextField!
    
    let delegate = amountFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        amountTextField.delegate = delegate
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        guard let amount = amountTextField.text, !amount.isEmpty else {
            alert( message: "Please enter a valid amount")
            return
        }
        
        guard let billAmount = Float(amount) else {
            alert(message: "Please enter proper age.")
            return
        }
        
        
    }
    
    func alert ( message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

