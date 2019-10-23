switch UIDevice().type {
         case .iPhone5, .iPhone5S, .iPhoneSE:
            print("iPhone 5 & SE")
         case .iPhone6, .iPhone7,  .iPhone8:
            print("iPhone 6,7 & 8")
         case .iPhone6plus, .iPhone7plus, .iPhone8plus, .simulator:
            print("iPhone 6p, 7p & 8p")
         case  .iPhoneX, .iPhoneXS, .iPhone11Pro:
            print("iPhoneX, iPhoneXS, iPhone11Pro")
         case .iPhoneXR, .iPhoneXSmax,.iPhone11, .iPhone11ProMax:
            print("iPhoneXR, iPhoneXXSmax, iPhoneX11, iPhoneX11ProMax")
         default:
            print("Default")
}
