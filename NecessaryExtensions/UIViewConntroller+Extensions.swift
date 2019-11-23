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


//MARK: Extension for hiding mid character of a string
// 1234567890 ----> 1234 **** 90

extension UIViewController {
    func hideMidChars(_ value: String) -> String {
        return String(value.enumerated().map { index, char in
            return [0,1, value.count-2 , value.count-1 ].contains(index) ? char : "x"
        })
    }
    
    func hideMidCharsWithOnlyTwoStar(_ value: String, initialDisplayChar: Int, endDisplayChar: Int) -> String {
        let reveivedString = value
        let reveivedStringInitialChar = reveivedString.prefix(initialDisplayChar)
        let reveivedStringEndChar = reveivedString.suffix(endDisplayChar)
        return  reveivedStringInitialChar + "****" + reveivedStringEndChar
    }
    
    func hideCardsInitialChars(_ value: String, endDisplayChar: Int) -> String {
        let reveivedString = value
        let reveivedStringEndChar = reveivedString.suffix(endDisplayChar)
        return "************ " + reveivedStringEndChar
    }
    
    //MARK: 1234 56** **** 7890
    func hideCharacterInCardFormat(_ value: String, initialDisplayChar: Int = 6, endDisplayChar: Int = 4) -> String {
        let reveivedString = value
        if reveivedString.count >= 13 {
            let initChar = reveivedString.prefix(initialDisplayChar)
            let endChar = reveivedString.suffix(endDisplayChar)
            let count = reveivedString.count - initialDisplayChar - endDisplayChar
            var starString: String = ""
            for item in 1...count {
                starString = starString + "*"
            }
            
            let encryptedString: String = "" + initChar + starString + endChar
            let formattedString: String =  encryptedString.inserting(separator: "    ", every: 4)
            
            return formattedString
        } else {
            let reveivedStringEndChar = reveivedString.suffix(endDisplayChar)
            return "************ " + reveivedStringEndChar
        }
    }
    
}

//MARK: This protocol is used for hide mid characters
extension StringProtocol where Self: RangeReplaceableCollection {
    mutating func insert(separator: Self, every n: Int) {
        for index in indices.reversed() where index != startIndex &&
            distance(from: startIndex, to: index) % n == 0 {
            insert(contentsOf: separator, at: index)
        }
    }

    func inserting(separator: Self, every n: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: n)
        return string
    }
}
