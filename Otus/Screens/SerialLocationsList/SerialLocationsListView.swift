//
//  SerialLocationsListView.swift
//  Otus
//
//  Created by Anton on 19.09.2024.
//

import SwiftUI
import OtusCore
import OtusUI

struct SerialLocationsListView: View {
	@StateObject var viewModel = SerialLocationsListViewModel()
	var body: some View {
		List(viewModel.loadedLocations, id: \.self) { item in
			let isElemLast = viewModel.loadedLocations.needToLoad(item)
			SerialLocationsListViewItem(name: item.name ?? "",
										 type: item.type ?? "",
										 dimension: item.dimension ?? "")
			.onAppear {
				if isElemLast {
					viewModel.load()
				}
			}
		}
		.onAppear(perform: {
			viewModel.load()
		})
	}
	
}
