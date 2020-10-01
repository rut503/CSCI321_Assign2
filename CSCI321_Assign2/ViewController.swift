//
//  ViewController.swift
//  CSCI321_Assign2
//
//  Created by Rutvik Patel (Z1865128).
//  Created by Aviraj Parmar (Z1861160).
//
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
        didSet{ // updating view if the value of billAmount changes
            updateView()
        }
    }
    
    var tipPercent: Int = 20 {
        didSet{ // updating view if the value of tipPercent changes
            updateView()
        }
    }
    
    var tipAmount: Double = 0.0 {
        didSet{ // updating view if the value of tipAmount changes
            updateView()
        }
    }
    
    var partySize: Int = 1 {
        didSet{ // updating view if the value of partySize changes
            updateView()
        }
    }
    
    var billAmountPerPerson: Double = 0.0 {
        didSet{ // updating view if the value of billAmountPerPerson changes
            updateView()
        }
    }
    
    // declaring object for amountFieldDelegate class
    let delegate = amountFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assigning delegate to amount text field
        amountTextField.delegate = delegate
    }
    
    /**
     Validates user bill amount input and calls function to calculate tip amount and bill amount per person.
     */
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
    
    /**
     Calculates and sets the proper variables to the amount of tip and bill amount per person according to user input.
     */
    func calculateTipsAndBillAmout(){
        tipAmount = billAmount + (billAmount * Double(tipPercent) / 100.0)
        billAmountPerPerson = tipAmount / Double(partySize)
    }
    
    /**
     Sets the value of the tip percentage variable according to the stepper and calls function to calculate tip amount
     and bill amount per person.
     */
    @IBAction func tipPercentageStepper(_ sender: UIStepper) {
        tipPercent = Int(sender.value)
        calculateTipsAndBillAmout()
    }
    
    /**
     Sets the value of the party size variable according to the slider and calls function to calculate tip amount
     and bill amount per person.
     */
    @IBAction func partySizeSlidder(_ sender: UISlider) {
        partySize = Int(sender.value)
        calculateTipsAndBillAmout()
    }
    
    /**
     Updates view by updating all the amount labels on the screen according to the user input.
     */
    func updateView(){
        tipPercentLabel.text = String(tipPercent) + "%"
        partySizeLabel.text = String(partySize)
        
        tipAmountLabel.text = convertDoubleToCurrency(num: tipAmount)
        billAmountPerPersonLabel.text = convertDoubleToCurrency(num: billAmountPerPerson)
    }
    
    /**
     Converts a number of type double to a type string and formats it to look like a currency.
     
     - Parameter num: Number being converted and formatted
     
     - Returns: A string of currency amount
     */
    func convertDoubleToCurrency(num: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        return numberFormatter.string(from: NSNumber(value: num))!
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

