//
//  RoundProgressBar.swift
//  demo23
//
//  Created by An Nguyen on 12/7/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import UIKit
//roundedProgress.backgroundColor = .blue
//      roundedProgress.progressBarWidth = 100
//      roundedProgress.progressBarTintColor = .gray
//      roundedProgress.progressBarProgressColor = .yellow
//   roundedProgress.currentValue = 0.7

class RoundProgressBar: UIView {
    private var bgLayer = CAShapeLayer()
    private var fgLayer = CAShapeLayer()
    var minValue: Double = 0
    var maxValue: Double = 1.0
    var currentValue: Double = 0 {
    didSet{
    fgLayer.strokeEnd = currentValue > 0.01 ? CGFloat(currentValue) : 0.01
    }
    }
    
    @IBInspectable var progressBarWidth: CGFloat = 20.0 {
    didSet{
    configureView()
    }
    }
    @IBInspectable var progressBarTintColor: UIColor = UIColor.lightGray {
    didSet{
    configureView()
    }
    }
    @IBInspectable var progressBarProgressColor: UIColor = UIColor.clear {
    didSet{
    configureView()
    }
    }
    override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
    }
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureView()
        
    }
    
    func configureView() {
    bgLayer.lineWidth = progressBarWidth
    bgLayer.fillColor = nil
    bgLayer.strokeEnd = CGFloat(maxValue)
    layer.addSublayer(bgLayer)
    fgLayer.lineWidth = progressBarWidth
    fgLayer.fillColor = nil
//    fgLayer.strokeEnd = 0.01
    layer.addSublayer(fgLayer)
    bgLayer.strokeColor = progressBarTintColor.cgColor
    fgLayer.strokeColor = progressBarProgressColor.cgColor
    }
    
    func setupCAShapeLayers(shapeLayer: CAShapeLayer, startAngle: CGFloat, endAngle: CGFloat) {
    shapeLayer.frame = self.bounds
    let center = CGPoint.init(x: self.frame.width/2, y: self.frame.height/2)
    let radius = (self.bounds.width * 0.35)
    let path = UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    shapeLayer.path = path.cgPath
    }
    
    override func layoutSubviews() {
    super.layoutSubviews()
    configureView()
    setupCAShapeLayers(shapeLayer: bgLayer, startAngle: 0, endAngle: CGFloat(Double.pi*2))
    setupCAShapeLayers(shapeLayer: fgLayer, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi*2) + CGFloat(Double.pi/2))
    }
}
