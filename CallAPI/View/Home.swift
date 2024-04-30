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
	@State var visibleIetms: Set<Int> = Set()
	
	var body: some View {
		NavigationView {
			if json.user.users.isEmpty {
				ProgressView()
			} else {
				ScrollViewReader { proxy in
					ZStack(alignment: .bottomTrailing) {
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
							.id(user.id)
						}
						.onAppear {
							visibleIetms = Set(json.user.users.map {$0.id})
						}
						
						Button(action: {
							withAnimation {
								proxy.scrollTo(json.user.users.first?.id)
							}
						}) {
							Image(systemName: "chevron.up")
								.padding(30)
								.background(.black.opacity(0.5))
								.foregroundColor(.white)
								.clipShape(Circle())
						}
						.padding(5)
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
