//
//  Word.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/14.
//

import Foundation
import UIKit

final class WordInteractor {
	static let shared = WordInteractor()
	typealias WordChecked = (_ indexPath: IndexPath,
							 _ backgroundColor: UIColor,
							 _ userCharacter: String,
							 _ userInput: String) -> Void
	
	lazy var apiWord: String? = "DEBUG: Word hasnt Init Yet" {
		didSet {
			answer = Array(apiWord!)
		}
	}
	private lazy var answer = [Character]()
	private var userAnswer = ""

	public func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
	
	public func wordCheck(indexPath: IndexPath,
						  userInput: String,
						  UICollectionView gameView: UICollectionView,
						  completion: @escaping WordChecked) {
		guard let apiWord = apiWord else { return }
		
		// MARK: 각 줄, 칸의 입력값을 우아하게 정리하고 싶다.
		let line = InputLines(rawValue: indexPath.section)

		if userInput != "" {
			switch line {
				case .firstLine:
					print(userInput, indexPath.section, indexPath.row)
				case .secondLine:
					print(userInput, indexPath.section, indexPath.row)
				case .thirdLine:
					print(userInput, indexPath.section, indexPath.row)
				case .fourthLine:
					print(userInput, indexPath.section, indexPath.row)
				case .fifthLine:
					print(userInput, indexPath.section, indexPath.row)
				default:
					break
			}
		}
		
		if userAnswer == apiWord,
		   indexPath.row % 5 == 4 {
			completion(indexPath, .systemGreen, userAnswer, userInput)
			print("Answer")
		} else if apiWord.contains(userInput),
				  userInput != "",
				  answer[indexPath.row % 5] == Character(userInput) {
			completion(indexPath, .systemGreen, userAnswer, userInput)
		} else if apiWord.contains(userInput),
				  userInput != "",
				  answer[indexPath.row % 5] != Character(userInput) {
			completion(indexPath, .systemYellow, userAnswer, userInput)
		} else if !apiWord.contains(userInput),
				  userInput != "" {
			completion(indexPath, .systemGray4, userAnswer, userInput)
		}
	}
	
	private init() {}
}
