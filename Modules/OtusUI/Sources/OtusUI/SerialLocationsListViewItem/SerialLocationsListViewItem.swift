//
//  SwiftUIView.swift
//  
//
//  Created by Anton on 02.10.2024.
//

import SwiftUI

public struct SerialLocationsListViewItem: View {
	let name: String
	let type: String
	let dimension: String
	
	public init(name: String, type: String, dimension: String) {
		self.name = name
		self.type = type
		self.dimension = dimension
	}

	public var body: some View {
		VStack(alignment: .leading) {
			Text(name)
			Text(type)
			Text(dimension)
		}
	}
}
