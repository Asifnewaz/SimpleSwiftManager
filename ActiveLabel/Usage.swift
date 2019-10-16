//1. Add a label in story board
//2. Add class of the label --- ActiveLable
//3. Hook the label with viewController
//4. then add the following code in viewDidLoad

//MARK: Active Label
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
                                           
            termsAndConditionsLabel.handleCustomTap(for: customType){ _ in 
                print("Link Tapped")
            }
        }
