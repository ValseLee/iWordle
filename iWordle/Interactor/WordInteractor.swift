//
//  Word.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/14.
//

import Foundation

final class Words {
	typealias CheckSame = ([String], [String]) -> ()
	static let shared = Words()
	
	lazy var apiWord: String? = "DEBUG: Word hasnt Init Yet"
	lazy var userCharcter: String? = "DEBUG: User Input is wrong"
	private var containsString: Bool = false
	private var alignSamePosition: Bool = false
	var userInput = ""
	
	func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
	
	public func wordCheck(indexPath row: Int, userInput text: String) {
		if text != "" {
			switch row {
				case 0...4:
					userCharcter! += text
					print(row, userCharcter!)
				case 5...9:
					print("?")
				case 10...14:
					print("else")
				case 15...19:
					print("??")
				case 20...24:
					print("???")
				default:
					dump("DEBUG: 어째서 셀이 25개가 넘는가?")
			}
		}
	}

	func checkPosition() {
		guard let apiWord = apiWord else { return }
		var userInputCharacterArray = userInput.map { String($0.uppercased()) }
		var apiWordCharacterArray = apiWord.map { String($0) }

		for i in 0...4 {
			if userInputCharacterArray[i] == apiWordCharacterArray[i] {
				print(#function, "\(i)번째 일치")
			}
		}
	}
	
	private init() {}
}
