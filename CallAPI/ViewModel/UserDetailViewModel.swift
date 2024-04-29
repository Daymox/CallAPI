//
//  UserDetailViewModel.swift
//  CallAPI
//
//  Created by Mateo Garcia on 29/04/24.
//

import Foundation

class UserDetailViewModel: ObservableObject {
	@Published var firstName = ""
	@Published var lastName = ""
	@Published var maidenName = ""
	@Published var age = ""
	@Published var email = ""
	@Published var phone = ""
	@Published var username = ""
	@Published var password = ""
	@Published var birthDate = ""
	@Published var image = ""
	
	func fetch(id: Int) {
		guard let url = URL(string: "https://dummyjson.com/users/\(id)") else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, _, _ in
			guard let data = data else {
				return
			}
			
			do {
				let json = try JSONDecoder().decode(UserList.self, from: data)
				
				DispatchQueue.main.async {
					self.firstName = json.firstName
					self.lastName = json.lastName
					self.maidenName = json.maidenName
					self.email = json.email
					self.phone = json.phone
					self.username = json.username
					self.password = json.password
					self.birthDate = json.birthDate
					self.image = json.image
				}
			} catch let error as NSError {
				print("JSON Error", error.localizedDescription)
			}
		}.resume()
	}
}
