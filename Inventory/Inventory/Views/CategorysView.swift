//
//  CategorysView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct CategorysView: View {
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var showAddCategory = false

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
                        ForEach(viewModel.categories) { category in
                            NavigationLink(destination: SubcategoryView(category: category)) {
                                CategoryItemView(category: category)
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Hauptkategorien")
                        .font(.custom("Georgia", size: 28))
                        .foregroundColor(.gray)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddCategory.toggle()
                    }) {
                        Image(systemName: "plus")
                           
                    }
                    .sheet(isPresented: $showAddCategory) {
                        AddCategoryView(viewModel: viewModel)
                    }
                }
            }
            .onAppear {
                viewModel.fetchCategories()
            }
        }
    }
}
