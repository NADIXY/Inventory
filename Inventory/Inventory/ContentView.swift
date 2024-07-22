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
        GridItem(.flexible()),
        GridItem(.flexible())
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
                                    MarqueeText(text: item.name ?? "Unbekannt", font: .headline, foregroundColor: .primary, speed: 50)
                                        .frame(width: 150)
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
                                    Label("Eintrag entfernen", systemImage: "trash")
                                }
                            }
                        }
                        .frame(width: 150, height: 200)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Mein Inventar")
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
