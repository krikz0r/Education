//
//  SerialCharacterImageScreen.swift
//  Otus
//
//  Created by Anton on 21.09.2024.
//

import SwiftUI

struct SerialCharacterImageScreen: View {
	let imageURL: String
	
	var body: some View {
		AsyncImage(url: URL(string: imageURL))
	}
}
