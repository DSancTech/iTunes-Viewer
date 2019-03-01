//
//  LaunchScreenViewController.swift
//  iTunes Viewer
//
//  Created by David Sanchez on 2/28/19.
//  Copyright © 2019 DSancTech. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    // BG Image
    var bgImage: UIImage?
    
    // Launch Icon Image
    var launchIconImage: UIImage?
    var launchIconImageView = UIImageView()
    var launchIconImageViewXConstraint = NSLayoutConstraint()
    var launchIconImageViewYConstraint = NSLayoutConstraint()
    var launchIconImageViewWidthConstraint = NSLayoutConstraint()
    var launchIconImageViewHeightConstraint = NSLayoutConstraint()
    
    // Transition
    let scaleTransition = ScaleTransition()

    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background image:
        bgImage = UIImage(named: "LaunchGradientBG")
        UIGraphicsBeginImageContext(self.view.frame.size)
        bgImage?.draw(in: self.view.bounds)
        let patternImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: patternImage)
        
        // Set launch icon image:
        launchIconImage = UIImage.init(named: "LaunchIcon")
        launchIconImageView.contentMode = .scaleAspectFit
        launchIconImageView.image = launchIconImage
        launchIconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(launchIconImageView)
        self.view.bringSubviewToFront(launchIconImageView)
        launchIconImageViewWidthConstraint = launchIconImageView.widthAnchor.constraint(equalToConstant: 100.0)
        launchIconImageViewWidthConstraint.isActive = true
        launchIconImageViewHeightConstraint = launchIconImageView.heightAnchor.constraint(equalToConstant: 100.0)
        launchIconImageViewHeightConstraint.isActive = true
        launchIconImageViewXConstraint = launchIconImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        launchIconImageViewXConstraint.isActive = true
        launchIconImageViewYConstraint = launchIconImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        launchIconImageViewYConstraint.isActive = true
        
    }
    
    // View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        // Add delay before beginning animation to preserve visual continuity
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(600), execute: {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            // Scale up launch icon
            UIView.animate(
                withDuration: 0.15,
                delay: 0.0,
                options: .curveEaseInOut,
                animations: {
                    self.launchIconImageView.transform = CGAffineTransform.identity.scaledBy(x: 1.75, y: 1.75)
                }, completion: { finished in
                    // Scale down launch icon
                    UIView.animate(
                        withDuration: 0.15,
                        delay: 0.0,
                        options: .curveEaseInOut,
                        animations: {
                            self.launchIconImageView.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
                        }, completion: { finished in
                            // Begin transition
                            self.transitionToMainView()
                        }
                    )
                }
            )
        })
    }
    
    // Transition to main view.
    func transitionToMainView() {
        let mainScreenViewController = storyboard!.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        mainScreenViewController.transitioningDelegate = self
        self.present(mainScreenViewController, animated: true, completion: nil)
    }
    
    /// Return scale transition when presenting view controller
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return scaleTransition
    }
    
    // Set status bar style.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
