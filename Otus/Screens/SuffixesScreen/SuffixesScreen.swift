//
//  SuffixesScreen.swift
//  Otus
//
//  Created by Anton on 14.10.2024.
//

import SwiftUI

struct SuffixesScreen: View {
    @StateObject private var viewModel = SuffixViewModel()
    @State private var selectedTab = 0
    @State private var sortOrderAscending = true
    
    var body: some View {
        VStack {
            TextField("Введите текст", text: $viewModel.inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $selectedTab, label: Text("Режим")) {
                Text("Все суффиксы").tag(0)
                Text("Топ 10").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedTab == 0 {
                // Список всех суффиксов
                VStack {
                    TextField("Поиск по суффиксам", text: $viewModel.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        viewModel.sortedSuffixes.reverse()
                        sortOrderAscending.toggle()
                    }) {
                        Text(sortOrderAscending ? "Сортировать по убыванию" : "Сортировать по возрастанию")
                    }
                    
                    List(viewModel.sortedSuffixes, id: \.0) { suffix, count in
                        Text("\(suffix) – \(count)")
                    }
                }
            } else {
                // Топ 10 суффиксов
                List(viewModel.topSuffixes, id: \.0) { suffix, count in
                    Text("\(suffix) – \(count)")
                }
            }
        }
    }
}
