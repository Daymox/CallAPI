//
//  UserListModel.swift
//  CallAPI
//
//  Created by Mateo Garcia on 29/04/24.
//

import Foundation

struct UserListModel: Codable {
	var users: [UserList]
}

struct User: Codable {
	var data: UserList
}

struct UserList: Codable {
	var id: Int
	var firstName: String
	var lastName: String
	var maidenName: String
	var age: Int
	var email: String
	var phone: String
	var username: String
	var password: String
	var birthDate: String
	var image: String
}
