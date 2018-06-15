//
//  ProgressGraph.swift
//  Dubug My App
//
//  Created by Shubh on 15/06/18.
//  Copyright © 2018 Shubh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ProgressGraph: UIView {
    
    private var trackShapeLayer = CAShapeLayer()
    private var followShapeLayer = CAShapeLayer()
    
    private var arcWidth : CGFloat {
        return self.bounds.width * 0.168
    }
    
    @IBInspectable
    var outlineColor: UIColor = UIColor.blue
    
    private var outlineBorderColor: UIColor {
        return outlineColor.withAlphaComponent(0.5)
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
       
        let radius: CGFloat = max(bounds.width, bounds.height) / 2
        
        let startAngle: CGFloat = .pi * 0.6666
       
        let endAngle: CGFloat =   .pi * 0.3333
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let baseLayer = CAShapeLayer()
        baseLayer.path = circularPath.cgPath
        baseLayer.shadowColor = outlineColor.cgColor
        baseLayer.shadowOpacity = 1
        baseLayer.shadowOffset = CGSize.zero
        baseLayer.shadowRadius = 2
        baseLayer.lineWidth = arcWidth
        baseLayer.fillColor = UIColor.clear.cgColor
        baseLayer.strokeColor = #colorLiteral(red: 0.9410941005, green: 0.9412292838, blue: 0.9410645366, alpha: 1)
        baseLayer.lineCap = kCALineCapRound
        self.layer.addSublayer(baseLayer)

        trackShapeLayer.path = circularPath.cgPath
        trackShapeLayer.lineWidth = arcWidth - (arcWidth*0.2)
        trackShapeLayer.fillColor = UIColor.clear.cgColor
        trackShapeLayer.strokeColor = outlineBorderColor.cgColor
        trackShapeLayer.strokeEnd = 0.00001
        trackShapeLayer.lineCap = kCALineCapRound
        self.layer.addSublayer(trackShapeLayer)

        followShapeLayer.path = circularPath.cgPath
        followShapeLayer.lineWidth = arcWidth - (arcWidth*0.4)
        followShapeLayer.fillColor = UIColor.clear.cgColor
        followShapeLayer.strokeColor = outlineColor.cgColor
        followShapeLayer.strokeEnd = 0.00001
        followShapeLayer.lineCap = kCALineCapRound
        self.layer.addSublayer(followShapeLayer)
    }

    func updateProgress(target: Float, score: Float) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = target/100
        basicAnimation.duration = 1
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        trackShapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        let basicAnimation2 = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation2.toValue = score/100
        basicAnimation2.duration = 1
        basicAnimation2.fillMode = kCAFillModeForwards
        basicAnimation2.isRemovedOnCompletion = false
        followShapeLayer.add(basicAnimation2, forKey: "urSoBasic")
    }
}




