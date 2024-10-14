//
//  ContentView.swift
//  Otus
//
//  Created by Anton on 04.09.2024.
//

import SwiftUI
import OtusCore

enum MainViewTabs {
	case charctersList
    case suffixIterator
}

struct ContentView: View {
	@State private var selectedTab: MainViewTabs = .charctersList
	
	var body: some View {
		TabView(selection: $selectedTab) {
			SerialListScreen()
				.tabItem {
					Image(systemName: "pencil")
					Text("Characters list")
				}
				.tag(MainViewTabs.charctersList)
            SuffixesScreen()
                .tabItem {
                    Text("Suffixes")
                    Image(systemName: "swift")
                }
                .tag(MainViewTabs.suffixIterator)
		}
	}
}
