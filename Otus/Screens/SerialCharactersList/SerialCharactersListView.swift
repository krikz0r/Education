//
//  SerialCharactersListView.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import SwiftUI
import OtusCore

struct SerialCharactersListView: View {
	@StateObject var viewModel = SerialCharactersListViewModel()
	@Binding var charactersListPath: [SerialListScreen.CharactersListPath]

	var body: some View {
		List(viewModel.loadedCharacters, id: \.self) { item in
			let isElemLast = viewModel.loadedCharacters.needToLoad(item)
			SerialCharactersListViewItem(name: item.name ?? "",
										 gender: item.gender ?? "",
										 imageUrl: item.image ?? "")
			.onAppear {
				if isElemLast {
					viewModel.load()
				}
			}
			.onTapGesture {
				charactersListPath.append(.detail(item))
			}
		}
		.onAppear(perform: {
			viewModel.load()
		})
		
	}
}


