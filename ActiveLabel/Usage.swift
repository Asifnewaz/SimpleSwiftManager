//Active Label
        let customType = ActiveType.custom(pattern: "\\Terms and Conditions\\b")
        termsAndConditionsLabel.enabledTypes.append(customType)
        termsAndConditionsLabel.urlMaximumLength = 31
        termsAndConditionsLabel.customize { termsAndConditionsLabel in
            termsAndConditionsLabel.text = "I/We acknowledge and accept the Terms and Conditions applicable and available."
            termsAndConditionsLabel.numberOfLines = 2
            termsAndConditionsLabel.lineSpacing = 0

            //Custom types
            termsAndConditionsLabel.customColor[customType] = UIColor.systemBlue
            termsAndConditionsLabel.customSelectedColor[customType] = UIColor.systemBlue
            
//            termsAndConditionsLabel.configureLinkAttribute = { (type, attributes, isSelected) in
//                var atts = attributes
//                switch type {
//                case customType3:
//                    atts[NSAttributedString.Key.font] = isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.boldSystemFont(ofSize: 14)
//                default: ()
//                }
//
//                return atts
//            }

            termsAndConditionsLabel.handleCustomTap(for: customType){ _ in 
                print("Link Tapped")
            }
        }
