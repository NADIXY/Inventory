//
//  SubcategoryItemView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct SubcategoryItemView: View {
    let itemCount: Int
    let subcategory: String
    
   
    var body: some View {
        VStack {
            Text(subcategory)
                .font(.headline)
            Text("\(itemCount)")
                .font(.caption)
                .padding(5)
                .background(Color.white)
                .foregroundColor(.black)
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
