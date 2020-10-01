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
    
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var billAmountPerPersonLabel: UILabel!
    
    var billAmount: Double = 0.0 {
        didSet{
            updateView()
        }
    }
    
    var tipPercent: Int = 20 {
        didSet{
            updateView()
        }
    }
    
    var tipAmount: Double = 0.0 {
        didSet{
            updateView()
        }
    }
    
    var partySize: Int = 1 {
        didSet{
            updateView()
        }
    }
    
    var billAmountPerPerson: Double = 0.0 {
        didSet{
            updateView()
        }
    }
    
    // declaring object for amountFieldDelegate class
    let delegate = amountFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        amountTextField.delegate = delegate
    }
    
    @IBAction func enterBillAmountButtonPress(_ sender: UIButton) {
        
        // hide the keyboard
        self.view.endEditing(true)
        
        // get the input as string from the text field
        guard let amount = amountTextField.text, !amount.isEmpty else {
            alert(message: "Please enter your bill amount")
            return
        }
        
        // convert the bill amount into double
        billAmount = Double(amount)!
        
        calculateTipsAndBillAmout()
        
    }
    
    func calculateTipsAndBillAmout(){
        tipAmount = billAmount + (billAmount * Double(tipPercent) / 100.0)
        billAmountPerPerson = tipAmount / Double(partySize)
    }
    
    @IBAction func tipPercentageStepper(_ sender: UIStepper) {
        tipPercent = Int(sender.value)
        calculateTipsAndBillAmout()
    }
    
    @IBAction func partySizeSlidder(_ sender: UISlider) {
        partySize = Int(sender.value)
        calculateTipsAndBillAmout()
    }
    
    func updateView(){
        tipPercentLabel.text = String(tipPercent) + "%"
        partySizeLabel.text = String(partySize)
        
        tipAmountLabel.text = "$" + String(tipAmount)
        billAmountPerPersonLabel.text = "$" + String(billAmountPerPerson)
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
    
    /**
    * Closes the keyboard when user touches on other parts of the screen
    * and also converts the amountTextField to floating point and checks if the field is valid or not using
    *  amoutFieldDelegate class
    */
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
}

