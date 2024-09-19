//
//  SerialLocationsListViewModel.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import Foundation
import RickAndMortyAPI
import SwiftUI

final class SerialLocationsListViewModel: ObservableObject {
	@Published var loadedLocations: [RickAndMortyAPI.Location] = []
	@Published var canLoad = true

	private var page = 1
	private var totalPages = 1000
	
	func load() {
		guard page <= totalPages else { return }
		guard canLoad else { return }
		
		canLoad = false
		Task { @MainActor in
			
			guard let result = try? await NetworkingAPI.locationGet(page: page) else {
				canLoad = true
				return
			}
			
			totalPages = result.info?.pages ?? 0
			loadedLocations.append(contentsOf: result.results ?? [])
			page += 1
			canLoad = true
		}
	}
}

// MARK: - Location Identifiable
extension RickAndMortyAPI.Location: Identifiable {  }
