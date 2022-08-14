//
//  WordAPI.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/13.
//

import Foundation
import FirebaseFirestore

struct Network {
	static var shared = Network()
	
	static func fetchWord() {
		// fetch word from cloud
	}
	
	static func updateMyWord() {
		// update my custom word to cloud
	}
}
