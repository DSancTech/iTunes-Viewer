//
//  MainScreenViewController.swift
//  iTunes Viewer
//
//  Created by David Sanchez on 2/28/19.
//  Copyright © 2019 DSancTech. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    // Media Type Icon Image View
    var mediaTypeIconImage: UIImage?
    var mediaTypeIconImageView = UIImageView()
    var mediaTypeIconImageViewWidthConstraint = NSLayoutConstraint()
    var mediaTypeIconImageViewHeightConstraint = NSLayoutConstraint()
    var mediaTypeIconImageViewLeftConstraint = NSLayoutConstraint()
    var mediaTypeIconImageViewYConstraint = NSLayoutConstraint()
    
    // Media Type Label
    var mediaTypeLabel = UILabel()
    var mediaTypeLabelLeftConstraint = NSLayoutConstraint()
    var mediaTypeLabelRightConstraint = NSLayoutConstraint()
    var mediaTypeLabelYConstraint = NSLayoutConstraint()
    
    // Media Type More Icon Image View
    var mediaTypeMoreIconImage: UIImage?
    var mediaTypeMoreIconImageView = UIImageView()
    var mediaTypeMoreIconImageViewWidthConstraint = NSLayoutConstraint()
    var mediaTypeMoreIconImageViewHeightConstraint = NSLayoutConstraint()
    var mediaTypeMoreIconImageViewRightConstraint = NSLayoutConstraint()
    var mediaTypeMoreIconImageViewYConstraint = NSLayoutConstraint()
    
    // Media Type Button
    var mediaTypeButton = UIButton()
    var mediaTypeButtonLeftConstraint = NSLayoutConstraint()
    var mediaTypeButtonRightConstraint = NSLayoutConstraint()
    var mediaTypeButtonTopConstraint = NSLayoutConstraint()
    var mediaTypeButtonBottomConstraint = NSLayoutConstraint()
    
    // Feed Type Container View
    var feedTypeContainerView = UIView()
    var feedTypeContainerViewHeight = NSLayoutConstraint()
    var feedTypeContainerViewLeftConstraint = NSLayoutConstraint()
    var feedTypeContainerViewRightConstraint = NSLayoutConstraint()
    var feedTypeContainerViewTopConstraint = NSLayoutConstraint()
    
    // Feed Type Icon Image View
    var feedTypeIconImage: UIImage?
    var feedTypeIconImageView = UIImageView()
    var feedTypeIconImageViewWidthConstraint = NSLayoutConstraint()
    var feedTypeIconImageViewHeightConstraint = NSLayoutConstraint()
    var feedTypeIconImageViewLeftConstraint = NSLayoutConstraint()
    var feedTypeIconImageViewYConstraint = NSLayoutConstraint()
    
    // Feed Type Label
    var feedTypeLabel = UILabel()
    var feedTypeLabelLeftConstraint = NSLayoutConstraint()
    var feedTypeLabelRightConstraint = NSLayoutConstraint()
    var feedTypeLabelYConstraint = NSLayoutConstraint()
    
    // Feed Type More Icon Image View
    var feedTypeMoreIconImage: UIImage?
    var feedTypeMoreIconImageView = UIImageView()
    var feedTypeMoreIconImageViewWidthConstraint = NSLayoutConstraint()
    var feedTypeMoreIconImageViewHeightConstraint = NSLayoutConstraint()
    var feedTypeMoreIconImageViewRightConstraint = NSLayoutConstraint()
    var feedTypeMoreIconImageViewYConstraint = NSLayoutConstraint()
    
    // Feed Type Button
    var feedTypeButton = UIButton()
    var feedTypeButtonLeftConstraint = NSLayoutConstraint()
    var feedTypeButtonRightConstraint = NSLayoutConstraint()
    var feedTypeButtonTopConstraint = NSLayoutConstraint()
    var feedTypeButtonBottomConstraint = NSLayoutConstraint()
    
    // Bottom Container View
    var bottomContainerView = UIView()
    var bottomContainerViewLeftConstraint = NSLayoutConstraint()
    var bottomContainerViewRightConstraint = NSLayoutConstraint()
    var bottomContainerViewBottomConstraint = NSLayoutConstraint()
    var bottomContainerViewTopConstraint = NSLayoutConstraint()
    
    // Pop Up Darken View
    var popUpDarkenView = UIView()
    
    // Pop Up View
    var popUpView = UIView()
    var popUpViewWidthConstraint = NSLayoutConstraint()
    var popUpViewHeightConstraint = NSLayoutConstraint()
    var popUpViewXConstraint = NSLayoutConstraint()
    var popUpViewYConstraint = NSLayoutConstraint()
    
    // Picker Container View
    var pickerContainerView = UIView()
    var pickerView = UIPickerView()
    var pickerContainerViewLeftConstraint = NSLayoutConstraint()
    var pickerContainerViewRightConstraint = NSLayoutConstraint()
    var pickerContainerViewBottomConstraint = NSLayoutConstraint()
    var pickerContainerViewTopConstraint = NSLayoutConstraint()
    
    // Picker Done Button Container View
    var pickerDoneButton = UIButton()
    var pickerDoneButtonBottomConstraint = NSLayoutConstraint()
    var pickerDoneButtonLeftConstraint = NSLayoutConstraint()
    var pickerDoneButtonRightConstraint = NSLayoutConstraint()
    var pickerDoneButtonHeightConstraint = NSLayoutConstraint()
    
    // View variables
    var topSafeArea = CGFloat()
    var bottomSafeArea = CGFloat()
    var viewHeight = CGFloat()
    var viewWidth = CGFloat()
    
    // Selected Picker
    var selectedPicker = 0
    
    // Arrays
    var selectedMediaTypeArray: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var selectedMediaTypeTextArray: [String] = ["Apple Music", "iTunes Music", "iOS Apps", "Mac Apps", "Audiobooks", "Books", "TV Shows", "Movies", "iTunes U", "Podcasts", "Music Videos"]
    var selectedMediaType = 0
    var selectedFeedTypeArray: [[Int]] = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16], [17, 18, 19, 20], [21], [22, 23], [24, 25], [26], [27], [28], [29]]
    var selectedFeedTypeTextArray: [String] = ["Coming Soon", "Hot Tracks", "New Releases", "Top Albums", "Top Songs", "Hot Tracks", "New Music", "Recent Releases", "Top Albums", "Top Songs", "New Apps We Love", "New Games We Love", "Top Free", "Top Free iPad", "Top Grossing", "Top Grossing Paid", "Top Paid", "Top Free Mac Apps", "Top Grossing Mac Apps", "Top Mac Apps", "Top Paid Mac Apps", "Top Audiobooks", "Top Free", "Top Paid", "Top TV Episodes", "Top TV Seasons", "Top Movies", "Top iTunes U Courses", "Top Podcasts", "Top Music Videos"]
    var selectedFeedType = 0
    var selectedFeedInRow = 0
    
    // Table View Data Source URL String
    var tableViewDataSourceURLString: String = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    
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
        else {
            topContainerViewHeightConstraint = topContainerView.heightAnchor.constraint(equalToConstant: topSafeArea + 208.0)
            topContainerViewWidthConstraint = topContainerView.widthAnchor.constraint(equalToConstant: viewWidth)
        }
        topContainerViewLeftConstraint = topContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        topContainerViewTopConstraint = topContainerView.topAnchor.constraint(equalTo: self.view.topAnchor)
        topContainerViewWidthConstraint.isActive = true
        topContainerViewHeightConstraint.isActive = true
        topContainerViewLeftConstraint.isActive = true
        topContainerViewTopConstraint.isActive = true
        
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
            mediaTypeContainerViewLeftConstraint = mediaTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: topSafeArea + 24.0)
            mediaTypeContainerViewRightConstraint = mediaTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24.0)
            mediaTypeContainerViewYConstraint = mediaTypeContainerView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: 0.0)
        }
        else {
            mediaTypeContainerViewLeftConstraint = mediaTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
            mediaTypeContainerViewRightConstraint = mediaTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24.0)
            mediaTypeContainerViewYConstraint = mediaTypeContainerView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: -((topSafeArea / 2.0) - 37.0))
        }
        mediaTypeContainerViewHeight = mediaTypeContainerView.heightAnchor.constraint(equalToConstant: 50.0)
        mediaTypeContainerViewLeftConstraint.isActive = true
        mediaTypeContainerViewRightConstraint.isActive = true
        mediaTypeContainerViewYConstraint.isActive = true
        mediaTypeContainerViewHeight.isActive = true
        
        // Set up media type icon image
        mediaTypeIconImage = UIImage(named: "MediaTypeIcon")
        mediaTypeIconImageView.contentMode = .scaleAspectFit
        mediaTypeIconImageView.image = mediaTypeIconImage
        mediaTypeIconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.mediaTypeContainerView.addSubview(mediaTypeIconImageView)
        mediaTypeIconImageViewLeftConstraint = mediaTypeIconImageView.leadingAnchor.constraint(equalTo: mediaTypeContainerView.leadingAnchor, constant: 16.0)
        mediaTypeIconImageViewYConstraint = mediaTypeIconImageView.centerYAnchor.constraint(equalTo: mediaTypeContainerView.centerYAnchor, constant: 0.0)
        mediaTypeIconImageViewWidthConstraint = mediaTypeIconImageView.widthAnchor.constraint(equalToConstant: 18.0)
        mediaTypeIconImageViewHeightConstraint = mediaTypeIconImageView.heightAnchor.constraint(equalToConstant: 18.0)
        mediaTypeIconImageViewLeftConstraint.isActive = true
        mediaTypeIconImageViewYConstraint.isActive = true
        mediaTypeIconImageViewWidthConstraint.isActive = true
        mediaTypeIconImageViewHeightConstraint.isActive = true
        
        // Set up media type down icon image
        mediaTypeMoreIconImage = UIImage(named: "MoreIcon")
        mediaTypeMoreIconImageView.contentMode = .scaleAspectFit
        mediaTypeMoreIconImageView.image = mediaTypeMoreIconImage
        mediaTypeMoreIconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.mediaTypeContainerView.addSubview(mediaTypeMoreIconImageView)
        mediaTypeMoreIconImageViewRightConstraint = mediaTypeMoreIconImageView.trailingAnchor.constraint(equalTo: mediaTypeContainerView.trailingAnchor, constant: -16.0)
        mediaTypeMoreIconImageViewYConstraint = mediaTypeMoreIconImageView.centerYAnchor.constraint(equalTo: mediaTypeContainerView.centerYAnchor, constant: 0.0)
        mediaTypeMoreIconImageViewWidthConstraint = mediaTypeMoreIconImageView.widthAnchor.constraint(equalToConstant: 14.0)
        mediaTypeMoreIconImageViewHeightConstraint = mediaTypeMoreIconImageView.heightAnchor.constraint(equalToConstant: 14.0)
        mediaTypeMoreIconImageViewRightConstraint.isActive = true
        mediaTypeMoreIconImageViewYConstraint.isActive = true
        mediaTypeMoreIconImageViewWidthConstraint.isActive = true
        mediaTypeMoreIconImageViewHeightConstraint.isActive = true
        
        // Set up media type label:
        mediaTypeLabel.text = "Apple Music"
        mediaTypeLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        mediaTypeLabel.textColor = UIColor.white
        mediaTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mediaTypeContainerView.addSubview(mediaTypeLabel)
        mediaTypeLabelLeftConstraint = mediaTypeLabel.leadingAnchor.constraint(equalTo: mediaTypeIconImageView.trailingAnchor, constant: 8.0)
        mediaTypeLabelRightConstraint = mediaTypeLabel.trailingAnchor.constraint(equalTo: mediaTypeMoreIconImageView.leadingAnchor, constant: -8.0)
        mediaTypeLabelYConstraint = mediaTypeLabel.centerYAnchor.constraint(equalTo: mediaTypeContainerView.centerYAnchor, constant: 0.0)
        mediaTypeLabelLeftConstraint.isActive = true
        mediaTypeLabelRightConstraint.isActive = true
        mediaTypeLabelYConstraint.isActive = true
        
        // Set up media type button:
        mediaTypeButton.setTitle("", for: .normal)
        mediaTypeButton.addTarget(self, action: #selector(mediaTypeButtonAction), for: .touchUpInside)
        mediaTypeButton.translatesAutoresizingMaskIntoConstraints = false
        self.mediaTypeContainerView.addSubview(mediaTypeButton)
        self.mediaTypeContainerView.bringSubviewToFront(mediaTypeButton)
        mediaTypeButtonLeftConstraint = mediaTypeButton.leadingAnchor.constraint(equalTo: mediaTypeContainerView.leadingAnchor, constant: 0.0)
        mediaTypeButtonRightConstraint = mediaTypeButton.trailingAnchor.constraint(equalTo: mediaTypeContainerView.trailingAnchor, constant: 0.0)
        mediaTypeButtonTopConstraint = mediaTypeButton.topAnchor.constraint(equalTo: mediaTypeContainerView.topAnchor, constant: 0.0)
        mediaTypeButtonBottomConstraint = mediaTypeButton.bottomAnchor.constraint(equalTo: mediaTypeContainerView.bottomAnchor, constant: 0.0)
        mediaTypeButtonLeftConstraint.isActive = true
        mediaTypeButtonRightConstraint.isActive = true
        mediaTypeButtonTopConstraint.isActive = true
        mediaTypeButtonBottomConstraint.isActive = true
        
        // Set up title label:
        titleLabel.text = "iTunes Viewer"
        titleLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.topContainerView.addSubview(titleLabel)
        if (UIDevice.current.orientation.isPortrait) {
            titleLabelLeftConstraint = titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
        }
        else if (UIDevice.current.orientation.isLandscape) {
            titleLabelLeftConstraint = titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: topSafeArea + 24.0)
        }
        else {
            titleLabelLeftConstraint = titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
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
            feedTypeContainerViewLeftConstraint = feedTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: topSafeArea + 24.0)
            feedTypeContainerViewRightConstraint = feedTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24.0)
        }
        else {
            feedTypeContainerViewLeftConstraint = feedTypeContainerView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 24.0)
            feedTypeContainerViewRightConstraint = feedTypeContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24.0)
        }
        feedTypeContainerViewHeight = feedTypeContainerView.heightAnchor.constraint(equalToConstant: 50.0)
        feedTypeContainerViewTopConstraint = feedTypeContainerView.topAnchor.constraint(equalTo: mediaTypeContainerView.bottomAnchor, constant: 8.0)
        feedTypeContainerViewLeftConstraint.isActive = true
        feedTypeContainerViewRightConstraint.isActive = true
        feedTypeContainerViewTopConstraint.isActive = true
        feedTypeContainerViewHeight.isActive = true
        
        // Set up feed type icon image
        feedTypeIconImage = UIImage(named: "FeedTypeIcon")
        feedTypeIconImageView.contentMode = .scaleAspectFit
        feedTypeIconImageView.image = feedTypeIconImage
        feedTypeIconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.feedTypeContainerView.addSubview(feedTypeIconImageView)
        feedTypeIconImageViewLeftConstraint = feedTypeIconImageView.leadingAnchor.constraint(equalTo: feedTypeContainerView.leadingAnchor, constant: 16.0)
        feedTypeIconImageViewYConstraint = feedTypeIconImageView.centerYAnchor.constraint(equalTo: feedTypeContainerView.centerYAnchor, constant: 0.0)
        feedTypeIconImageViewWidthConstraint = feedTypeIconImageView.widthAnchor.constraint(equalToConstant: 18.0)
        feedTypeIconImageViewHeightConstraint = feedTypeIconImageView.heightAnchor.constraint(equalToConstant: 18.0)
        feedTypeIconImageViewLeftConstraint.isActive = true
        feedTypeIconImageViewYConstraint.isActive = true
        feedTypeIconImageViewWidthConstraint.isActive = true
        feedTypeIconImageViewHeightConstraint.isActive = true
        
        // Set up feed type down icon image
        feedTypeMoreIconImage = UIImage(named: "MoreIcon")
        feedTypeMoreIconImageView.contentMode = .scaleAspectFit
        feedTypeMoreIconImageView.image = feedTypeMoreIconImage
        feedTypeMoreIconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.feedTypeContainerView.addSubview(feedTypeMoreIconImageView)
        feedTypeMoreIconImageViewRightConstraint = feedTypeMoreIconImageView.trailingAnchor.constraint(equalTo: feedTypeContainerView.trailingAnchor, constant: -16.0)
        feedTypeMoreIconImageViewYConstraint = feedTypeMoreIconImageView.centerYAnchor.constraint(equalTo: feedTypeContainerView.centerYAnchor, constant: 0.0)
        feedTypeMoreIconImageViewWidthConstraint = feedTypeMoreIconImageView.widthAnchor.constraint(equalToConstant: 14.0)
        feedTypeMoreIconImageViewHeightConstraint = feedTypeMoreIconImageView.heightAnchor.constraint(equalToConstant: 14.0)
        feedTypeMoreIconImageViewRightConstraint.isActive = true
        feedTypeMoreIconImageViewYConstraint.isActive = true
        feedTypeMoreIconImageViewWidthConstraint.isActive = true
        feedTypeMoreIconImageViewHeightConstraint.isActive = true
        
        // Set up feed type label:
        feedTypeLabel.text = "Coming Soon"
        feedTypeLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        feedTypeLabel.textColor = UIColor.white
        feedTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.feedTypeContainerView.addSubview(feedTypeLabel)
        feedTypeLabelLeftConstraint = feedTypeLabel.leadingAnchor.constraint(equalTo: feedTypeIconImageView.trailingAnchor, constant: 8.0)
        feedTypeLabelRightConstraint = feedTypeLabel.trailingAnchor.constraint(equalTo: feedTypeMoreIconImageView.leadingAnchor, constant: -8.0)
        feedTypeLabelYConstraint = feedTypeLabel.centerYAnchor.constraint(equalTo: feedTypeContainerView.centerYAnchor, constant: 0.0)
        feedTypeLabelLeftConstraint.isActive = true
        feedTypeLabelRightConstraint.isActive = true
        feedTypeLabelYConstraint.isActive = true
        
        // Set up feed type button:
        feedTypeButton.setTitle("", for: .normal)
        feedTypeButton.addTarget(self, action: #selector(feedTypeButtonAction), for: .touchUpInside)
        feedTypeButton.translatesAutoresizingMaskIntoConstraints = false
        self.feedTypeContainerView.addSubview(feedTypeButton)
        self.feedTypeContainerView.bringSubviewToFront(feedTypeButton)
        feedTypeButtonLeftConstraint = feedTypeButton.leadingAnchor.constraint(equalTo: feedTypeContainerView.leadingAnchor, constant: 0.0)
        feedTypeButtonRightConstraint = feedTypeButton.trailingAnchor.constraint(equalTo: feedTypeContainerView.trailingAnchor, constant: 0.0)
        feedTypeButtonTopConstraint = feedTypeButton.topAnchor.constraint(equalTo: feedTypeContainerView.topAnchor, constant: 0.0)
        feedTypeButtonBottomConstraint = feedTypeButton.bottomAnchor.constraint(equalTo: feedTypeContainerView.bottomAnchor, constant: 0.0)
        feedTypeButtonLeftConstraint.isActive = true
        feedTypeButtonRightConstraint.isActive = true
        feedTypeButtonTopConstraint.isActive = true
        feedTypeButtonBottomConstraint.isActive = true
        
        // Set up bottom container view:
//        bottomContainerView.backgroundColor = UIColor.blue
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bottomContainerView)
        self.view.sendSubviewToBack(bottomContainerView)
        if (UIDevice.current.orientation.isPortrait) {
            bottomContainerViewLeftConstraint = bottomContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24.0)
            bottomContainerViewRightConstraint = bottomContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24.0)
            bottomContainerViewTopConstraint = bottomContainerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -(topSafeArea + 208.0))
            bottomContainerViewBottomConstraint = bottomContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0)
        }
        else if (UIDevice.current.orientation.isLandscape) {
            
        }
        else {
            bottomContainerViewLeftConstraint = bottomContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24.0)
            bottomContainerViewRightConstraint = bottomContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24.0)
            bottomContainerViewTopConstraint = bottomContainerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -(topSafeArea + 208.0))
            bottomContainerViewBottomConstraint = bottomContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0)
        }
        bottomContainerViewLeftConstraint.isActive = true
        bottomContainerViewRightConstraint.isActive = true
        bottomContainerViewTopConstraint.isActive = true
        bottomContainerViewBottomConstraint.isActive = true
        
        // Set up pop up darken view:
        popUpDarkenView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        popUpDarkenView.alpha = 0.0
        popUpDarkenView.frame = self.view.frame
        popUpDarkenView.center = self.view.center
        self.view.addSubview(popUpDarkenView)
        self.view.bringSubviewToFront(popUpDarkenView)
        
        // Set up pop up view:
        popUpView.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.0)
        popUpView.layer.cornerRadius = 25.0
        popUpView.clipsToBounds = true
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(popUpView)
        self.view.bringSubviewToFront(popUpView)
        popUpViewWidthConstraint = popUpView.widthAnchor.constraint(equalToConstant: (viewWidth - 48.0))
        popUpViewHeightConstraint = popUpView.heightAnchor.constraint(equalToConstant: (viewWidth - 48.0))
        popUpViewXConstraint = popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0)
        popUpViewYConstraint = popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0.0)
        popUpViewWidthConstraint.isActive = true
        popUpViewHeightConstraint.isActive = true
        popUpViewXConstraint.isActive = true
        popUpViewYConstraint.isActive = true
        popUpView.transform = CGAffineTransform.identity.scaledBy(x: 0.0, y: 0.0)
        
        // Set up picker container view:
        pickerContainerView.translatesAutoresizingMaskIntoConstraints = false
        pickerContainerView.clipsToBounds = true
        self.popUpView.addSubview(pickerContainerView)
        pickerContainerViewLeftConstraint = pickerContainerView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 0.0)
        pickerContainerViewRightConstraint = pickerContainerView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: 0.0)
        pickerContainerViewTopConstraint = pickerContainerView.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 0.0)
        pickerContainerViewBottomConstraint = pickerContainerView.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: 60.0)
        pickerContainerViewLeftConstraint.isActive = true
        pickerContainerViewRightConstraint.isActive = true
        pickerContainerViewBottomConstraint.isActive = true
        pickerContainerViewTopConstraint.isActive = true
        
        // Set up picker done button:
        pickerDoneButton.setTitle("", for: .normal)
        pickerDoneButton.addTarget(self, action: #selector(pickerDoneButtonAction), for: .touchUpInside)
        pickerDoneButton.setBackgroundImage(UIImage(named: "LaunchGradientBG"), for: .normal)
        pickerDoneButton.setTitle("Done", for: .normal)
        pickerDoneButton.setTitleColor(UIColor.white, for: .normal)
        pickerDoneButton.translatesAutoresizingMaskIntoConstraints = false
        self.popUpView.addSubview(pickerDoneButton)
        self.popUpView.bringSubviewToFront(pickerDoneButton)
        pickerDoneButtonLeftConstraint = pickerDoneButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 0.0)
        pickerDoneButtonRightConstraint = pickerDoneButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: 0.0)
        pickerDoneButtonBottomConstraint = pickerDoneButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: 0.0)
        pickerDoneButtonHeightConstraint = pickerDoneButton.heightAnchor.constraint(equalToConstant: 60.0)
        pickerDoneButtonLeftConstraint.isActive = true
        pickerDoneButtonRightConstraint.isActive = true
        pickerDoneButtonBottomConstraint.isActive = true
        pickerDoneButtonHeightConstraint.isActive = true
        
        // Set up picker view:
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.frame.size.height = (viewWidth - 48.0) - 60.0
        self.pickerContainerView.addSubview(pickerView)
        
    }
    
    // View did appear
    override func viewDidAppear(_ animated: Bool) {
        updateURL()
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
        }, completion: nil)
    }
    
    // Media Type Button Action
    @objc func mediaTypeButtonAction(sender: UIButton!) {
        if (selectedPicker != 0) {
            selectedPicker = 0
            pickerView.reloadAllComponents()
            pickerView.selectRow(selectedMediaType, inComponent: 0, animated: false)
        }
        UIView.animate(
            withDuration: 0.15,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                self.popUpDarkenView.alpha = 1.0
        }, completion: nil)
        UIView.animate(
            withDuration: 0.45,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.0,
            animations: {
                self.popUpView.transform = CGAffineTransform.identity
        },  completion: nil)
    }
    
    // Feed Type Button Action
    @objc func feedTypeButtonAction(sender: UIButton!) {
        if (selectedPicker != 1) {
            selectedPicker = 1
            pickerView.reloadAllComponents()
            pickerView.selectRow(selectedFeedInRow, inComponent: 0, animated: false)
        }
        UIView.animate(
            withDuration: 0.15,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                self.popUpDarkenView.alpha = 1.0
        }, completion: nil)
        UIView.animate(
            withDuration: 0.45,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.0,
            animations: {
                self.popUpView.transform = CGAffineTransform.identity
        },  completion: nil)
        
    }
    
    // Picker Done Button Action
    @objc func pickerDoneButtonAction(sender: UIButton!) {
        UIView.animate(
            withDuration: 0.15,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                self.popUpDarkenView.alpha = 0.0
                self.popUpView.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
        }, completion: nil)
        updateURL()
    }
    
    // Picker view number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Picker view number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (selectedPicker == 0) {
            return selectedMediaTypeTextArray.count
        }
        else {
            return selectedFeedTypeArray[selectedMediaType].count
        }
    }
    
    // Picker view row height
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    
    // Picker view view for row:
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var titleLabel: UILabel? = (view as? UILabel)
        if titleLabel == nil {
            titleLabel = UILabel()
            titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
            titleLabel?.textAlignment = .center
        }
        titleLabel?.textColor = UIColor.black
        
        if (selectedPicker == 0) {
            titleLabel?.text = selectedMediaTypeTextArray[row]
        }
        else {
            titleLabel?.text = selectedFeedTypeTextArray[selectedFeedTypeArray[selectedMediaType][row]]
        }
        
        return titleLabel!
    }
    
    // Picker view did select row:
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (selectedPicker == 0) {
            selectedMediaType = row
            selectedFeedInRow = 0
            mediaTypeLabel.text = selectedMediaTypeTextArray[selectedMediaType]
            feedTypeLabel.text = selectedFeedTypeTextArray[selectedFeedTypeArray[selectedMediaType][0]]
        }
        else {
            selectedFeedType = selectedFeedTypeArray[selectedMediaType][row]
            selectedFeedInRow = row
            feedTypeLabel.text = selectedFeedTypeTextArray[selectedFeedType]
        }
    }
    
    // Set status bar style.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Update URL
    func updateURL() {
        if (mediaTypeLabel.text != nil && feedTypeLabel.text != nil) {
            tableViewDataSourceURLString = "https://rss.itunes.apple.com/api/v1/us/" + (mediaTypeLabel.text?.lowercased().replacingOccurrences(of: " ", with: "-"))! + "/" + (feedTypeLabel.text?.lowercased().replacingOccurrences(of: " ", with: "-"))! + "/all/10/explicit.json"
        }
    }
 
}
