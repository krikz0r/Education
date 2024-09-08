//
//  FirstScreen.swift
//  Otus
//
//  Created by Anton on 04.09.2024.
//

import SwiftUI

struct FirstScreen: View {
    @Binding var selectedTab: MainViewTabs
    @Binding var selectedRow: Int?

    var body: some View {
        Button(action: {
            selectedTab = .second
            selectedRow = 1
        }, label: {
            Text("Route To Second Screen")
        })
        .buttonStyle(.bordered)
        .tint(.purple)
    }
}
