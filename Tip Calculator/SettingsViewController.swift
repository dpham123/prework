//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Dominic Pham on 8/13/18.
//  Copyright © 2018 Dominic Pham. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialValues()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInitialValues() {
        let defaults = UserDefaults.standard
        defaultTipControl.selectedSegmentIndex = Int(defaults.integer(forKey: "defaultTipPercentage"))
    }
    
    @IBAction func updateValue(_ sender: Any) {
        
        // Loads UserDefaults
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipPercentage")
        
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
