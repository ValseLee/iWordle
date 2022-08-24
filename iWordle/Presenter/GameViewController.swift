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
	private var gameView: UICollectionView?
	
	// MARK: Singleton Manager
	private var wordManager: WordInteractor?

	// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		wordManager = SceneDelegate.wordInteractorManager
		view.backgroundColor = .white
		configUI()
		setNotificationCenter()
    }
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		gameKeyWordView.configGameWord()
	}
	
	// MARK: Methods
	func configUI() {
		configNavBarUI(withTitle: "iWordle!", prefersLargerTitle: false, isHidden: false)
		navigationController?.navigationBar.barStyle = .black
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
		flowLayout.itemSize = CGSize(
			width: view.frame.size.width / 6,
			height: view.frame.size.width / 6
		)
		flowLayout.minimumLineSpacing = 5
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 0, right: 25)
		
		gameView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		guard let gameView = gameView else { return }
		view.addSubview(gameView)
		gameView.dataSource = self
		gameView.delegate = self
		gameView.backgroundColor = .white
		gameView.register(GameViewCell.self, forCellWithReuseIdentifier: "Cell")
		gameView.showsVerticalScrollIndicator = false
		gameView.showsHorizontalScrollIndicator = false
		gameView.setAnchorTRBL(
			top: gameKeyWordView.bottomAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor,
			paddingTop: 10, paddingBottom: -10)
	}
	
	func setNotificationCenter() {
		NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: .textChanged, object: nil)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	// MARK: Selectors
	@objc func textChanged(_ notification: Notification) {
		guard let notificationData = notification.object as? (GameViewCell, String) else { return }
		guard let gameView = gameView else { return }
		let cell = notificationData.0
		let userInput = notificationData.1
		guard let indexPathRow = gameView.indexPath(for: cell)?.row else { return }
			
		// interactor로 넘겨서 처리
		wordManager?.wordCheck(indexPath: indexPathRow, userInput: userInput, UICollectionView: gameView)
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
