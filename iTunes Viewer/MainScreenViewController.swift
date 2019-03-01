//
//  MainScreenViewController.swift
//  iTunes Viewer
//
//  Created by David Sanchez on 2/28/19.
//  Copyright © 2019 DSancTech. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // Top Container View
    var topContainerView = UIView()
    var topContainerViewBGImage: UIImage?
    var topContainerViewHeightConstraint = NSLayoutConstraint()
    var topContainerViewWidthConstraint = NSLayoutConstraint()
    var topContainerViewLeftConstraint = NSLayoutConstraint()
    var topContainerViewTopConstraint = NSLayoutConstraint()
    
    // Title Label
    var titleLabel = UILabel()
    var titleLabelLeftConstraint = NSLayoutConstraint()
    var titleLabelRightConstraint = NSLayoutConstraint()
    var titleLabelBottomConstraint = NSLayoutConstraint()
    
    // Media Type Container View
    
    // Feed Type Container View
    
    // View variables
    var topSafeArea = CGFloat()
    var bottomSafeArea = CGFloat()
    var viewHeight = CGFloat()
    var viewWidth = CGFloat()
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get safe area insets:
        if #available(iOS 11.0, *) {
            topSafeArea = (UIApplication.shared.keyWindow?.safeAreaInsets.top)!
            bottomSafeArea = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)!
        }
        else {
            topSafeArea = CGFloat(0.0)
            bottomSafeArea = CGFloat(0.0)
        }
        
        // Get view width and height
        viewWidth = self.view.frame.size.width
        viewHeight = self.view.frame.size.height

        // Set background color:
        self.view.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.0)
        
        // Setup top container view:
        topContainerView.backgroundColor = UIColor(red: 0.92, green: 0.55, blue: 0.16, alpha: 1.0)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topContainerView)
        self.view.bringSubviewToFront(topContainerView)
        if (UIDevice.current.orientation.isPortrait) {
            topContainerViewHeightConstraint = topContainerView.heightAnchor.constraint(equalToConstant: topSafeArea + 220.0)
            topContainerViewWidthConstraint = topContainerView.widthAnchor.constraint(equalToConstant: viewWidth)
        }
        else if (UIDevice.current.orientation.isLandscape) {
            topContainerViewHeightConstraint = topContainerView.heightAnchor.constraint(equalToConstant: viewWidth)
            topContainerViewWidthConstraint = topContainerView.widthAnchor.constraint(equalToConstant: topSafeArea + 200.0)
        }
        topContainerViewLeftConstraint = topContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        topContainerViewTopConstraint = topContainerView.topAnchor.constraint(equalTo: self.view.topAnchor)
        topContainerViewWidthConstraint.isActive = true
        topContainerViewHeightConstraint.isActive = true
        
    }
    
    // View did layout subviews
    override func viewDidLayoutSubviews() {
        // Set top container view bg image:
        topContainerViewBGImage = UIImage(named: "LaunchGradientBG")
        UIGraphicsBeginImageContext(self.view.frame.size)
        topContainerViewBGImage?.draw(in: self.topContainerView.bounds)
        let patternImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.topContainerView.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    // Detect orientation changes.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // On portrait orientation:
        if (UIDevice.current.orientation.isPortrait) {
            topContainerViewHeightConstraint.constant = topSafeArea + 220.0
            topContainerViewWidthConstraint.constant = viewWidth
        }
        // On landscape orientation:
        else if (UIDevice.current.orientation.isLandscape) {
            topContainerViewHeightConstraint.constant = viewWidth
            topContainerViewWidthConstraint.constant = topSafeArea + 200.0
        }
        // Animate rotation change:
        UIView.animate(
            withDuration: 0.15,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                self.view.layoutIfNeeded()
        }, completion: nil
        )
    }
    
    // Set status bar style.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
