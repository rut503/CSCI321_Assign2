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
    
    // declaring object for amountFieldDelegate class
    let delegate = amountFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        amountTextField.delegate = delegate
    }
    
    /**
    * Closes the keyboard when user touches on other parts of the screen
    * and also converts the amountTextField to floating point and checks if the field is valid or not using
    *  amoutFieldDelegate class
    */
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
    
    /**
    Displays alert in the app with a custome message and a close button to close alert.
     
     - Parameter message: The custom alert message.
    */
    func alert ( message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

