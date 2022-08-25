//
//  WordCheckLogicEnum.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/25.
//

import Foundation

enum InputLines {
	case firstLine(userInput: String),
		 secondLine(userInput: String),
		 thirdLine(userInput: String),
		 fourthLine(userInput: String),
		 fifthLine(userInput: String)
	case error
	
	func getCellInput(_ userInput: String) -> String {
		switch self {
			case .firstLine(userInput: let userInput):
				return userInput
			case .secondLine(userInput: let userInput):
				return userInput
			case .thirdLine(userInput: let userInput):
				return userInput
			case .fourthLine(userInput: let userInput):
				return userInput
			case .fifthLine(userInput: let userInput):
				return userInput
			case .error:
				print("그럴리가?")
		}
		return ""
	}
	
	init(line: Int, userInput: String) {
		switch line {
			case 0:
				self = .firstLine(userInput: userInput)
			case 1:
				self = .secondLine(userInput: userInput)
			case 2:
				self = .thirdLine(userInput: userInput)
			case 3:
				self = .fourthLine(userInput: userInput)
			case 4:
				self = .fifthLine(userInput: userInput)
			default:
				self = .error
				break
		}
	}
}
