//
//  CategorysView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct CategorysView: View {
    let categories: [Category]
    let columns = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150), spacing: 20)
        ]
   
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.teal]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(categories) { category in
                            NavigationLink(destination: SubcategoryView(category: category)) {
                                CategoryItemView(category: category)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Kategorien")
        }
    }
}

