//
//  PosViewModel.swift
//  CallAPI
//
//  Created by Johan Mateo Garcia Rios on 28/04/24.
//

import Foundation

class PosViewModel: ObservableObject {
	
	@Published var authenticated = 0
	
	init() {
		if let session = UserDefaults.standard.object(forKey: "Session") as? Int {
			authenticated = session
		} else {
			authenticated = 0
		}
	}
	
	func login(email: String, password: String) {
		guard let url = URL(string: "https://reqres.in/api/login") else {
			return
		}
		
		let parameters = ["email": email, "password": password]
		let body = try! JSONSerialization.data(withJSONObject: parameters)
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = body
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let response = response {
				print(response)
			}
			
			guard let data = data else {
				return
			}
			
			do {
				let data = try JSONDecoder().decode(PosModel.self, from: data)
				
				if !data.token.isEmpty {
					DispatchQueue.main.async {
						print(data.token)
						self.authenticated = 1
						UserDefaults.standard.setValue(1, forKey: "Session")
					}
				}
			} catch let error as NSError {
				print("POS Error", error.localizedDescription)
				DispatchQueue.main.async {
					self.authenticated = 2
				}
			}
		}.resume()
	}
}
