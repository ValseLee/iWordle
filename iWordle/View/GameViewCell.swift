//
//  GameViewCell.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class GameViewCell: UICollectionViewCell {
	
	public let chracterTextField: UITextField = {
		let tf = UITextField()
		tf.backgroundColor = .systemGray4
		tf.layer.borderColor = UIColor.black.cgColor
		tf.layer.borderWidth = 0.5
		tf.font = UIFont.boldSystemFont(ofSize: 16)
		tf.autocapitalizationType = .allCharacters
		tf.autocorrectionType = .no
		tf.keyboardType = .alphabet
		tf.textAlignment = .center
		return tf
	}()
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configUI() {
		addSubview(chracterTextField)
		chracterTextField.delegate = self
		chracterTextField.setAnchorTRBL(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor)
	}
}

extension GameViewCell: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		guard let textFieldText = textField.text,
			  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
			return false
		}
		let substringToReplace = textFieldText[rangeOfTextToReplace]
		let count = textFieldText.count - substringToReplace.count + string.count
		return count <= 1
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		guard let str = textField.text else { return }
		if str != "" {
			chracterTextField.isUserInteractionEnabled = false
		}
		
		NotificationCenter.default.post(name: .textChanged,
										object: (self, str),
										userInfo: nil)
	}
}

