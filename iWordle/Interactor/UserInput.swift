//
//  UserInput.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/13.
//

import Foundation

struct UserInput {
	static var shared = UserInput()
	var userInput = ""
	
	// MARK: API로 대체될 예정
	var word = "CLEAR"
	
	// MARK: 각 문자를 비교해서 포함하는지, 인덱스도 동일한지 체크
	func checkUsersInput() {
		userInput.forEach { (character) in
			print("??")
		}
	}
}
