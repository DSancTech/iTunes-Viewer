//
//  ScaleTransition.swift
//  iTunes Viewer
//
//  Created by David Sanchez on 2/28/19.
//  Copyright © 2019 DSancTech. All rights reserved.
//

import UIKit

class ScaleTransition: NSObject, UIViewControllerAnimatedTransitioning {

    // Transition Variables
    let transitionDuration = 0.8
    let transitionDelay = 0.0
    let springDamping = CGFloat(0.7)
    let springVelocity = CGFloat(0.0)
    
    // Set the transition duration
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    // Animation setup
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        // Transitioning view initial setup
        toView.transform = CGAffineTransform.identity.scaledBy(x: 0.0, y: 0.0)
        toView.center = containerView.center
        toView.layer.cornerRadius = containerView.frame.size.height / 2.0
        toView.clipsToBounds = true
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(toView)
        
        // Begin scale animation
        UIView.animate(
            withDuration: transitionDuration,
            delay: transitionDelay,
            usingSpringWithDamping: springDamping,
            initialSpringVelocity: springVelocity,
            animations: {
                toView.transform = CGAffineTransform.identity
                toView.layer.cornerRadius = 0.0
            },
            completion: { finished in
                transitionContext.completeTransition(true)
            }
        )
        
    }
    
}
