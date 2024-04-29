//
//  CallAPIApp.swift
//  CallAPI
//
//  Created by Johan Mateo Garcia Rios on 28/04/24.
//

import SwiftUI

@main
struct CallAPIApp: App {
    var body: some Scene {
		let login = PosViewModel()
		
        WindowGroup {
            ContentView()
				.environmentObject(login)
        }
    }
}
