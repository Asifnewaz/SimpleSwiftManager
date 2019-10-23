//
//  ViewExtension.swift
//  WallpaperTemplateSwift3
//
//  Created by Mamun Ar Rashid on 7/23/17.
//  Copyright © 2017 Fantasy Apps. All rights reserved.
//

import UIKit


extension UIView {
    
    /**
     ** Note that parentVC still may not have a parent view controller.
     ** But only if the view has not part of a viewController’s view’s view hierarchy.
     */
    var parentVC: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundedCorner(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorderWithColor(borderWidth: Int = 1, color: UIColor = UIColor.red) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = color.cgColor
    }
    
    //-------------------------------------------------------------------
    // MARK:- Constraints View Extension String Foramt and Anchor Format
    //-------------------------------------------------------------------
    
    public func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)
    }
    
    public func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    func makeCornersRounded() {
        //self.layer.cornerRadius = self.height / 2
        self.clipsToBounds = true
        
    }
    
    //-------------------------------------------------------------------
    // MARK:- TAP Animation
    //-------------------------------------------------------------------
    
    
    /// Button click like animation on View.
    /// Do your code on the closure/completion handler.
    ///
    /// - Parameter completionHandler: Gets called when animation is complete.
    func tapAnimation(completionHandler:@escaping (() -> Void)) {
        
        let duration:TimeInterval = 0.2
        let delay:TimeInterval = 0
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: { () -> Void in
            
            self.alpha     = 0.5
            
        }) { (finished) -> Void in
            
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha     = 1.0
                completionHandler()
            })
        }
        
    }
}

extension UINavigationBar {
    
    //    func setNavigationStyle(isTransparent: Bool) {
    //        self.isTranslucent = false
    //        if let theme = App.session.theme {
    //            self.barTintColor = theme.baseColor
    //        }
    //        self.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    //        self.tintColor = UIColor.white
    //        self.hideBottomHairline()
    //
    //        if(isTransparent)
    //        {
    //            // self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    //            self.setBackgroundImage(UIImage().onePixelImageWithColor(UIColor(white: 0.0, alpha: 0)), for: UIBarMetrics.default)
    //            self.shadowImage = UIImage()
    //            self.isTranslucent = true
    //        }
    //    }
    
    func hideBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(view: self)
        if let navigationBarImageView = navigationBarImageView {
            navigationBarImageView.isHidden = true
        }
    }
    
    func showBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(view: self)
        navigationBarImageView!.isHidden = false
    }
    
    private func hairlineImageViewInNavigationBar(view: UIView) -> UIImageView? {
        
        if view is UIImageView && view.bounds.height <= 1.0 {
            return (view as? UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInNavigationBar(view: subview) {
                return imageView
            }
        }
        
        return nil
    }
}

extension UIImageView {
    var GGImageShape : UIImageView{
        
        var topLeftCornerRadius:CGFloat     = 0
        var topRightCornerRadius:CGFloat    = 0
        var bottomLeftCornerRadius:CGFloat  = 0
        var bottomRightCornerRadius:CGFloat = 0
        topLeftCornerRadius     = self.frame.size.width * 0.36
        topRightCornerRadius    = 0
        bottomLeftCornerRadius  = self.frame.size.width * 0.27
        bottomRightCornerRadius = self.frame.size.width * 0.27
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.size.width, y: topRightCornerRadius))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height - bottomRightCornerRadius))
        
        let centerBottomRight = CGPoint(x: self.frame.size.width - bottomRightCornerRadius, y: self.frame.size.height - bottomRightCornerRadius)
        
        path.addArc(withCenter: centerBottomRight, radius: bottomRightCornerRadius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi), clockwise: true)
        
        path.addLine(to: CGPoint(x: bottomLeftCornerRadius, y: self.frame.size.height))
        
        
        let centerBottomLeft = CGPoint(x:bottomLeftCornerRadius, y: self.frame.size.height - bottomLeftCornerRadius)
        
        path.addArc(withCenter: centerBottomLeft, radius: bottomLeftCornerRadius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi), clockwise: true)
        
        path.addLine(to: CGPoint(x: 0, y: topLeftCornerRadius))
        
        let centerTopLeft = CGPoint(x:topLeftCornerRadius, y: topLeftCornerRadius)
        
        path.addArc(withCenter: centerTopLeft, radius: topLeftCornerRadius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3*Double.pi), clockwise: true)
        
        
        path.addLine(to: CGPoint(x: self.frame.size.width - topRightCornerRadius, y: 0))
        
        
        let centerTopRight = CGPoint(x: self.frame.size.width - topRightCornerRadius, y: topRightCornerRadius)
        
        path.addArc(withCenter: centerTopRight, radius: topRightCornerRadius, startAngle: CGFloat(3*Double.pi), endAngle: CGFloat(0), clockwise: true)
        
        path.close()
        let customMask = CAShapeLayer()
        customMask.path = path.cgPath
        self.layer.mask = customMask
        return self
    }
    
}

extension UIView {
    func getColourFromPoint(point:CGPoint) -> UIColor {
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue:CGImageAlphaInfo.premultipliedLast.rawValue)
        
        var pixelData:[UInt8] = [0, 0, 0, 0]
        
        let context = CGContext(data: &pixelData, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context!.translateBy(x: -point.x, y: -point.y);
        self.layer.render(in: context!)
        
        let red:CGFloat = CGFloat(pixelData[0])/CGFloat(255.0)
        let green:CGFloat = CGFloat(pixelData[1])/CGFloat(255.0)
        let blue:CGFloat = CGFloat(pixelData[2])/CGFloat(255.0)
        let alpha:CGFloat = CGFloat(pixelData[3])/CGFloat(255.0)
        
        let color:UIColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
}

extension UIView {
    func getScreenShot() -> UIImage? {
        var screenShot: UIImage?
        let layer = self.layer
        let scale: CGFloat = 1.0
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        if let context = UIGraphicsGetCurrentContext() {
        layer.render(in: context)
        screenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        }
       // }
     return screenShot
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
