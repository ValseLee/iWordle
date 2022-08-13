//
//  GameViewController.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class GameViewController: UIViewController {
	
	private let lineView = LineView()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		configNavBarUI(withTitle: "iWordle!", prefersLargerTitle: true, isHidden: false)
		navigationController?.navigationBar.barStyle = .black
		
		configUI()
    }

	func configUI() {
		configLineView()
		configGameView()
	}
	
	func configLineView() {
		view.addSubview(lineView)
		lineView.setCenterX(inView: view)
		lineView.setAnchorTRBL(top: view.safeAreaLayoutGuide.topAnchor,
								paddingTop: 0)
		lineView.backgroundColor = .brown
		lineView.setSize(height: 100, width: view.frame.width)
	}
	
	func configGameView() {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(
			width: view.frame.size.width / 5,
			height: view.frame.size.width / 5
		)
		flowLayout.minimumLineSpacing = 5
		flowLayout.minimumInteritemSpacing = 0

		let gameCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		view.addSubview(gameCollectionView)
		gameCollectionView.dataSource = self
		gameCollectionView.delegate = self

		gameCollectionView.backgroundColor = .white
		gameCollectionView.register(GameViewCell.self, forCellWithReuseIdentifier: "Cell")
		gameCollectionView.showsVerticalScrollIndicator = false
		gameCollectionView.showsHorizontalScrollIndicator = false
		gameCollectionView.backgroundColor = .white
		gameCollectionView.setAnchorTRBL(
			top: lineView.bottomAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor,
			paddingTop: 10, paddingBottom: 10)
	}

}

extension GameViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 25
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
