//
//  MarqueeText.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

struct MarqueeText: View {
    let text: String
    let font: Font
    let foregroundColor: Color
    let speed: Double

    @State private var offset: CGFloat = 0
    @State private var textWidth: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            let containerWidth = geometry.size.width

            HStack(spacing: 0) {
                Text(text)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .background(GeometryReader { geo in
                        Color.clear.onAppear {
                            textWidth = geo.size.width
                            if textWidth > containerWidth {
                                animateText()
                            }
                        }
                    })
                    .offset(x: offset)
                    .animation(.linear(duration: speed * Double(textWidth)).repeatForever(autoreverses: false))

                if textWidth > containerWidth {
                    Text(text)
                        .font(font)
                        .foregroundColor(foregroundColor)
                        .offset(x: offset)
                        .animation(.linear(duration: speed * Double(textWidth)).repeatForever(autoreverses: false))
                }
            }
            .onAppear {
                if textWidth > containerWidth {
                    animateText()
                }
            }
        }
        .clipped()
    }

    private func animateText() {
        offset = -textWidth
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            offset = 0
        }
    }
}
