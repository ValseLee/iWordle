//
//  GameViewController.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class GameViewController: UIViewController {
	
	private let gameViewCell = GameViewCell()
	private let gameKeyWordView = GameKeyWordView()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		configNavBarUI(withTitle: "iWordle!", prefersLargerTitle: false, isHidden: false)
		navigationController?.navigationBar.barStyle = .black
		
		configUI()
    }

	func configUI() {
		configGameKeyWordView()
		configGameView()
	}
	
	func configGameKeyWordView() {
		view.addSubview(gameKeyWordView)
		gameKeyWordView.setCenterX(inView: view)
		gameKeyWordView.setAnchorTRBL(top: view.safeAreaLayoutGuide.topAnchor,
								paddingTop: 0)
		gameKeyWordView.setSize(height: 100, width: view.frame.width)
	}
	
	func configGameView() {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.estimatedItemSize = CGSize(
			width: view.frame.size.width / 6,
			height: view.frame.size.width / 6
		)
		flowLayout.minimumLineSpacing = 5
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
		
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
			top: gameKeyWordView.bottomAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor,
			paddingTop: 10, paddingBottom: -10)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
}

extension GameViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 25
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GameViewCell
		cell.chracterTextView.textContainerInset = .init(
			top: cell.frame.size.height / 3, left: 0,
			bottom: 0, right: 0)
		return cell
	}
}

extension GameViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(#function, indexPath.row)
	}
}
