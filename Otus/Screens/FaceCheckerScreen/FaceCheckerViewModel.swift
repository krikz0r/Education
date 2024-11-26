//
//  FaceCheckerViewModel.swift
//  Otus
//
//  Created by Anton on 26.11.2024.
//

import SwiftUI
import PhotosUI
import Vision

class FaceCheckerViewModel: ObservableObject {
    @Published var inputImage: UIImage?
    @Published var faceType: String = "Не определен"
    @Published var selectedItem: PhotosPickerItem?
    @Published var faceContourPoints: [CGPoint] = []
    
    func convertNormalizedPoints(
        _ points: [CGPoint],
        boundingBox: CGRect,
        imageSize: CGSize,
        displaySize: CGSize
    ) -> [CGPoint] {
        points.map { point in
            CGPoint(
                x: (boundingBox.minX + point.x * boundingBox.width) * displaySize.width,
                y: (1 - boundingBox.minY - point.y * boundingBox.height) * displaySize.height
            )
        }
    }
    
    func detectFace() {
        guard let image = inputImage else { return }
        
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        
        let request = VNDetectFaceLandmarksRequest { [weak self] request, error in
            guard let self,
                  let results = request.results as? [VNFaceObservation],
                  let face = results.first else {
                self?.faceType = "Лицо не найдено"
                return
            }
            
            if let landmarks = face.landmarks,
               let faceContourPointsNormalized = landmarks.faceContour?.normalizedPoints {
                
                let boundingBox = face.boundingBox
                let displaySize = CGSize(width: 300, height: 300)
                let imageSize = image.size
                
                faceContourPoints = convertNormalizedPoints(
                    faceContourPointsNormalized,
                    boundingBox: boundingBox,
                    imageSize: imageSize,
                    displaySize: displaySize
                )
                
                let faceWidth = abs(faceContourPoints.first!.x - faceContourPoints.last!.x)
                let faceHeight = abs(faceContourPoints.first!.y - faceContourPoints.last!.y)
                
                let aspectRatio = faceHeight / faceWidth
                if aspectRatio > 1.5 {
                    faceType = "Вытянутое лицо"
                } else if aspectRatio < 1.2 {
                    faceType = "Круглое лицо"
                } else {
                    faceType = "Овальное лицо"
                }
            }
        }
        
        try? handler.perform([request])
    }
}
