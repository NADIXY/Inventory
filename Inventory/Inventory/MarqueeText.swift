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
    let speed: CGFloat
    
    @State private var offset: CGFloat = 0
    @State private var textWidth: CGFloat = 0
    @State private var containerWidth: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
        //    if text.count > 12 {
            HStack(spacing: 0) {
                Text(text)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .background(
                        GeometryReader { textGeometry in
                            Color.clear
                                .onAppear {
                                    textWidth = textGeometry.size.width
                                }
                        }
                    )
                Text(text)
                    .font(font)
                    .foregroundColor(foregroundColor)
            }
            .offset(x: -offset)
            .onAppear {
                containerWidth = geometry.size.width
                startScrolling()
            }
        }
        .frame(height: 20)
    }
    private func startScrolling() {
        let animationDuration = Double((textWidth + containerWidth) / speed)
        
        withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
            offset = textWidth
        }
    }
}
                        
