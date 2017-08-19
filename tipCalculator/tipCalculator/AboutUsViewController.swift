//
//  AboutUsViewController.swift
//  TippyMcTipTip
//
//  Created by Haley_Chen on 8/19/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet var aboutUsScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(aboutUsScrollView)

        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        aboutUsScrollView.contentSize = CGSize(width: 375, height: 850)
    }

}
