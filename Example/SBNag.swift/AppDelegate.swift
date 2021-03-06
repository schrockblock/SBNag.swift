//
//  AppDelegate.swift
//  SBNag.swift
//
//  Created by Elliot on 03/07/2017.
//  Copyright (c) 2017 Elliot. All rights reserved.
//

import UIKit
import SBNag_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nag = SBNagService()
        nag.opensOffset = 0
        nag.daysBetweenNags = 0
        nag.opensBetweenNags = 1
        nag.delayInSeconds = 5
        
        let rateNagtion = SBNagtion()
        rateNagtion.defaultsKey = "rate"
        rateNagtion.title = "Sorry to interrupt..."
        rateNagtion.message = "...but would you mind rating this app?"
        rateNagtion.noText = "Nope, I'll never rate this app"
        rateNagtion.yesAction = { () in
            UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/us/app/subway-map-nyc/id1025535484?ls=1&mt=8")!)
        }
        
        nag.nagtions.append(rateNagtion)
        nag.startCountDown()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

