//
//  WordAPI.swift
//  iWordle
//
//  Created by 이승준 on 2022/08/13.
//

import Foundation
import FirebaseFirestore

struct Network {
	typealias NetworkCompletion = (Result<Words, NetworkError>) -> Void
	static var shared = Network()
	
	func fetchWord() {
		// fetch word from cloud
		Firestore.firestore().collection("words").getDocuments { (snapshot, error) in
			snapshot?.documents.forEach({ document in
				let array = document.data()
				print(array)
			})
		}
	}
	
	// MARK: get github 5 letters word list
	func curlWord(completion: @escaping NetworkCompletion) {
		let urlString = "https://raw.githubusercontent.com/tabatkins/wordle-list/main/words"
		performRequest(with: urlString) { result in
			completion(result)
		}
	}
	
	private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
		guard let url = URL(string: urlString) else { return }
		let session = URLSession(configuration: .default)
		
		let task = session.dataTask(with: url) { data, response, error in
			guard error == nil else {
				completion(.failure(.networkingError))
				return
			}
			guard let safeData = data else {
				completion(.failure(.dataError))
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
				completion(.failure(.requestError))
				return
			}
			
			let str = String(decoding: safeData, as: UTF8.self).split(separator: "\n")
			let result = str.map { substring in
				String(substring)
			}
			completion(.success(.init(words: result)))
		}
		task.resume()
	}
	
	func updateMyWord() {
		// update my custom word to cloud
	}
}
