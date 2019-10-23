//
//  UILabel+Extension.swift
//  CashBaba
//
//  Created by MacBook Pro on 25/5/19.
//  Copyright © 2019 Recursion Technologies Ltd. All rights reserved.
//

import UIKit

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String, color: String) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.colorFrom(hexString: color) , range: range)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15) , range: range)
        self.attributedText = attribute
    }
}
