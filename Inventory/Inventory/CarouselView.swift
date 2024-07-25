//
//  CarouselView.swift
//  Inventory
//
//  Created by Lutz Brückner on 24.07.24.
//

import SwiftUI

struct CarouselView: View {
    @Binding var selectedImageName: String
    let imageNames: [String]
    
    @State private var currentIndex: Int = 0

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(imageNames.indices, id: \.self) { index in
                        Image(imageNames[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                            .tag(index)
                            .onTapGesture {
                                withAnimation {
                                    selectedImageName = imageNames[index]
                                }
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: geometry.size.height * 0.7)

                HStack {
                    ForEach(imageNames.indices, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.blue : Color.gray)
                            .frame(width: 10, height: 10)
                            .onTapGesture {
                                withAnimation {
                                    currentIndex = index
                                }
                            }
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}
