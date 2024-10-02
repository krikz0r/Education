//
//  SerialCharacterImageScreen.swift
//  Otus
//
//  Created by Anton on 21.09.2024.
//

import SwiftUI

public struct SerialCharacterImageScreen: View {
	let imageURL: String

	public init(imageURL: String) {
		self.imageURL = imageURL
	}

	public var body: some View {
		AsyncImage(url: URL(string: imageURL))
	}
}
