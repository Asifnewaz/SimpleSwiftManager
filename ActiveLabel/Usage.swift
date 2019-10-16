//1. Add a label in story board
//2. Add class of the label --- ActiveLable
//3. Hook the label with viewController
//4. then add the following code in viewDidLoad
//5. Add UICiewController Extension in project

//MARK: Active Label
makeLabelActive(label: self.termsAndConditionsLabel)


// Extension
extension UIViewController {
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
                print("Link Tapped")
                let storyboard = UIStoryboard(name: "others", bundle: Bundle.main)
                let passwordVC = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as? PrivacyPolicyViewController
                passwordVC?.url = AppGlobal.about
                self.navigationController?.show(passwordVC!, sender: self)
            }
        }
    }
}
