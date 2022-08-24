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
	
	lazy var apiWord: String? = "DEBUG: Word hasnt Init Yet"
	lazy var cellNotifier = 1
	
	private var userCharcter = ""

	public func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
	
	public func wordCheck(indexPath row: Int, userInput userInput: String, UICollectionView gameView: UICollectionView) {
		guard let apiWord = apiWord else { return }
		let answer = Array(apiWord)
		if userInput != "" {
			switch row {
				case InputLines.firstLine:
					userCharcter += userInput
				case InputLines.secondLine:
					userCharcter += userInput
				case InputLines.thirdLine:
					userCharcter += userInput
				case InputLines.fourthLine:
					userCharcter += userInput
				case InputLines.fifthLine:
					userCharcter += userInput
				default:
					dump("DEBUG: 어째서 셀이 25개가 넘는가?")
			}
		}
		
		if userCharcter == apiWord {
			print("Answer")
		} else if apiWord.contains(userInput),
				  userInput != "",
				  answer[row % 5] == Character(userInput) {
			print("Contains && Same Position, Background to Green")
		} else if apiWord.contains(userInput),
				  userInput != "",
				  answer[row % 5] != Character(userInput) {
			print("only Contains, Background to Yellow")
		} else if !apiWord.contains(userInput),
				  userInput != "" {
			print("Doesnt Have")
		}
	}
	
	private init() {}
}
