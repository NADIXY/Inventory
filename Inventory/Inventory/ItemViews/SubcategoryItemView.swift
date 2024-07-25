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
                .padding(.bottom, 20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.yellow)
                    .frame(width: rectangleWidth, height: 30)
                Text("\(itemCount)")
                    .font(.caption2)
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
        .foregroundColor(.white)
        .cornerRadius(10)
        .frame(width: 150, height: 150)
        .shadow(radius: 10)
    }
    
    private var rectangleWidth: CGFloat {
        let digitCount = String(itemCount).count
        return CGFloat(40 + digitCount * 10)
    }
}
