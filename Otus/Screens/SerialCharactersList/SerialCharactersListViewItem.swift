//
//  SerialCharactersListViewItem.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import SwiftUI

struct SerialCharactersListViewItem: View {
	let name: String
	let gender: String
	let imageUrl: String

	var body: some View {
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
