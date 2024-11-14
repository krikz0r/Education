//
//  FruitsClassifierScreen.swift
//  Otus
//
//  Created by Anton on 14.11.2024.
//

import SwiftUI
import PhotosUI

struct FruitsClassifierScreen: View {
    @StateObject var viewModel = FruitsClassifierViewModel()
    @State var showSelection = false
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0.0, maxWidth: .infinity)
                Text(viewModel.currentFruit)
                Button {
                    viewModel.tryImage()
                } label: {
                    Text("Определить")
                }
            }
            
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Загрузить картинку")
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            viewModel.selectedImage = UIImage(data: data)
                        }
                    }
                }
        }
    }
}
