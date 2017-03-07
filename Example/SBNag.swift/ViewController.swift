//
//  ViewController.swift
//  SBNag.swift
//
//  Created by Elliot on 03/07/2017.
//  Copyright (c) 2017 Elliot. All rights reserved.
//

import UIKit
import SBNag_swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nag = SBNagService()
        
        let rateNagtion = SBNagtion()
        rateNagtion.defaultsKey = "rate"
        rateNagtion.title = "Sorry to interrupt..."
        rateNagtion.message = "...but would you mind rating this app?"
        rateNagtion.noText = "Nope, I'll never rate this app"
        rateNagtion.yesAction = { () in
            UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/us/app/metro-paris-plan-du-metro/id1132267822?ls=1&mt=8")!)
        }
        
        nag.nagtions.append(rateNagtion)
        nag.startCountDown()
    }

}

