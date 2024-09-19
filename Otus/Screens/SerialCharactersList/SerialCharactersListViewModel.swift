//
//  SerialCharactersListViewModel.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import Foundation
import RickAndMortyAPI
import SwiftUI

final class SerialCharactersListViewModel: ObservableObject {
	
	@Published var loadedCharacters: [ModelCharacter] = []
	@Published var canLoad = true
	@State var pickerSelectedItem = PickerItem.characters

	private var page = 1
	private var totalPages = 1000
	
	func load() {
		guard page <= totalPages else { return }
		guard canLoad else { return }
		
		canLoad = false
		Task { @MainActor in
			
			guard let result = try? await NetworkingAPI.characterGet(page: page) else {
				canLoad = true
				return
			}
			
			totalPages = result.info?.pages ?? 0
			loadedCharacters.append(contentsOf: result.results ?? [])
			page += 1
			canLoad = true
		}
	}
}

extension SerialCharactersListViewModel {
	enum PickerItem: String, CaseIterable {
		case characters
		case locations
	}
}

// MARK: - ModelCharacter Identifiable
extension ModelCharacter: Identifiable {  }
