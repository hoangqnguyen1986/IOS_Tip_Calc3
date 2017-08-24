//
//  SettingTableViewController.swift
//  tipCalc3
//
//  Created by Joey on 8/13/17.
//  Copyright © 2017 Joey Nguyen. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupStepper: UIStepper!
    @IBOutlet weak var tipDefaultSegment: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //default configuration for stepper
        groupStepper.wraps = true
        groupStepper.autorepeat = true
        groupStepper.minimumValue = 1
        groupStepper.maximumValue = 100
        
        //if there is value saved in default, set stepper to that value
        if let s = UserDefaults.standard.value(forKey: "Group_Size") as? Int
        {
            groupStepper.value = Double(s)
            groupUpdate(groupStepper)
        }
        
        if let t = UserDefaults.standard.value(forKey: "tips") as? Int
        {
            tipDefaultSegment.selectedSegmentIndex = t
        }
    }
    

    @IBAction func groupUpdate(_ sender: UIStepper)
    {
        //get value from sender
        let size = Int(sender.value)
        
        //set user default value with value from sender
        UserDefaults.standard.set(size, forKey: "Group_Size")
        
        //display group label with value from sender
        groupLabel.text = String(size)
  
    }

    @IBAction func tipDefaultUpdate(_ sender: UISegmentedControl)
    {
        //print(tipDefaultSegment.selectedSegmentIndex)
        let tIndex = tipDefaultSegment.selectedSegmentIndex
        UserDefaults.standard.set(tIndex, forKey: "tips")
    }
    
}
