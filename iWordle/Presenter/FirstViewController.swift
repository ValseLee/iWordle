//
//  ViewController.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit

final class FirstViewController: UIViewController {
	
	private let mainTitleLabel: UILabel = {
		let la = UILabel()
		la.font = .boldSystemFont(ofSize: 32)
		la.text = "iWordle"
		return la
	}()
	
	private let startBtn: UIButton = {
		let btn = UIButton(type: .system)
		btn.backgroundColor = .systemGreen
		btn.setTitle("Start", for: .normal)
		btn.setTitleColor(UIColor.white, for: .normal)
		btn.titleLabel?.font = UIFont.systemFont(ofSize: 28)
		btn.layer.cornerRadius = 75 / 2
		btn.clipsToBounds = true
		btn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
		return btn
	}()
	
	private let testBtn: UIButton = {
		let btn = UIButton(type: .system)
		btn.backgroundColor = .systemGreen
		btn.setTitle("Test", for: .normal)
		btn.setTitleColor(UIColor.white, for: .normal)
		btn.titleLabel?.font = UIFont.systemFont(ofSize: 28)
		btn.layer.cornerRadius = 75 / 2
		btn.clipsToBounds = true
		btn.addTarget(self, action: #selector(testBtnTapped), for: .touchUpInside)
		return btn
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configNavBarUI(withTitle: "", prefersLargerTitle: false, isHidden: false)
		view.backgroundColor = .white
		configUI()
	}
	
	func configUI() {
		configMainTitleLabel()
		configStartBtn()
	}
	
	func configMainTitleLabel() {
		view.addSubview(mainTitleLabel)
		mainTitleLabel.setAnchorTRBL(top: view.safeAreaLayoutGuide.topAnchor,
									 paddingTop: 75)
		mainTitleLabel.setCenterX(inView: view)
	}
	
	func configStartBtn() {
		view.addSubview(startBtn)
//		startBtn.setAnchorTRBL(bottom: view.safeAreaLayoutGuide.bottomAnchor,
//							   paddingBottom: 75)
		startBtn.setAnchor(anchorTo: [.bottom(padding: 75, isToSafeArea: true)], inView: view)
		startBtn.setCenterX(inView: view)
		startBtn.setSize(height: 75, width: 250)
		
		view.addSubview(testBtn)
		testBtn.setAnchorTRBL(bottom: startBtn.topAnchor,
							  paddingBottom: 15)
		testBtn.setCenterX(inView: view)
		testBtn.setSize(height: 75, width: 250)
	}
	
	// MARK: Selectors
	@objc func startBtnTapped() {
		let gameScreen = GameViewController()
		navigationController?.pushViewController(gameScreen, animated: true)
	}
	
	@objc func testBtnTapped() {
		Network.shared.curlWord { result in
			switch result {
				case .success(let words):
					print(words.wordList!.randomElement()!)
				case .failure(let error):
					print(error.localizedDescription)
			}
		}
	}
}

