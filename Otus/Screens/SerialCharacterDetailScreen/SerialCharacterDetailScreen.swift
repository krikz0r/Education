//
//  SerialCharacterDetailScreen.swift
//  Otus
//
//  Created by Anton on 21.09.2024.
//

import SwiftUI
import OtusCore

struct SerialCharacterDetailScreen: View {
	let character: ModelCharacter
	@Binding var charactersListPath: [SerialListScreen.CharactersListPath]
	
	var body: some View {
		VStack(content: {
			VStack(content: {
				AsyncImage(url: URL(string: character.image ?? "")) { image in
					image.resizable()
				} placeholder: {
					Rectangle().tint(.gray)
				}
				.frame(height: 250)
				.onTapGesture {
					charactersListPath.append(.image(character.image ?? ""))
				}
				Text("Name: " + (character.name ?? ""))
				Text("Status: " + (character.status ?? ""))
				Text("Gender: " + (character.gender ?? ""))
			})
			Spacer()
		})
	}
}
