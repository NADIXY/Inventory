//
//  CategoryItemView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct CategoryItemView: View {
    let category: CategoryEntity
    
    var body: some View {
        VStack {
            if let imageName = category.imageName, !imageName.isEmpty {
                // Check if the image exists in the asset catalog
                if UIImage(named: imageName) != nil {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                } else {
                    // If the image is not found, show a placeholder
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                }
            } else {
                // If no image name is available, show a placeholder
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
            }
            
            Text(category.name ?? "Unbekannt")
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
        .cornerRadius(20)
        .frame(width: 150, height: 150)
        .shadow(radius: 10)
    }
}
