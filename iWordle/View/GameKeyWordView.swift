//
//  LineView.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/12.
//
//  이 뷰는 CollectionView의 헤더를 만들면 없앨 수 있다.
//  그렇게 해야 여기서의 싱글톤 참조를 지울 수 있다 과도한 참조는 좋지 않다.

import UIKit

final class GameKeyWordView: UIView {
	private let gameWordLabel: UILabel = {
		let tl = UILabel()
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
	
	func configGameWord() {
		DispatchQueue.main.async {
			self.gameWordLabel.text = WordInteractor.shared.apiWord
		}
	}
}
