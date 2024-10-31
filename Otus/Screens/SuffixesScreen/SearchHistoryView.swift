//
//  SearchHistoryView.swift
//  Otus
//
//  Created by Anton on 31.10.2024.
//

import SwiftUI
import OtusCore

// MARK: - View для отображения истории поиска
struct SearchHistoryView: View {
    @Binding var history: [SearchJob]
    
    var body: some View {
        List(history) { job in
            VStack(alignment: .leading) {
                Text("Текст: \(job.text)")
                Text("Длительность: \(job.duration, specifier: "%.2f") сек")
                    .foregroundColor(colorForDuration(job.duration))
                Text("Результат:")
                ForEach(job.result, id: \.0) { suffix, count in
                    Text("\(suffix) – \(count)")
                }
            }
            .padding()
        }
    }
    
    private func colorForDuration(_ duration: Double) -> Color {
        if duration < 1 {
            return .green
        } else if duration < 3 {
            return .yellow
        } else {
            return .red
        }
    }
}
