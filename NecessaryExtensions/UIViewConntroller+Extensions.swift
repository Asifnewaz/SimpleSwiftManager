//
//  UIViewConntroller+Extensions.swift
//  CashBaba
//
//  Created by Asif Newaz on 17/10/19.
//  Copyright © 2019 Recursion Technologies Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: This method is to make UILabel text clickable
    func makeLabelActive(label: ActiveLabel){
        let customType = ActiveType.custom(pattern: "\\Terms and Conditions\\b")
        label.enabledTypes.append(customType)
        label.urlMaximumLength = 31
        label.customize { label in
            label.text = "I/We acknowledge and accept the Terms and Conditions applicable and available."
            label.numberOfLines = 2
            label.lineSpacing = 0

            //Custom types
            label.customColor[customType] = UIColor.systemBlue
            label.customSelectedColor[customType] = UIColor.systemBlue
            label.handleCustomTap(for: customType){ _ in
                //print("Link Tapped")
                let storyboard = UIStoryboard(name: "others", bundle: Bundle.main)
                let passwordVC = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as? PrivacyPolicyViewController
                passwordVC?.url = AppGlobal.termsAndCon
                self.navigationController?.show(passwordVC!, sender: self)
            }
        }
    }
    
    
}

//MARK: -- Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
