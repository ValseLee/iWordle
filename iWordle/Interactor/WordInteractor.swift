//
//  WordCheckInteractor.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/22.
//

import Foundation

// MARK: 싱글톤일 필요가 있는가 vs 싱글톤이 아닐 필요가 있는가 vs 다형성이 요구되지 않는가 vs 앱 내에서 일관적으로 통일되어 있어야 하는가
final class WordInteractor {
	static var apiWord: String? = "DEBUG: Word hasnt Init Yet"
	static var userCharcter: String? = "DEBUG: User Input is wrong"
	
	static func wordChecker(indexPath row: Int, userInput text: String) {
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
	
	static func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
}
