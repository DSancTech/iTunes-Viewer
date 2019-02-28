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
    var bgImageView: UIImageView?
    
    // Launch Icon Image
    var launchIconImage: UIImage?
    var launchIconImageView: UIImageView?
    
    // Transition
    let scaleTransition = ScaleTransition()

    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color:
        self.view.backgroundColor = UIColor.init(red:0.92, green:0.59, blue:0.16, alpha:1.0)
        
        // Set background image:
        bgImage = UIImage.init(named: "LaunchGradientBG")
        bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView?.contentMode = .scaleToFill
        bgImageView?.center = self.view.center
        bgImageView?.image = bgImage
        self.view.addSubview(bgImageView ?? UIView.init(frame: self.view.bounds))
        self.view.sendSubviewToBack(bgImageView ?? UIView.init(frame: self.view.bounds))
        
        // Set launch icon image:
        launchIconImage = UIImage.init(named: "LaunchIcon")
        launchIconImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        launchIconImageView?.contentMode = .scaleAspectFit
        launchIconImageView?.center = self.view.center
        launchIconImageView?.image = launchIconImage
        self.view.addSubview(launchIconImageView ?? UIView.init(frame: self.view.bounds))
        self.view.bringSubviewToFront(launchIconImageView ?? UIView.init(frame: self.view.bounds))
        
    }
    
    // View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        // Add delay before beginning animation to preserve visual continuity
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(600), execute: {
            // Scale up launch icon
            UIView.animate(
                withDuration: 0.15,
                delay: 0.0,
                options: .curveEaseInOut,
                animations: {
                    self.launchIconImageView?.transform = CGAffineTransform.identity.scaledBy(x: 1.75, y: 1.75)
                }, completion: { finished in
                    // Scale down launch icon
                    UIView.animate(
                        withDuration: 0.15,
                        delay: 0.0,
                        options: .curveEaseInOut,
                        animations: {
                            self.launchIconImageView?.transform = CGAffineTransform.identity.scaledBy(x: 0.01, y: 0.01)
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
