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
    var topContainerViewLeftConstraintConstant = CGFloat()
    var topContainerViewTopConstraintConstant = CGFloat()
    var topContainerViewHeightConstraintConstant = CGFloat()
    var topContainerViewHeightConstraint = NSLayoutConstraint()
    var topContainerViewWidthConstraintConstant = CGFloat()
    
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
        topContainerView.backgroundColor = UIColor(red: 0.92, green: 0.59, blue: 0.16, alpha: 1.0)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topContainerView)
        self.view.bringSubviewToFront(topContainerView)
        topContainerViewLeftConstraintConstant = CGFloat(0.0)
        topContainerViewTopConstraintConstant = CGFloat(0.0)
        topContainerViewHeightConstraintConstant = topSafeArea + 200.0
        topContainerViewWidthConstraintConstant = viewWidth
        topContainerViewHeightConstraint = topContainerView.heightAnchor.constraint(equalToConstant: topContainerViewHeightConstraintConstant)
        topContainerViewHeightConstraint.isActive = true
        topContainerView.widthAnchor.constraint(equalToConstant: topContainerViewWidthConstraintConstant).isActive = true
        
    }
    
    // Detect orientation changes.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // On landscape orientation:
        if UIDevice.current.orientation.isLandscape {
            topContainerViewHeightConstraint.constant = viewWidth
        }
        // On portrait orientation:
        else if (UIDevice.current.orientation.isPortrait) {
            topContainerViewHeightConstraint.constant = topSafeArea + 200.0
        }
        self.view.layoutIfNeeded()
    }

    
    // Set status bar style.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
