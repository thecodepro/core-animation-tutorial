//
//  ViewController.swift
//  core-animation-tutorial
//
//  Created by Zephaniah Cohen on 11/19/17.
//  Copyright © 2017 Zephaniah Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    private var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginAnimation(_ sender: Any) {
   
        let viewToAnimate = UIView(frame: CGRect(x: 75, y: 75, width: 75, height: 75))
        viewToAnimate.backgroundColor = UIColor.orange
        
        view.addSubview(viewToAnimate)
        
        let startPoint = CGPoint(x: 75, y: 75)
        let endPoint = CGPoint(x: 150, y: 225)
        let duration: Double = 6.0
        
        let positionAnimation = constructPositionAnimation(startingPoint: startPoint, endPoint: endPoint, animationDuration: duration)
        
        viewToAnimate.layer.add(positionAnimation, forKey: "position")
        //viewToAnimate.layer.position = endPoint
        
        let scaleAnimation = constructScaleAnimation(startingScale: 1.0, endingScale: 0.4, animationDuration: 2.0)
        viewToAnimate.layer.add(scaleAnimation, forKey: "scale")
        
        let rotationAnimation = constructRotationAnimation(animationDuration: 1.3)
        viewToAnimate.layer.add(rotationAnimation, forKey: "rotate")
        
        let opacityFadeAnimation = constructOpacityAnimation(startingOpacity: 1.0, endingOpacity: 0.15, animationDuration: 1.5)
        viewToAnimate.layer.add(opacityFadeAnimation, forKey: "opacity")
        //viewToAnimate.layer.opacity = 0.0
    }
    
    //MARK: - Animation Builders
    
    private func constructOpacityAnimation(startingOpacity: CGFloat, endingOpacity: CGFloat, animationDuration: Double) -> CABasicAnimation {
        let opacityFadeAnimation = CABasicAnimation(keyPath: "opacity")
        opacityFadeAnimation.fromValue = startingOpacity
        opacityFadeAnimation.toValue = endingOpacity
        opacityFadeAnimation.duration = animationDuration
        opacityFadeAnimation.autoreverses = true
        opacityFadeAnimation.repeatCount = Float.infinity
        return opacityFadeAnimation
    }
    
    private func constructRotationAnimation(animationDuration: Double) -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = Double.pi*2
        rotationAnimation.duration = animationDuration
        rotationAnimation.repeatCount = Float.infinity

        return rotationAnimation
    }
    
    private func constructScaleAnimation(startingScale: CGFloat, endingScale: CGFloat, animationDuration: Double) -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = startingScale
        scaleAnimation.toValue = endingScale
        scaleAnimation.duration = animationDuration
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = Float.infinity
        return scaleAnimation
    }
    
    private func constructPositionAnimation(startingPoint: CGPoint, endPoint: CGPoint, animationDuration: Double) -> CABasicAnimation {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = NSValue(cgPoint: startingPoint)
        positionAnimation.toValue = NSValue(cgPoint: endPoint)
        positionAnimation.duration = animationDuration
        positionAnimation.autoreverses = true
        positionAnimation.repeatCount = Float.infinity
        positionAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return positionAnimation
    }
}

