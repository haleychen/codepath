//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Haley_Chen on 8/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSUserDefaults.standard
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipSelection = defaults.doubleForKey("defaultTipSelection")
        defaultTipControl.selectedSegmentIndex = [0.15, 0.18, 0.25].indexOf(defaultTipSelection)!
    }

    @IBAction func defaultTipDidChange(sender: UISegmentedControl) {
        let defaults = NSUserDefaults.standardUserDefaults() // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        let tipOptions = [0.15, 0.18, 0.25]

        let defaultTipSelection = tipOptions[defaultTipControl.selectedSegmentIndex]
        defaults.setDouble(defaultTipSelection, forKey: "defaultTipSelection")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
