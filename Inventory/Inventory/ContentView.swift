//
//  ContentView.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = InventoryViewModel()
    @State private var showAddItemView = false

    // Define the columns for the grid
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.inventoryItems.indices, id: \.self) { index in
                        let item = viewModel.inventoryItems[index]
                        VStack {
                            NavigationLink(destination: DetailView(viewModel: viewModel, item: item)) {
                                VStack {
                                    // Display image with a fixed size
                                    if let imageData = item.image, let image = UIImage(data: imageData) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                    } else {
                                        Image("inventar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                    }
                                    
                                    // Conditional MarqueeText
                                    if (item.name ?? "").count > 12 {
                                        MarqueeText(text: item.name ?? "Unknown", font: .headline, foregroundColor: .primary, speed: 0.1)
                                            .frame(width: 120, height: 20)
                                    } else {
                                        Text(item.name ?? "Unknown")
                                            .font(.headline)
                                            .lineLimit(1)
                                          //  .truncationMode(.tail)
                                            .frame(width: 120)
                                    }
                                    
                                    Text("\(item.quantity)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            }
                            .contextMenu {
                                Button(action: {
                                    viewModel.deleteInventoryItem(at: IndexSet(integer: index))
                                }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .frame(width: 150, height: 200)
                    }
                }
                .padding([.horizontal, .top], 20)
            }
            .navigationBarTitle("Inventory")
            .navigationBarItems(trailing: Button(action: {
                showAddItemView = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showAddItemView) {
            AddItemView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
