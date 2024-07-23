//
//  InventoryListView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct InventoryListView: View {
    let category: String
    let subcategory: String
    @StateObject private var viewModel = InventoryViewModel()
    @State private var showAddItemView = false
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.inventoryItems) { item in
                    NavigationLink(destination: DetailView(viewModel: viewModel, item: item)) {
                        HStack {
                            if let imageData = item.image, let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                            } else {
                                Image("inventar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                            }
                            VStack(alignment: .leading) {
                                Text(item.name ?? "Unknown")
                                    .font(.headline)
                                Text("\(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete { indices in
                    viewModel.deleteInventoryItem(at: indices)
                }
            }
            .navigationTitle(subcategory)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddItemView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView(viewModel: viewModel, category: category, subcategory: subcategory)
            }
        }
        .onAppear {
            viewModel.fetchInventoryItems(category: category, subcategory: subcategory)
        }
    }
}

struct InventoryListView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(category: "Sport", subcategory: "Yoga")
    }
}
