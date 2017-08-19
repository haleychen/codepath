//
//  ViewController.swift
//  tipCalculator
//
//  Created by Haley_Chen on 8/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipSelection: Double = 15.0

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
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

