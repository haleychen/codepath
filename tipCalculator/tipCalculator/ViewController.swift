//
//  ViewController.swift
//  tipCalculator
//
//  Created by Haley_Chen on 8/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipSelection: Double = 15.0
//    var localeIdentifier: String = "es_CL"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipSelection = defaults.doubleForKey("defaultTipSelection")
        tipControl.selectedSegmentIndex = [0.15, 0.18, 0.25].indexOf(defaultTipSelection)!
        tipSelection = defaultTipSelection
        _calculateTip()
        
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0, animations: {
            let MONEY_COLOR = UIColor(red:0.52, green:0.73, blue:0.40, alpha:1.0)
            self.divider.backgroundColor = MONEY_COLOR
        })
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        _calculateTip()
    }
    
    func _calculateTip() {
        let tipPercentages = [0.15, 0.18, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex] ?? tipSelection)
        let total = bill + tip
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle

        // Need to debug why locale identifier string isn't displaying the value correctly
        var localeIdentifier = NSUserDefaults.standardUserDefaults().objectForKey("localeIdentifier")
        if (localeIdentifier == nil) {
            localeIdentifier = "es_CL"
        }

        numberFormatter.locale = NSLocale.currentLocale() // NSLocale(localeIdentifier: localeIdentifierAsString as! String)

        tipLabel.text = numberFormatter.stringFromNumber(tip)
        totalLabel.text = numberFormatter.stringFromNumber(total)
    }
}

