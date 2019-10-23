//
//  NSNumber+Extension.swift
//  CashBaba
//
//  Created by Mamun Ar Rashid on 12/13/17.
//  Copyright © 2017 Recursion Technologies Ltd. All rights reserved.
//

import Foundation

extension NSNumber {
    func toString() -> String {
        return self.stringValue
    }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
