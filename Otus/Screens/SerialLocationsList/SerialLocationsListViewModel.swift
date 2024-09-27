//
//  SerialLocationsListViewModel.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import Foundation
import OtusCore
import SwiftUI

final class SerialLocationsListViewModel: ObservableObject {
	@Published var loadedLocations: [OtusCore.Location] = []
	@Published var canLoad = true
	@Injected var networkingApi: NetworkingAPI
	
	private var page = 1
	private var totalPages = 1000
	
	func load() {
		guard page <= totalPages else { return }
		guard canLoad else { return }
		
		canLoad = false
		Task { @MainActor in
			
			guard let result = try? await networkingApi.locationGet(page: page) else {
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
extension OtusCore.Location: Identifiable {  }
