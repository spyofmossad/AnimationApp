//
//  ViewController.swift
//  AnimationApp
//
//  Created by Dmitry on 24.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {

    @IBOutlet var animatedView: SpringView!
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var animationName: UILabel!
    @IBOutlet var animationCurve: UILabel!
    @IBOutlet var animationDuration: UILabel!
    @IBOutlet var animationDelay: UILabel!
    @IBOutlet var animationForce: UILabel!
    
    private var currentAnimation: Animation!
    private var nextAnimation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI();
        
        currentAnimation = Animation.getAnimation()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        nextAnimation = Animation.getAnimation()
        
        setAnimationDescription(for: currentAnimation)
        setAnimation(for: animatedView, with: currentAnimation)
                        
        nextButton.setTitle("Next animation: \(nextAnimation.name)", for: .normal)
        
        currentAnimation = nextAnimation
    }
    
    private func setAnimationDescription(for animation: Animation) {
        animationName.text = "Animation: \(animation.name)"
        animationCurve.text = "Curve: \(animation.curve)"
        animationForce.text = "Force: \(string(animation.force))"
        animationDuration.text = "Duration (sec): \(string(animation.duration))"
        animationDelay.text = "Delay (sec): \(string(animation.delay))"
    }
    
    private func setAnimation(for view: SpringView, with animation: Animation) {
        view.animation = animation.name
        view.curve = animation.curve
        view.force = animation.force
        view.delay = animation.delay
        view.duration = animation.duration
        view.animate()
    }
    
    private func string(_ color: CGFloat) -> String {
        String(format: "%.2f", Double(color))
    }
    
    private func setupUI() {
        animatedView.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 5
        
        [animationName, animationCurve, animationDelay, animationDuration, animationForce]
            .forEach({$0.text = nil})
        
        nextButton.setTitle("Run animation", for: .normal)
    }

}

