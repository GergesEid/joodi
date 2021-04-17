//
//  LottieAnimationExtension.swift
//  JOODI
//
//  Created by Gerges on 15/04/2021.
//

import Foundation
import UIKit
import Lottie

extension UIViewController{
    func startAnimationLoading () {
        // Create Animation object
        let jsonName = "loading"
        let animation = Animation.named(jsonName)
        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        // Set animation view content mode
        animationView.contentMode = .scaleToFill
        animationView.translatesAutoresizingMaskIntoConstraints = false
        // Add animationView as subview
        view.addSubview(animationView)
        // add constraint
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 100),
            animationView.widthAnchor.constraint(equalToConstant: 100)
            ])
        // Speed up animation
        animationView.animationSpeed = 0.6
        // Set animation loop mode
        animationView.loopMode = .loop
        // Play the animation
        animationView.play()
        // add tag to could remove animationView later
        animationView.tag = 10
    }
    
    // remove and stop animation
    func stopAnimationLoading () {
        if let removable = view.viewWithTag(10){
           removable.removeFromSuperview()
        }
    }
    
}

