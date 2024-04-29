//
//  UserListViewModel.swift
//  CallAPI
//
//  Created by Mateo Garcia on 29/04/24.
//

import Foundation

class UserListViewModel: ObservableObject {
	@Published var user = UserListModel(users: [])
	
	init() {
		fetch()
	}
	
	func fetch() {
		guard let url = URL(string: "https://dummyjson.com/users") else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, _, _ in
			guard let data = data else {
				return
			}
			
			do {
				let json = try JSONDecoder().decode(UserListModel.self, from: data)
				
				DispatchQueue.main.async {
					self.user = json
				}
			} catch let error as NSError {
				print("JSON Error", error.localizedDescription)
			}
		}.resume()
	}
}
