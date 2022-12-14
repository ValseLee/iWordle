//
//  extensions.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import Foundation
import UIKit
import JGProgressHUD

extension UIView {
	enum AnchorTo {
		case top(padding: CGFloat, isToSafeArea: Bool)
		case bottom(padding: CGFloat, isToSafeArea: Bool)
		case leading(padding: CGFloat, isToSafeArea: Bool)
		case trailing(padding: CGFloat, isToSafeArea: Bool)
	}
	
	func setAnchor(anchorTo: [AnchorTo], inView view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		anchorTo.forEach { direction in
			switch direction {
				case .top(let padding, let isToSafeArea):
					if isToSafeArea {
						self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
					} else {
						self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
					}
					break
				case .bottom(let padding, let isToSafeArea):
					if isToSafeArea {
						self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding).isActive = true
					} else {
						self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
					}
					break
				case .leading(let padding, let isToSafeArea):
					if isToSafeArea {
						self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
					} else {
						self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
					}
					break
				case .trailing(let padding, let isToSafeArea):
					if isToSafeArea {
						self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
					} else {
						self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
					}
					break
			}
		}
	}
	
	func setAnchorTRBL(
		top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
		paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0) {
			
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
	static let hud = JGProgressHUD(style: .dark)
	
	func showLoader(_ show: Bool, withText text: String?) {
		view.endEditing(true)
		UIViewController.hud.textLabel.text = text ?? ""
		UIViewController.hud.vibrancyEnabled = true
		UIViewController.hud.shadow = JGProgressHUDShadow(color: .black, offset: .zero, radius: 5.0, opacity: 0.2)
		
		if show {
			UIViewController.hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
			UIViewController.hud.show(in: self.view)
		} else {
			UIViewController.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
			UIViewController.hud.dismiss(afterDelay: 0.65, animated: true)
		}
	}
	
	func configNavBarUI(withTitle title: String, prefersLargerTitle: Bool, isHidden: Bool) {
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
		appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
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
	
	func configUICollectionView(inViewController viewController: UIViewController,
								inView view: UIView,
								output: inout UICollectionView?) {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(
			width: view.frame.size.width / 6,
			height: view.frame.size.width / 6)
		flowLayout.minimumLineSpacing = 5
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 25, bottom: 0, right: 25)
		
		output = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		guard let output = output else { return }
		view.addSubview(output)
		output.backgroundColor = .white
		output.showsVerticalScrollIndicator = false
		output.showsHorizontalScrollIndicator = false
	}
}

// MARK: Error 처리
enum NetworkError: Error {
	case networkingError
	case dataError
	case parseError
	case requestError
}

// MARK: NotificationCenter Name Extension
extension NSNotification.Name {
	static var textChanged: Notification.Name {
		return .init(rawValue: "textChanged")
	}
	
	static var userWin: Notification.Name {
		return .init(rawValue: "userWin")
	}
	
	static var userLose: Notification.Name {
		return .init(rawValue: "userLose")
	}
}

// MARK: Dependency
protocol WordInteractorDependency {
	static var wordInteractorManager: WordInteractor { get }
}
