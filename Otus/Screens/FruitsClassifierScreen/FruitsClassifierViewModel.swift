//
//  FruitsClassifierViewModel.swift
//  Otus
//
//  Created by Anton on 14.11.2024.
//

import Vision
import CoreML
import SwiftUI

class FruitsClassifierViewModel: ObservableObject {
    @Published var selectedImage: UIImage? = nil
    @Published var currentFruit: String = ""
    private let initialModel = try? FruitsClassifier(configuration: MLModelConfiguration())
    private var vnCoreMLModel: VNCoreMLModel?
    private var request: VNCoreMLRequest?
    
    init() {
        guard let initialModel = initialModel else { return }
        vnCoreMLModel = try? VNCoreMLModel(for: initialModel.model)
        request = VNCoreMLRequest(model: vnCoreMLModel!, completionHandler: response)
    }
    
    func tryImage() {
        guard let image = selectedImage?.cgImage,
        let request
        else {
            return
        }
        let handler = VNImageRequestHandler(cgImage: image)
        try? handler.perform([request])
    }
    
    func response(request: VNRequest, error: Error?) {
        guard error == nil else {
            currentFruit = error?.localizedDescription ?? ""
            return
        }
        
        guard let observations = request.results as? [VNClassificationObservation],
              let maxConfidence = observations.first(where: { $0.confidence >= 0.85 }) else {
            currentFruit = "Не удалось определить"
            return
        }
        
        currentFruit = maxConfidence.identifier + " " + String(maxConfidence.confidence)
    }
    
    
}
