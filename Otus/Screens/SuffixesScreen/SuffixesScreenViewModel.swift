//
//  SuffixesScreenViewModel.swift
//  Otus
//
//  Created by Anton on 14.10.2024.
//

import SwiftUI
import Combine
import OtusCore

// ViewModel для работы с текстом и суффиксами
class SuffixViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var sortedSuffixes: [(String, Int)] = []
    @Published var topSuffixes: [(String, Int)] = []
    @Published var searchQuery: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Дебаунс для поиска
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.filterSuffixes(query: query)
            }
            .store(in: &cancellables)
        
        // Обновление суффиксов при изменении текста
        $inputText
            .sink { [weak self] text in
                self?.updateSuffixes(text: text)
            }
            .store(in: &cancellables)
    }
    
    private func updateSuffixes(text: String) {
        let creator = SuffixesCreator(text: text)
        self.sortedSuffixes = creator.allSuffixes.sorted { $0.key < $1.key }
        self.topSuffixes = creator.threeLetterSuffixes.sorted { $0.value > $1.value }.prefix(10).map { ($0.key, $0.value) }
    }
    
    private func filterSuffixes(query: String) {
        guard !query.isEmpty else { return }
        let creator = SuffixesCreator(text: inputText)
        self.sortedSuffixes = creator.allSuffixes.filter { $0.key.contains(query) }.sorted { $0.key < $1.key }
    }
}
