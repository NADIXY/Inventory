//
//  CategorysView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct CategorysView: View {
    let categories: [Category]
    @State private var showAddCategory = false
    @ObservedObject var viewModel = InventoryViewModel()
    
    let columns = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
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
            .navigationTitle("Hauptkategorien")
            .font(.custom("Georgia", size: 28))
            .foregroundColor(.gray)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddCategory.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .sheet(isPresented: $showAddCategory) {
                        AddCategoryView(viewModel: viewModel)
                    }
                }
            }
        }
    }
}
