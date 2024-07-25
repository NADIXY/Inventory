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
            if let imageName = category.imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            Text(category.name ?? "Unbekannt")
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
        .foregroundColor(.white)
        .cornerRadius(10)
        .frame(width: 150, height: 150)
        .shadow(radius: 10)
    }
}
