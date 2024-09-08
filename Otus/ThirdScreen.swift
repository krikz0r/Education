//
//  ThirdScreen.swift
//  Otus
//
//  Created by Anton on 04.09.2024.
//

import SwiftUI

struct ThirdScreen: View {
    @State private var showingSheet = false

    var body: some View {
        Button(action: {
            showingSheet.toggle()
        }, label: {
            Text("Open modal screen")
        }).sheet(isPresented: $showingSheet, content: {
            SheetView()
        })
    }
}


struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}
