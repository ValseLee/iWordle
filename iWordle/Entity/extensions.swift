//
//  extensions.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import Foundation
import UIKit

extension UIView {
	func setAnchorTRBL(top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0) {
			
		translatesAutoresizingMaskIntoConstraints = false
		
		if let top = top {
			topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
		}
		
		if let right = right {
			rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
		}
		
		if let bottom = bottom {
			bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
		}
		
		if let left = left {
			leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
		}
	}
	
	func setSize(height: CGFloat, width: CGFloat) {
		translatesAutoresizingMaskIntoConstraints = false
		heightAnchor.constraint(equalToConstant: height).isActive = true
		widthAnchor.constraint(equalToConstant: width).isActive = true
	}
	
	func setCenterY(inView view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	func setCenterX(inView view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
}

extension UIViewController {
	func configNavBarUI(withTitle title: String, prefersLargerTitle: Bool, isHidden: Bool) {
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
		appearance.backgroundColor = .clear
		
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.compactAppearance = appearance
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
		
		navigationController?.navigationBar.prefersLargeTitles = prefersLargerTitle
		navigationController?.navigationBar.tintColor = .black
		navigationController?.navigationBar.isTranslucent = true
		
		navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
		navigationController?.navigationBar.isHidden = isHidden
		navigationItem.title = title
	}
}
