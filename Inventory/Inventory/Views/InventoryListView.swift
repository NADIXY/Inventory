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
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var showAddItemView = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    List {
                        ForEach(viewModel.inventoryItems) { item in
                            NavigationLink(destination: DetailView(viewModel: viewModel, item: item)) {
                                HStack {
                                    // Image
                                    if let imageData = item.image, let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .clipped()
                                    } else {
                                        Image("inventar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .clipped()
                                    }
                                    
                                    // Text
                                    VStack(alignment: .leading) {
                                        Text("Inventar: \(item.name ?? "Unbekannt")")
                                            .font(.headline)
                                            .padding(.bottom, 2)
                                        Text("Info: \(item.info ?? "Unbekannt")")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 2)
                                        Text("Anzahl: \(item.quantity)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.leading, 10)
                                }
                                .padding(.vertical, 5)
                                .background(Color.white.opacity(0.8)) // Transparenter Hintergrund
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        .onDelete { indices in
                            let deletedItems = indices.map { viewModel.inventoryItems[$0] }
                            viewModel.deleteInventoryItem(items: deletedItems, category: category, subcategory: subcategory)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text(subcategory)
                                .font(.custom("Georgia", size: 28))
                                .foregroundColor(.gray)
                        }
                        
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
            }
            .onAppear {
                viewModel.fetchInventoryItems(category: category, subcategory: subcategory)
            }
        }
    }
}

struct InventoryListView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(category: "Sport", subcategory: "Yoga")
    }
}
