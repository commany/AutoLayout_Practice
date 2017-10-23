//
//  AutoLayoutLandscapeViewController.swift
//  AutoLayout_Practice
//
//  Created by commany_mac on 2017. 10. 23..
//  Copyright © 2017년 CommanyShin. All rights reserved.
//

import UIKit

extension UIColor {
	static var pink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class AutoLayoutLandscapeViewController: UIViewController {

	// -------------------------------------------
	// Declaration for topImageContainerView
	// -------------------------------------------
	let topImageContainerView: UIView = {
		let containerView = UIView()
		containerView.backgroundColor = UIColor.clear
		containerView.translatesAutoresizingMaskIntoConstraints = false
		return containerView
	}()
	
	// -------------------------------------------
	// Declaration for titleImageView
	// -------------------------------------------
	let titleImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "monster"))
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	// -------------------------------------------
	// Define for descriptionTextView
	// -------------------------------------------
	let descriptionTextView: UITextView = {
		let textView = UITextView()
		var attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!",
		                                               attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
		attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
		                                         attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),
		                                                      NSAttributedStringKey.foregroundColor:UIColor.gray]))
		textView.attributedText = attributedText
		// textView.text = "Join us today in our fun and games!"
		// textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.textAlignment = NSTextAlignment.center
		textView.isEditable = false
		textView.isScrollEnabled = false
		return textView
	}()
	
	// -------------------------------------------
	// Define for previousButton
	// -------------------------------------------
	private let previousButton: UIButton = {
		let button = UIButton(type: UIButtonType.system)
		button.setTitle("PREV", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		button.tintColor = .gray
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	// -------------------------------------------
	// Define for nextButton
	// -------------------------------------------
	private let nextButton: UIButton = {
		let button = UIButton(type: UIButtonType.system)
		button.setTitle("NEXT", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		// let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
		button.setTitleColor(.pink, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	// -------------------------------------------
	// Define for pageControl
	// -------------------------------------------
	private let pageControl: UIPageControl = {
		let pageControl = UIPageControl()
		pageControl.numberOfPages = 4
		pageControl.currentPage = 0
		pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
		// pageControl.currentPageIndicatorTintColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
		pageControl.currentPageIndicatorTintColor = .pink
		return pageControl
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(topImageContainerView)
		self.topImageContainerView.addSubview(titleImageView)
		self.view.addSubview(descriptionTextView)
		
		setupBottomControls()
		setupLayout()
	}
	
	fileprivate func setupBottomControls() {
		let bottomControlsStackView = UIStackView(arrangedSubviews: [
			previousButton, pageControl, nextButton
			])
		bottomControlsStackView.distribution = .fillEqually
		bottomControlsStackView.axis = .horizontal
		bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(bottomControlsStackView)

		NSLayoutConstraint.activate([
			bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
			])
	}
	
	func setupLayout() {
		// -------------------------------------------
		// Contraint for topImageContainerView
		// -------------------------------------------
		topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
		
		// -------------------------------------------
		// Contraint for titleImageView
		// -------------------------------------------
		titleImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
		//-- imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		titleImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
		titleImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
		titleImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
		
		// -------------------------------------------
		// Contraint for descriptionTextView
		// -------------------------------------------
		descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
		descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
		descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
		descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
	}
}
