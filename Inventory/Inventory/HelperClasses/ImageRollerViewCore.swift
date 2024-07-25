//
//  ImageRollerViewCore.swift
//  Inventory
//
//  Created by Lutz Brückner on 26.07.24.
//

import SwiftUI

struct ImageRollerViewCore: View {
    @Binding var selectedImageName: String
    let images: [ImageAsset]

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.self) { image in
                        VStack {
                            Image(image.rawValue)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Rectangle())
                                .onTapGesture {
                                    selectedImageName = image.rawValue
                                }
                                .border(selectedImageName == image.rawValue ? Color.blue : Color.clear, width: 2)
                            Text(image.displayName)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
