//MARK: Usage:
//      1. Add a variable in view controller
//            var pulsatingLayer: CAShapeLayer!
//      2. Add the following code inside viewDidLoad method
//            setupNotificationObservers()
//            setupCircleLayers()
//      3. Add the given extension in your project


extension ViewController {

    //MARK: adding notification observer to start animation when apps is in foreground
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc private func handleEnterForeground() {
        animatePulsatingLayer()
    }
    
    //MARK: Setup a Circular layer
    //      Then adding that layer in view
    //      Here pulse will produce from behind "customButton" 
    
    private func setupCircleLayers() {
        pulsatingLayer = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.pulsatingFillColor)
        view.layer.addSublayer(pulsatingLayer)
        
        //MARK: add "customButton" to view 
        view.addSubview(customButton)
        //MARK: add "customButton" constrain
        customButton.anchorCenterXToSuperview()
        customButton.anchor(nil, left: nil, bottom: self.view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: self.tabbarScanButton.frame.width, heightConstant: self.tabbarScanButton.frame.width)
        animatePulsatingLayer()
    }
    
    //MARK: Create a Circular layer
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: customButton.frame.width/2.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = CGPoint(x: UIScreen.main.bounds.width/2.0, y:  UIScreen.main.bounds.height/2)
        return layer
    }
    
    //MARK: animation
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.toValue = 1.25
        animation.duration = 1.5
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
}


