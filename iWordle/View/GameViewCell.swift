//
//  GameViewCell.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class GameViewCell: UICollectionViewCell {
	
	private let imageView: UIImageView = {
		let iv = UIImageView()
		iv.backgroundColor = .red
		return iv
	}()
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(imageView)
		imageView.setAnchorTRBL(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor,
								paddingTop: 10, paddingRight: 10, paddingBottom: 10, paddingLeft: 10)
		imageView.setSize(height: 10, width: 10)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
