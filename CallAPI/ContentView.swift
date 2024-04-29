//
//  ContentView.swift
//  CallAPI
//
//  Created by Johan Mateo Garcia Rios on 28/04/24.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var login: PosViewModel
	
	var body: some View {
		Group {
			if login.authenticated == 0 {
				Login()
			} else if login.authenticated == 1 {
				Home()
			} else if login.authenticated == 2 {
				VStack {
					Text("Usuario y/o contraseña incorrectos")
					Button(action: {
						login.authenticated = 0
					}) {
						Text("Regresar")
					}
				}
			}
		}
	}
}
