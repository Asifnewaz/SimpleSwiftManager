//
//  UITextField+Extension.swift
//  CashBaba
//
//  Created by MacBook Pro on 20/6/19.
//  Copyright © 2019 Recursion Technologies Ltd. All rights reserved.
//

import Foundation

extension UITextField
{
    func setBottomBorder(color: UIColor)
    {
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let width: CGFloat = 1.0
        
        let borderLine = UIView(frame: CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width))
        borderLine.backgroundColor = color
        self.addSubview(borderLine)
    }
}
