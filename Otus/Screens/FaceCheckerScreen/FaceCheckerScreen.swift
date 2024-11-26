//
//  FaceCheckerScreen.swift
//  Otus
//
//  Created by Anton on 26.11.2024.
//

import SwiftUI
import PhotosUI
import Vision

struct FaceCheckerScreen: View {
    @StateObject var viewModel = FaceCheckerViewModel()
    
    var body: some View {
        VStack {
            if let image = viewModel.inputImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .overlay(
                        Path { path in
                            guard !viewModel.faceContourPoints.isEmpty else { return }
                            path.addLines(viewModel.faceContourPoints)
                            path.closeSubpath()
                        }
                        .stroke(Color.red, lineWidth: 2)
                    )
            }
            
            PhotosPicker(
                selection: $viewModel.selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Загрузить картинку")
                }
                .onChange(of: viewModel.selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            viewModel.inputImage = UIImage(data: data)
                        }
                    }
                }
            
            Button("Определить тип лица") {
                viewModel.detectFace()
            }
            .padding()
            
            Text("Тип лица: \(viewModel.faceType)")
                .padding()
        }
    }
}
