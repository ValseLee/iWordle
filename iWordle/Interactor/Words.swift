//
//  Word.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/14.
//

import Foundation

struct Words {
	static var shared = Words()
	lazy var apiWord: String? = "DEBUG: Word hasnt Init Yet"
	var userInput = ""
	
	mutating func setWord(wordsList: [String]) {
		apiWord = wordsList.randomElement()!.uppercased()
	}
	
	func checkUsersInput() {
		print(userInput)
	}
}
