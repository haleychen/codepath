//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Haley_Chen on 8/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var currencySelector: UIPickerView!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    var localeDisplayNames = NSMutableArray()
    var localeDisplayNameToIdentifier = NSMutableDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let locale = NSLocale(localeIdentifier: "en_US")
        for identifier in NSLocale.availableLocaleIdentifiers() {
            let displayName = locale.displayNameForKey(NSLocaleIdentifier, value: identifier)!
            self.localeDisplayNames.addObject(displayName)
            self.localeDisplayNameToIdentifier[displayName] = identifier
        }
        currencySelector.delegate = self
        currencySelector.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.localeDisplayNames.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedDisplayName = (self.localeDisplayNames[row] as! String)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self.localeDisplayNameToIdentifier[selectedDisplayName], forKey: "localeIdentifier")
        return selectedDisplayName
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
