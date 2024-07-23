//
//  SubcategoryItemView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct SubcategoryItemView: View {
    let subcategory: String
    let itemCount: Int
    
    var body: some View {
        VStack {
            Text(subcategory)
                .font(.headline)
            Text("\(itemCount)")
                .font(.caption)
                .padding(5)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .offset(x: 50, y: -50)
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
