//
//  SecondScreen.swift
//  Otus
//
//  Created by Anton on 04.09.2024.
//

import SwiftUI

struct SecondScreen: View {
	@Binding var selectedRow: Int?
	
	var body: some View {
		NavigationView {
			List {
				ForEach(1...10, id: \.self) { row in
					NavigationLink(destination:
									TextView(text: "Opened row №\(row). Its TextView from UIKit :),  u can edit it",
											 font: .boldSystemFont(ofSize: 22))
										.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity),
								   tag: row,
								   selection: $selectedRow
					) {
						Text("Row \(row)")
							.padding(EdgeInsets(top: .zero,
												leading: CGFloat(row * 3),
												bottom: 0,
												trailing: 0))
					}
				}
			}
		}
	}
}


struct TextView: UIViewRepresentable {
	var text: String
	var font: UIFont
	
	func makeUIView(context: Context) -> UITextView {
		UITextView()
	}
	
	func updateUIView(_ uiView: UITextView, context: Context) {
		uiView.text = text
		uiView.font = font
	}
}
