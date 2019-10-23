//
//  UIImage+Extensions.swift
//  CashBaba
//
//  Created by MacBook Pro on 1/7/19.
//  Copyright © 2019 Recursion Technologies Ltd. All rights reserved.
//

import UIKit

extension UIImage {
    func upOrientationImage() -> UIImage? {
        switch imageOrientation {
        case .up:
            return self
        default:
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(in: CGRect(origin: .zero, size: size))
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
    }
}
