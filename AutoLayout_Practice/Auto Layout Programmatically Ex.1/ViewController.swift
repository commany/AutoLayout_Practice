//
//  ViewController.swift
//  AutoLayout_Practice
//
//  Created by commany_mac on 2017. 10. 22..
//  Copyright © 2017년 CommanyShin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// -------------------------------------------
	// Declaration for titleImageView
	// -------------------------------------------
	let titleImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "monster"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	// -------------------------------------------
	// Define for descriptionTextView
	// -------------------------------------------
	let descriptionTextView: UITextView = {
		let textView = UITextView()
		textView.text = "Join us today in our fun and games!"
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = NSTextAlignment.center
		textView.isEditable = false
		textView.isScrollEnabled = false
		return textView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(titleImageView)
		self.view.addSubview(descriptionTextView)
		
		setupLayout()
	}

	func setupLayout() {
		// -------------------------------------------
		// Contraint for titleImageView
		// -------------------------------------------
		titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		//-- imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		titleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
		titleImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		titleImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		
		// -------------------------------------------
		// Contraint for descriptionTextView
		// -------------------------------------------
		descriptionTextView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 120).isActive = true
		descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
	}


}

