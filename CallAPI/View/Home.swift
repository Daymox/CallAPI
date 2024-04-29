//
//  Home.swift
//  CallAPI
//
//  Created by Johan Mateo Garcia Rios on 28/04/24.
//

import SwiftUI

struct Home: View {
	@EnvironmentObject var login: PosViewModel
	@StateObject var json = UserListViewModel()
	
	var body: some View {
		NavigationView {
			if json.user.users.isEmpty {
				ProgressView()
			} else {
				List(json.user.users , id:\.id) { user in
					NavigationLink(destination: UserDetail(id: user.id)) {
						HStack {
							AsyncImage(url: URL(string: user.image)) { image in
								image.image?
									.resizable()
							}
							.frame(width: 60, height: 60)
							.clipped()
							.clipShape(Circle())
							.padding(.trailing)
							
							VStack(alignment: .leading) {
								Text(user.firstName)
								Text(user.maidenName)
									.font(.subheadline)
									.foregroundStyle(Color.gray)
							}
						}
					}
				}
				.navigationTitle("Usuarios")
				.toolbar() {
					ToolbarItem(placement: .topBarLeading) {
						Button(action: {
							UserDefaults.standard.removeObject(forKey: "Session")
							login.authenticated = 0
						}) {
							Text("Log Out")
						}
					}
				}
			}
		}
	}
}

#Preview {
	Home()
}
