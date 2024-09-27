//
//  SerialListScreen.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import SwiftUI
import OtusCore

struct SerialListScreen: View {
	enum PickerItem: String, CaseIterable {
		case characters
		case locations
	}
	enum CharactersListPath: Hashable {
		case detail(ModelCharacter)
		case image(String)
	}
	
	@State private var pickerSelectedItem = PickerItem.characters
	@State private var charactersListPath: [CharactersListPath] = []
	
	var body: some View {
		if #available(iOS 16.0, *) {
			NavigationStack(path: $charactersListPath) {
				VStack(content: {
					Picker("Title", selection: $pickerSelectedItem) {
						ForEach(PickerItem.allCases, id: \.self) {
							Text($0.rawValue.capitalized)
						}
					}
					.pickerStyle(.segmented)
					if pickerSelectedItem == .characters {
						SerialCharactersListView(charactersListPath: $charactersListPath)
							.navigationDestination(for: CharactersListPath.self) { path in
								switch path {
								case .detail(let character):
									SerialCharacterDetailScreen(character: character, charactersListPath: $charactersListPath)
								case .image(let url):
									SerialCharacterImageScreen(imageURL: url)
								}
							}
					} else {
						SerialLocationsListView()
					}
				})
			}
		} else {
			EmptyView()
		}
	}
}
