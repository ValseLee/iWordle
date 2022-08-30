//
//  GameViewController.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class GameViewController: UIViewController {
	
	private let gameKeyWordView = GameKeyWordView()
	private var gameView: UICollectionView?
	
	private let resetBtn: UIButton = {
		let btn = UIButton(type: .system)
		btn.backgroundColor = .systemGreen
		btn.setTitle("Reset", for: .normal)
		btn.setTitleColor(UIColor.white, for: .normal)
		btn.titleLabel?.font = UIFont.systemFont(ofSize: 28)
		btn.layer.cornerRadius = 75 / 2
		btn.clipsToBounds = true
		btn.addTarget(self, action: #selector(resetBtnTapped), for: .touchUpInside)
		return btn
	}()
	
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
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		NotificationCenter.default.removeObserver(self, name: .textChanged, object: nil)
		NotificationCenter.default.removeObserver(self, name: .userWin, object: nil)
		NotificationCenter.default.removeObserver(self, name: .userLose, object: nil)
		wordManager?.resetWordInteractor()
	}

	// MARK: Methods
	func configUI() {
		configNavBarUI(withTitle: "iWordle", prefersLargerTitle: false, isHidden: false)
		navigationController?.navigationBar.barStyle = .black
		configGameKeyWordView()
		configGameView()
		configResetBtn()
	}
	
	func configGameKeyWordView() {
		view.addSubview(gameKeyWordView)
		gameKeyWordView.setCenterX(inView: view)
		gameKeyWordView.setAnchorTRBL(top: view.safeAreaLayoutGuide.topAnchor,
								paddingTop: 0)
		gameKeyWordView.setSize(height: 100, width: view.frame.width)
	}
	
	func configGameView() {
		configUICollectionView(inViewController: self, inView: view, output: &gameView)
		guard let gameView = gameView else { return	}
		gameView.register(GameViewCell.self, forCellWithReuseIdentifier: "Cell")
		gameView.dataSource = self
		gameView.delegate = self
		gameView.setAnchorTRBL(
			top: gameKeyWordView.bottomAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor,
			paddingTop: 10, paddingBottom: -150)
	}
	
	func configResetBtn() {
		view.addSubview(resetBtn)
		resetBtn.setAnchorTRBL(bottom: view.safeAreaLayoutGuide.bottomAnchor,
							   paddingBottom: 75)
		resetBtn.setCenterX(inView: view)
		resetBtn.setSize(height: 75, width: 250)
	}
	
	func setNotificationCenter() {
		NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: .textChanged, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(updateByUserWin), name: .userWin, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(updateByUserLose), name: .userLose, object: nil)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	func updateViewBackgroundColor(indexPath: IndexPath, backgroundColor: UIColor) {
		guard let gameView = gameView else { return }
		let cell = gameView.cellForItem(at: indexPath)
		cell?.backgroundColor = backgroundColor
	}
	
	// MARK: Selectors
	@objc func textChanged(_ notification: Notification) {
		guard let notificationData = notification.object as? (GameViewCell, String) else { return }
		guard let gameView = gameView else { return }
		let cell = notificationData.0
		let userInput = notificationData.1
		guard let indexPath = gameView.indexPath(for: cell) else { return }
			
		// interactor로 넘겨서 처리, 수신
		wordManager?.wordCheck(indexPath: indexPath, userInput: userInput, UICollectionView: gameView) { (indexPath, backgroundColor) in
			guard let backgroundColor = backgroundColor else { return }
			self.updateViewBackgroundColor(indexPath: indexPath, backgroundColor: backgroundColor)
		}
	}
	
	@objc func updateByUserWin(_ notification: Notification) {
		let word = notification.object as? String ?? ""
		gameKeyWordView.setAnswerWord(answer: word)
		gameKeyWordView.setSubLabel(hasWon: true)
	}
	
	@objc func updateByUserLose(_ notification: Notification) {
		let word = notification.object as? String ?? ""
		gameKeyWordView.setAnswerWord(answer: word)
		gameKeyWordView.setSubLabel(hasWon: false)
	}
	
	@objc func resetBtnTapped() {
		self.navigationController?.popViewController(animated: true)
	}
}

extension GameViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 5
	}
	
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
		print(#function)
	}
}
