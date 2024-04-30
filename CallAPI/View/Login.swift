//
//  Login.swift
//  CallAPI
//
//  Created by Johan Mateo Garcia Rios on 28/04/24.
//

import SwiftUI

struct Login: View {
	@State var email = ""
	@State var password = ""
	@State var isPressed = false
	
	@EnvironmentObject var login: PosViewModel
	
	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 15) {
				Image(systemName: "aqi.medium")
					.font(.system(size: 150))
					.symbolEffect(.variableColor)
					.padding(.vertical, 100)
				TextField("Email", text: $email)
					.padding()
					.border(Color.gray)
					.clipShape(RoundedRectangle(cornerRadius: 10))
				
				SecureField("Password", text: $password)
					.padding()
					.border(Color.gray)
					.clipShape(RoundedRectangle(cornerRadius: 10))
				
				Button(action:{
					login.login(email: email, password: password)
				}) {
					Text("Log In")
						.foregroundColor(.white)
						.padding()
						.frame(maxWidth: .infinity, maxHeight: 50)
						.background(Color.blue)
						.clipShape(RoundedRectangle(cornerRadius: 10))
				}
				.scaleEffect(isPressed ? 1.1 : 1)
				.animation(.easeInOut(duration: 0.2))
				.onTapGesture {
					isPressed.toggle()
				}
			}
			.padding()
		}
	}
}
