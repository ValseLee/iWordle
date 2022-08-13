//
//  LineView.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/12.
//

import UIKit

final class GameKeyWordView: UIView {
	private let gameWordLabel: UILabel = {
		let tl = UILabel()
		// MARK: 나중에 API로 받아온 텍스트로 변경
		tl.text = "CLEAR".uppercased()
		tl.font = UIFont.boldSystemFont(ofSize: 24)
		tl.textColor = .black
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
		backgroundColor = .white
		configGameWordLabel()
	}
	
	func configGameWordLabel() {
		addSubview(gameWordLabel)
		gameWordLabel.setAnchor(anchorTo: [.top(padding: 10, isToSafeArea: true),
										   .bottom(padding: 10, isToSafeArea: false)],
								inView: self)
		gameWordLabel.setCenterX(inView: self)
	}
}
