//
//  LineView.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/12.
//

import UIKit

final class GameKeyWordView: UIView {
	
	private let imageEx: UIImageView = {
		let image = UIImageView()
		image.backgroundColor = .brown
		return image
	}()
	
	private let mainTextLabel: UILabel = {
		let tl = UILabel()
		tl.text = "the word is here"
		return tl
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Need Config UI
	func configUI() {
		addSubview(imageEx)
		imageEx.setCenterY(inView: self)
		imageEx.setCenterX(inView: self)
		imageEx.setSize(height: 50, width: 50)
	}
}
