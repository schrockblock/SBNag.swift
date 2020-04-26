//
//  SBNagService.swift
//  Pods
//
//  Created by Elliot Schrock on 3/7/17.
//
//

import UIKit
import SwiftDate

open class SBNagService: NSObject {
    fileprivate static let kLastNaggedKey: String = "sbLastNagged"
    fileprivate static let kNaggedCountKey: String = "sbNaggedCount"
    public var nagtions = [SBNagtion]()
    public var delayInSeconds: Int = 17
    public var daysBetweenNags: Int = 2
    public var opensOffset: Int = 3
    public var opensBetweenNags: Int = 7

    public func startCountDown() {
        if isNaggable() {
            for nagtion in nagtions {
                if isNaggable(nagtion: nagtion) {
                    scheduleNag(nagtion: nagtion)
                    break
                }
            }
        }
    }
    
    func isNaggable() -> Bool {
        let checkCount: Int = UserDefaults.standard.integer(forKey: SBNagService.kNaggedCountKey)
        let lastChecked: Date? = UserDefaults.standard.object(forKey: SBNagService.kLastNaggedKey) as? Date
        var canNag = false
        if let checkedDate = lastChecked {
            let canNagDate = checkedDate + daysBetweenNags.days < Date()
            let canNagCount = (checkCount - opensOffset) % opensBetweenNags == 0
            canNag = canNagDate && canNagCount
        }else{
            UserDefaults.standard.set(Date(), forKey: SBNagService.kLastNaggedKey)
        }
        updateNagCount(count: checkCount + 1)
        return canNag
    }
    
    func isNaggable(nagtion: SBNagtion) -> Bool {
        return !UserDefaults.standard.bool(forKey: nagtion.defaultsKey)
    }
    
    func scheduleNag(nagtion: SBNagtion) {
        let deadline: DispatchTime = DispatchTime.now() + DispatchTimeInterval.seconds(delayInSeconds)
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            let alert = self.alertController(from: nagtion)
            alert.display()
            self.updateLastNagged(date: Date())
        })
    }
    
    func updateLastNagged(date: Date?) {
        UserDefaults.standard.set(date, forKey: SBNagService.kLastNaggedKey)
    }
    
    func updateNagCount(count: Int?) {
        if let checkCount = count {
            UserDefaults.standard.set(checkCount + 1, forKey: SBNagService.kNaggedCountKey)
        } else {
            UserDefaults.standard.set(0, forKey: SBNagService.kNaggedCountKey)
        }
    }
    
    func alertController(from nagtion: SBNagtion) -> UIAlertController {
        let alert = UIAlertController(title: nagtion.title, message: nagtion.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: nagtion.yesText, style: .default, handler: { (action) in
            if let action = nagtion.yesAction {
                UserDefaults.standard.set(true, forKey: nagtion.defaultsKey)
                action()
            }
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: nagtion.maybeText, style: .default, handler: { (action) in
            if let action = nagtion.maybeAction {
                action()
            }
            alert.dismiss(animated: true, completion: nil)
        }))
        if let alreadyText = nagtion.alreadyHaveText {
            alert.addAction(UIAlertAction(title: alreadyText, style: .cancel, handler: { (action) in
                if let action = nagtion.alreadyHaveAction {
                    action()
                }
                alert.dismiss(animated: true, completion: nil)
            }))
        }
        alert.addAction(UIAlertAction(title: nagtion.noText, style: .default, handler: { (action) in
            if let action = nagtion.noAction {
                UserDefaults.standard.set(true, forKey: nagtion.defaultsKey)
                action()
            }
            alert.dismiss(animated: true, completion: nil)
        }))
        
        return alert
    }
}

extension UIAlertController {
    public func display(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            if let navVC = rootViewController as? UINavigationController, let visibleVC = navVC.visibleViewController {
                    present(visibleVC, animated: flag, completion: completion)
            } else {
                if let tabVC = rootViewController as? UITabBarController, let selectedVC = tabVC.selectedViewController {
                      present(selectedVC, animated: flag, completion: completion)
                } else {
                    rootViewController.present(self, animated: flag, completion: completion)
                }
            }
        }
    }
}
