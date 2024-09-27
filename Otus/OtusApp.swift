//
//  OtusApp.swift
//  Otus
//
//  Created by Anton on 04.09.2024.
//

import SwiftUI
import OtusCore

@main
struct OtusApp: App {
	
	init() {
		registerServices()
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
		
	private func registerServices() {
		ServiceLocator.shared.register(NetworkingAPI())
	}
}
