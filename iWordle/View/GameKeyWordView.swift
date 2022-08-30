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
		tl.font = UIFont.boldSystemFont(ofSize: 24)
		tl.text = "?????"
		tl.textColor = .black
		return tl
	}()
	
	private let subLabel: UILabel = {
		let la = UILabel()
		la.font = UIFont.boldSystemFont(ofSize: 16)
		la.textColor = .black
		return la
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Need Config UI
	private func configUI() {
		backgroundColor = .white
		configGameWordLabel()
		configSubLabel()
	}
	
	private func configGameWordLabel() {
		addSubview(gameWordLabel)
		gameWordLabel.setAnchor(anchorTo: [.top(padding: 10, isToSafeArea: true),
										   .bottom(padding: 10, isToSafeArea: false)],
								inView: self)
		gameWordLabel.setCenterX(inView: self)
	}
	
	private func configSubLabel() {
		addSubview(subLabel)
		subLabel.setAnchor(anchorTo: [.bottom(padding: 10, isToSafeArea: false)],
						   inView: self)
		subLabel.setCenterX(inView: self)
	}
	
	func setAnswerWord(answer: String) {
		gameWordLabel.text = answer
	}
	
	func setSubLabel(hasWon: Bool) {
		if hasWon == true {
			subLabel.text = "Conglatulations!✨"
		} else if hasWon == false {
			subLabel.text = "Maybe Next Time..👋🏻"
		}
	}
	
	func resetKeyWordView() {
		gameWordLabel.text = "?????"
		subLabel.text = ""
	}
}
