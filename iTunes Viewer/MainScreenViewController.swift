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
    var titleLabelBottomConstraint = NSLayoutConstraint()
    
    // Media Type Container View
    var mediaTypeContainerView = UIView()
    var mediaTypeContainerViewHeight = NSLayoutConstraint()
    var mediaTypeContainerViewLeftConstraint = NSLayoutConstraint()
    var mediaTypeContainerViewRightConstraint = NSLayoutConstraint()
    var mediaTypeContainerViewYConstraint = NSLayoutConstraint()
    
    // Feed Type Container View
    var feedTypeContainerView = UIView()
    var feedTypeContainerViewHeight = NSLayoutConstraint()
    var feedTypeContainerViewLeftConstraint = NSLayoutConstraint()
    var feedTypeContainerViewRightConstraint = NSLayoutConstraint()
    var feedTypeContainerViewTopConstraint = NSLayoutConstraint()
    
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
        
        // Set up top container view:
        topContainerView.backgroundColor = UIColor(red: 0.92, green: 0.55, blue: 0.16, alpha: 1.0)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topContainerView)
        self.view.bringSubviewToFront(topContainerView)
        if (UIDevice.current.orientation.isPortrait) {
            topContainerViewHeightConstraint = topContainerView.heightAnchor.constraint(equalToConstant: topSafeArea + 208.0)
            topContainerViewWidthConstraint = topContainerView.widthAnchor.constraint(equalToConstant: viewWidth)
        }
        else if (UIDevice.current.orientation.isLandscape) {
            topContainerViewHeightConstraint = topContainerView.heightAnchor.constraint(equalToConstant: viewWidth)
            topContainerViewWidthConstraint = topContainerView.widthAnchor.constraint(equalToConstant: topSafeArea + 224.0)
        }
        topContainerViewLeftConstraint = topContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        topContainerViewTopConstraint = topContainerView.topAnchor.constraint(equalTo: self.view.topAnchor)
        topContainerViewWidthConstraint.isActive = true
        topContainerViewHeightConstraint.isActive = true
        
        // Set up media type container view:
        mediaTypeContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        mediaTypeContainerView.layer.cornerRadius = 15.0
        mediaTypeContainerView.clipsToBounds = true
        mediaTypeContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.topContainerView.addSubview(mediaTypeContainerView)
        if (UIDevice.current.orientation.isPortrait) {
            mediaTypeContainerViewLeftConstraint = mediaTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
            mediaTypeContainerViewRightConstraint = mediaTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24.0)
            mediaTypeContainerViewYConstraint = mediaTypeContainerView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: -((topSafeArea / 2.0) - 37.0))
        }
        else if (UIDevice.current.orientation.isLandscape) {
            mediaTypeContainerViewLeftConstraint = mediaTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: topSafeArea + 8.0)
            mediaTypeContainerViewRightConstraint = mediaTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -(topSafeArea + 8.0))
            mediaTypeContainerViewYConstraint = mediaTypeContainerView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: 0.0)
        }
        mediaTypeContainerViewHeight = mediaTypeContainerView.heightAnchor.constraint(equalToConstant: 50.0)
        mediaTypeContainerViewLeftConstraint.isActive = true
        mediaTypeContainerViewRightConstraint.isActive = true
        mediaTypeContainerViewYConstraint.isActive = true
        mediaTypeContainerViewHeight.isActive = true
        
        // Set up title label:
        titleLabel.text = "iTunes Viewer"
        titleLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .black)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.topContainerView.addSubview(titleLabel)
        if (UIDevice.current.orientation.isPortrait) {
            titleLabelLeftConstraint = titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
        }
        else if (UIDevice.current.orientation.isLandscape) {
            titleLabelLeftConstraint = titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: topSafeArea + 8.0)
        }
        titleLabelBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: mediaTypeContainerView.topAnchor, constant: -24.0)
        titleLabelLeftConstraint.isActive = true
        titleLabelBottomConstraint.isActive = true
        
        // Set up feed type container view:
        feedTypeContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        feedTypeContainerView.layer.cornerRadius = 15.0
        feedTypeContainerView.clipsToBounds = true
        feedTypeContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.topContainerView.addSubview(feedTypeContainerView)
        if (UIDevice.current.orientation.isPortrait) {
            feedTypeContainerViewLeftConstraint = feedTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
            feedTypeContainerViewRightConstraint = feedTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24.0)
        }
        else if (UIDevice.current.orientation.isLandscape) {
            feedTypeContainerViewLeftConstraint = feedTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: topSafeArea + 8.0)
            feedTypeContainerViewRightConstraint = feedTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -(topSafeArea + 8.0))
        }
        feedTypeContainerViewHeight = feedTypeContainerView.heightAnchor.constraint(equalToConstant: 50.0)
        feedTypeContainerViewTopConstraint = feedTypeContainerView.topAnchor.constraint(equalTo: mediaTypeContainerView.bottomAnchor, constant: 8.0)
        feedTypeContainerViewLeftConstraint.isActive = true
        feedTypeContainerViewRightConstraint.isActive = true
        feedTypeContainerViewTopConstraint.isActive = true
        feedTypeContainerViewHeight.isActive = true
        
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
            topContainerViewHeightConstraint.constant = topSafeArea + 208.0
            topContainerViewWidthConstraint.constant = viewWidth
        }
        // On landscape orientation:
        else if (UIDevice.current.orientation.isLandscape) {
            topContainerViewHeightConstraint.constant = viewWidth
            topContainerViewWidthConstraint.constant = topSafeArea + 224.0
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
