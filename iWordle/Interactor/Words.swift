//
//  Word.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/14.
//

import Foundation

struct Words {
	typealias CheckSame = ([String], [String]) -> ()
	static var shared = Words()
	
	lazy var apiWord: String? = "DEBUG: Word hasnt Init Yet"
	lazy var userCharcter: String? = "DEBUG: User Input is wrong"
	private var containsString: Bool = false
	private var alignSamePosition: Bool = false
	var userInput = ""
	
	mutating func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
	
	mutating func checkUsersInput() {
		guard let apiWord = apiWord else { return }
		guard let userCharcter = userCharcter else { return }

		if userCharcter != "", apiWord.contains(userCharcter) {
			containsString = true
		} else {
			containsString = false
		}
		
		if containsString {
			print(#function, "포함", userInput, userCharcter, apiWord)
		} else if !containsString {
			print(#function, "불포함", userInput, apiWord)
		}

		if userInput == apiWord {
			print(#function, "GOLDEN ANSWER")
			// MARK: 리셋 버튼 트리거하고 리셋 로직은 다른 곳에서 설정
		} else if userInput.count == 5 {
			checkPosition()
			userInput = ""
		}
	}

	mutating func checkPosition() {
		guard let apiWord = apiWord else { return }
		var userInputCharacterArray = userInput.map { String($0.uppercased()) }
		var apiWordCharacterArray = apiWord.map { String($0) }

		for i in 0...4 {
			if userInputCharacterArray[i] == apiWordCharacterArray[i] {
				print(#function, "\(i)번째 일치")
			}
		}
	}
}
