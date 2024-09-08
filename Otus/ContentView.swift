//
//  ContentView.swift
//  Otus
//
//  Created by Anton on 04.09.2024.
//

import SwiftUI

enum MainViewTabs {
    case first
    case second
    case third
}

struct ContentView: View {
    @State private var selectedTab: MainViewTabs = .first
    @State private var selectedRow: Int?

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstScreen(selectedTab: $selectedTab, selectedRow: $selectedRow)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("First Screen")
                }
                .tag(MainViewTabs.first)
            SecondScreen(selectedRow: $selectedRow)
                .tabItem {
                    Image(systemName: "swift")
                    Text("Second Screen")
                }
                .tag(MainViewTabs.second)
            ThirdScreen()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Third Screen")
                }
                .tag(MainViewTabs.third)
        }
    }
}

#Preview {
    ContentView()
}
