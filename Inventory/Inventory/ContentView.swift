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

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.inventoryItems) { item in
                    NavigationLink(destination: DetailView(viewModel: viewModel, item: item)) {
                        HStack {
                            if let imageData = item.image, let image = UIImage(data: imageData) {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }
                            VStack(alignment: .leading) {
                                Text(item.name ?? "Unknown")
                                Text("\(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete { offsets in
                    viewModel.deleteInventoryItem(at: offsets)
                }
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
