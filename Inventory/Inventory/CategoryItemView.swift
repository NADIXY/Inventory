//
//  CategoryItemView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct CategoryItemView: View {
    let category: Category
    
    var body: some View {
        VStack {
            Text(category.name)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .frame(width: 150, height: 150)
        .shadow(radius: 10)
      
    }
}
