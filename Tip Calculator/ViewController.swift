//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Dominic Pham on 8/12/18.
//  Copyright © 2018 Dominic Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "timeOpened") != nil) {
            let timeOpened = defaults.object(forKey:"timeOpened") as! Date
            let interval = Date().timeIntervalSince(timeOpened)
            
            if (interval < 600 && defaults.double(forKey: "billAmount") != 0) {
                let billAmount = defaults.double(forKey: "billAmount")
                billField.text = "\(billAmount)"
                loadInitialValues()
            } else {
                defaults.set(0, forKey: "billAmount")
            }
        }

        defaults.set(NSDate.init(), forKey: "timeOpened")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        loadInitialValues()
    }
    
    func loadInitialValues() {
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = Int(defaults.integer(forKey: "defaultTipPercentage"))
        calculateTip("")
    }

    @IBAction func onTap(_ sender: Any) {
        // Dismisses keyboard
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
            
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "billAmount")
    }
    @IBAction func clearButton(_ sender: Any) {
        billField.text = ""
        calculateTip("")
    }
}

