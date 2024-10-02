//
//  SerialCharactersListViewItem.swift
//
//
//  Created by Anton on 02.10.2024.
//

import SwiftUI

public struct SerialCharactersListViewItem: View {
	let name: String
	let gender: String
	let imageUrl: String
	
	public init(name: String, gender: String, imageUrl: String) {
		self.name = name
		self.gender = gender
		self.imageUrl = imageUrl
	}

	public var body: some View {
		HStack(content: {
			AsyncImage(url: URL(string: imageUrl)) { image in
				image.resizable()
			} placeholder: {
				Circle()
			}	.frame(width: 100, height: 100)
				.clipShape(Circle())

			VStack(alignment: .leading) {
				Text(name)
				Text(gender)
			}
		})
	}
}
