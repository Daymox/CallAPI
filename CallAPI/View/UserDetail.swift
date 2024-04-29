//
//  UserDetail.swift
//  CallAPI
//
//  Created by Mateo Garcia on 29/04/24.
//

import SwiftUI

struct UserDetail: View {
	var id: Int
	@StateObject var user = UserDetailViewModel()
	
	var body: some View {
		VStack(alignment: .center) {
			AsyncImage(url: URL(string: user.image)) { image in
				image.image?
					.resizable()
			}
			.frame(width: 300, height: 300)
	
			labelInfo(title: "Nombre", value: user.firstName)
			labelInfo(title: "Apellido", value: user.lastName)
			labelInfo(title: "Edad", value: user.age)
			labelInfo(title: "Fecha de Nacimiento", value: user.birthDate)
			labelInfo(title: "Email", value: user.email)
			labelInfo(title: "Teléfono", value: user.phone)
		}
		.padding()
		.onAppear {
			user.fetch(id: id)
		}
	}
}



struct labelInfo: View {
	let title: String
	let value: String
	
	var body: some View {
		HStack {
			Text(title)
				.bold()
			Spacer()
			Text(value)
		}
		.padding()
	}
}