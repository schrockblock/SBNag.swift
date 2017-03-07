//
//  SBNagtion.swift
//  Pods
//
//  Created by Elliot Schrock on 3/7/17.
//
//

import UIKit

open class SBNagtion: NSObject {
    public var defaultsKey: String = ""
    
    public var title: String?
    public var message: String?
    
    public var yesText: String = "Yes, I'd be delighted!"
    public var maybeText: String = "Mmm, not right now"
    public var noText: String = "Nope, never"
    public var alreadyHaveText: String? = "I already have!"
    
    public var yesAction: (() -> ())?
    public var maybeAction: (() -> ())?
    public var alreadyHaveAction: (() -> ())?
    public var noAction: (() -> ())?
}
