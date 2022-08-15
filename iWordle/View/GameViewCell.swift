//
//  GameViewCell.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

// MARK: 뷰가 아니라 뷰컨인줄. 구현 끝나면 분리 필요
final class GameViewCell: UICollectionViewCell {
	
	private var textCheck: String? {
		didSet {
			if textCheck != "" {
				chracterTextView.isUserInteractionEnabled = false
			}
		}
	}
	
	public let chracterTextView: UITextView = {
		let tv = UITextView()
		tv.backgroundColor = .systemGray4
		tv.layer.borderColor = UIColor.black.cgColor
		tv.layer.borderWidth = 0.5
		tv.font = UIFont.boldSystemFont(ofSize: 16)
		tv.autocapitalizationType = .allCharacters
		tv.autocorrectionType = .no
		tv.keyboardType = .alphabet
		tv.textAlignment = .center
		return tv
	}()
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configUI()
		chracterTextView.delegate = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configUI() {
		addSubview(chracterTextView)
		chracterTextView.setAnchorTRBL(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor)
	}
}

extension GameViewCell: UITextViewDelegate {
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		guard let str = textView.text else { return true }
		let maxLength = str.count + text.count - range.length
		return maxLength <= 1
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		guard let str = textView.text else { return }
		textCheck = str
		Words.shared.userInput += textCheck!
		print(Words.shared.userInput)
		Words.shared.checkUsersInput()
	}
}

