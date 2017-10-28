//
//  SafeAreaViewController.swift
//  AutoLayout_Practice
//
//  Created by commany_mac on 2017. 10. 27..
//  Copyright © 2017년 CommanyShin. All rights reserved.
//

import UIKit

class SafeAreaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

	private let greenView = UIView()
	
	private func setupView() {
		// greenView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
		greenView.translatesAutoresizingMaskIntoConstraints = false
		greenView.backgroundColor = .green
		view.addSubview(greenView)
		
		var guide: UILayoutGuide
		
		if #available(iOS 11, *) {
			guide = view.safeAreaLayoutGuide
		} else {
			guide = view.layoutMarginsGuide
		}
		
		NSLayoutConstraint.activate([
			greenView.topAnchor.constraint(equalTo: guide.topAnchor,constant: 10),
			greenView.bottomAnchor.constraint(equalTo: guide.bottomAnchor,constant: -10),
			greenView.leftAnchor.constraint(equalTo: guide.leftAnchor,constant: 10),
			greenView.rightAnchor.constraint(equalTo: guide.rightAnchor,constant: -10)
			])
		
		
		/*
		let	margins = view.layoutMarginsGuide
		NSLayoutConstraint.activate([
			greenView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
			greenView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
			])
		
		
		if #available(iOS 11, *) {
			let guide = view.safeAreaLayoutGuide
			NSLayoutConstraint.activate([
				greenView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
				guide.bottomAnchor.constraintEqualToSystemSpacingBelow(greenView.bottomAnchor, multiplier: 1.0)
				])

		} else {
			let standardSpacing: CGFloat = 8.0
			NSLayoutConstraint.activate([
				greenView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
				bottomLayoutGuide.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: standardSpacing)
				])
		}
		*/
	}
}
