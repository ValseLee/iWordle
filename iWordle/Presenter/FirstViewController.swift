//
//  ViewController.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/11.
//

import UIKit
import JGProgressHUD

final class FirstViewController: UIViewController {
	private let gameKeyWordView = GameKeyWordView()
	
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
		startBtn.setAnchor(anchorTo: [.bottom(padding: 75, isToSafeArea: true)], inView: view)
		startBtn.setCenterX(inView: view)
		startBtn.setSize(height: 75, width: 250)
	}
	
	// MARK: Selectors
	@objc func startBtnTapped() {
		showLoader(true, withText: nil)
		Network.shared.curlWord { result in
			switch result {
				case .success(_):
					print("Data has Setted")
				case .failure(let error):
					print(error.localizedDescription)
			}
		}
		showLoader(false, withText: "Welcome!")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
			let gameScreen = GameViewController()
			self.navigationController?.pushViewController(gameScreen, animated: true)
		}
	}
}
