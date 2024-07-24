//
//  ImageRollerView.swift
//  Inventory
//
//  Created by Lutz Brückner on 24.07.24.
//

import SwiftUI

struct ImageRollerView: View {
    @Binding var selectedImageName: String
    let imageNames: [String]

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(imageNames, id: \.self) { imageName in
                        VStack {
                            Image(imageName)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedImageName = imageName
                                }
                                .border(selectedImageName == imageName ? Color.blue : Color.clear, width: 2)
                            Text(imageName)
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
