//
//  Collection+Extension.swift
//  CashBaba
//
//  Created by Mamun Ar Rashid on 4/30/18.
//  Copyright © 2018 Recursion Technologies Ltd. All rights reserved.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
