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
							 _ backgroundColor: UIColor?) -> Void
	
	lazy var apiWord: String? = "DEBUG: Word hasnt Init Yet" {
		didSet {
			answer = Array(apiWord!)
		}
	}
	
	private lazy var answer = [Character]()
	private lazy var inputArrays: [[String]] = Array(repeating:
														Array(repeating: "", count: 5),
													 count: 5)
	private lazy var chance = 5
	private var userAnswer = ""

	public func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
	
	public func wordCheck(indexPath: IndexPath,
						  userInput: String,
						  UICollectionView gameView: UICollectionView,
						  completion: @escaping WordChecked) {
		let line = InputLines(line: indexPath.section, userInput: userInput)

		if userInput != "" {
			switch line {
				case .firstLine:
					inputArrays[indexPath.section][indexPath.row] = line.getCellInput(userInput)
					if !inputArrays[indexPath.section].contains("") { chance -= 1 }
					
					let backgroundColor = answerCheck(userWord: inputArrays[indexPath.section], userInput: userInput, indexPath: indexPath)
					completion(indexPath, backgroundColor)
				case .secondLine:
					inputArrays[indexPath.section][indexPath.row] = line.getCellInput(userInput)
					if !inputArrays[indexPath.section].contains("") { chance -= 1 }
					
					let backgroundColor = answerCheck(userWord: inputArrays[indexPath.section], userInput: userInput, indexPath: indexPath)
					completion(indexPath, backgroundColor)
				case .thirdLine:
					inputArrays[indexPath.section][indexPath.row] = line.getCellInput(userInput)
					if !inputArrays[indexPath.section].contains("") { chance -= 1 }
					
					let backgroundColor = answerCheck(userWord: inputArrays[indexPath.section], userInput: userInput, indexPath: indexPath)
					completion(indexPath, backgroundColor)
				case .fourthLine:
					inputArrays[indexPath.section][indexPath.row] = line.getCellInput(userInput)
					if !inputArrays[indexPath.section].contains("") { chance -= 1 }
					
					let backgroundColor = answerCheck(userWord: inputArrays[indexPath.section], userInput: userInput, indexPath: indexPath)
					completion(indexPath, backgroundColor)
				case .fifthLine:
					inputArrays[indexPath.section][indexPath.row] = line.getCellInput(userInput)
					if !inputArrays[indexPath.section].contains("") { chance -= 1 }
					
					let backgroundColor = answerCheck(userWord: inputArrays[indexPath.section], userInput: userInput, indexPath: indexPath)
					completion(indexPath, backgroundColor)
				default:
					break
			}
		}
		
		// Game Over
		if chance == 0 {
			NotificationCenter.default.post(name: .userLose, object: apiWord, userInfo: nil)
		}
	}
	
	private func answerCheck(userWord: [String],
							 userInput: String,
							 indexPath: IndexPath) -> UIColor {
		guard let apiWord = apiWord else {
			return .systemGray4
		}
		
		userAnswer = userWord.reduce("") { $0.uppercased() + $1.uppercased() }
		let userCharacter = Character(userInput.uppercased())
		
		// MARK: Answer Notification
		if userAnswer == apiWord {
			NotificationCenter.default.post(name: .userWin, object: userAnswer, userInfo: nil)
			return .systemGreen
		} else if answer.contains(userCharacter),
				  userInput != "",
				  answer[indexPath.row] == userCharacter {
			return .systemGreen
		} else if answer.contains(userCharacter),
				  userInput != "",
				  answer[indexPath.row] != userCharacter {
			return .systemYellow
		} else if !answer.contains(userCharacter) {
			return .systemGray4
		}
		return .systemGray4
	}
	
	private init() {}
}
