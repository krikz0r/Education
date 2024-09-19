//
//  SerialLopcationsListViewItem.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import SwiftUI

struct SerialLopcationsListViewItem: View {
	let name: String
	let type: String
	let dimension: String

	var body: some View {
		VStack(alignment: .leading) {
			Text(name)
			Text(type)
			Text(dimension)
		}
	}
}
