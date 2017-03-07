// https://github.com/Quick/Quick

import Quick
import Nimble
@testable import SBNag_swift
import SwiftDate

class SBNagSpec: QuickSpec {
    override func spec() {
        let nag = SBNagService()
        nag.delayInSeconds = 0
        nag.daysBetweenNags = 0
        
        let rateNagtion = SBNagtion()
        rateNagtion.defaultsKey = "rate"
        rateNagtion.title = "Sorry to interrupt..."
        rateNagtion.message = "...but would you mind rating this app?"
        
        let paidNagtion = SBNagtion()
        paidNagtion.defaultsKey = "paid"
        paidNagtion.title = "Hey!"
        paidNagtion.message = "Would you like to buy an ad free version?"
        
        nag.nagtions.append(rateNagtion)
        nag.nagtions.append(paidNagtion)
        
        describe("SBNagService") {
            
            it("doesn't nag the first time") {
                expect(nag.isNaggable()).to(beFalse())
            }

            it("isn't naggable too soon") {
                nag.daysBetweenNags = 1
                expect(nag.isNaggable()).to(beFalse())
            }
            
            it("is naggable when time passed") {
                nag.updateLastNagged(date: 2.days.ago())
                expect(nag.isNaggable()).to(beTrue())
            }

            it("respects nagged choices") {
                UserDefaults.standard.set(true, forKey: rateNagtion.defaultsKey)
                expect(nag.isNaggable(nagtion: rateNagtion)).to(beFalse())
            }
            
            afterSuite {
                nag.updateLastNagged(date: nil)
                UserDefaults.standard.set(nil, forKey: rateNagtion.defaultsKey)
                UserDefaults.standard.set(nil, forKey: paidNagtion.defaultsKey)
            }
        }
    }
}
