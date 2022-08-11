//
//  GameViewController.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class GameViewController: UIViewController {
	
	private let gameView = GameViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemGray4
		configGameViewCell()
    }
	
	func configGameViewCell() {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(width: 30, height: 30)
		flowLayout.minimumLineSpacing = 10
		flowLayout.minimumInteritemSpacing = 10
		flowLayout.collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		
		let gameCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		gameCollectionView.dataSource = self
		gameCollectionView.delegate = self
		
		gameCollectionView.backgroundColor = .white
		gameCollectionView.register(GameViewCell.self, forCellWithReuseIdentifier: "Cell")
		gameCollectionView.showsVerticalScrollIndicator = false
		gameCollectionView.showsHorizontalScrollIndicator = false
		gameCollectionView.backgroundColor = .white
		view.addSubview(gameCollectionView)
	}
	
}

extension GameViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GameViewCell
		return cell
	}
}

extension GameViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(#function, indexPath.row)
	}
}
