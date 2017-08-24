//
//  ViewController.swift
//  tipCalc3
//
//  Created by Joey on 8/13/17.
//  Copyright © 2017 Joey Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var billTotal: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var eachPayLabel: UILabel!
    var groupSize:Int = 1
    var decimalCount:Int = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
          
        //set default dollar amount for label
        billLabel.text = formatCurrency(value: 0.00)
        tipAmount.text = formatCurrency(value: 0.00)
        billTotal.text = formatCurrency(value: 0.00)
        eachPayLabel.text = formatCurrency(value: 0.00)
        
        //set group size using user default
        if let s = UserDefaults.standard.value(forKey: "Group_Size") as? Int
        {
            groupSize = s
        }
        
        //set tip selected using default
        if let t = UserDefaults.standard.value(forKey: "tips") as? Int
        {
            tipControl.selectedSegmentIndex = t
        }
        
        //trigger refresh
        tipCalc(billField)
    }
    

    //@IBAction func onTap(_ sender: AnyObject) {
        //view.endEditing(true)
    //}

  
 
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if billField.text == "0" && sender.tag != 10    //number is 0 and decimal button is not pressed
        {
            billField.text = "" + String(sender.tag)    //clear 0 and append number
        }
        else if sender.tag != 10    //decimal button is not pressed, continue appending number
        {
            billField.text = billField.text! + String(sender.tag)
        }

        tipCalc(billField)
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if sender.tag == 11 //clear button is pressed
        {
            billField.text = "0"
            decimalCount = 0    //reset decimal count
        }
        else if (sender.tag == 10 && decimalCount == 0 ) //decimal button is pressed and no decimal value prior
        {
            billField.text = billField.text! + "."
            decimalCount += 1   //keep count of decimal
            //print(decimalCount)
        }
        
        tipCalc(billField)
    }
    
    
    func formatCurrency(value: Double) -> String
    {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")  //US currency
        formatter.numberStyle = .currency
        let result = formatter.string(from: value as NSNumber)
        return result!
    }


    @IBAction func tipCalc(_ sender: AnyObject)
    {
        let tipPercentages = [0.18, 0.20, 0.25]
        let tIndex = tipControl.selectedSegmentIndex
        UserDefaults.standard.set(tIndex, forKey: "tips")

        
        //if valid number then use it else return 0
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tIndex]
        let total = bill + tip
        let eachPay = total / Double(groupSize)
        
        
        tipLabel.text = String(format:"(%.2f)", tipPercentages[tipControl.selectedSegmentIndex])
        
        groupLabel.text = String(groupSize)
        
        billLabel.text = formatCurrency(value: bill)

        tipAmount.text = formatCurrency(value: tip)
        
        billTotal.text = formatCurrency(value: total)
        
        eachPayLabel.text = formatCurrency(value: eachPay)
    }
}

