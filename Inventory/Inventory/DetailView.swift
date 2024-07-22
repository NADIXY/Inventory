//
//  DetailView.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: InventoryViewModel
    var item: InventoryItem
    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var imageName: String = ""
    
    private var image: Image {
        if let imageDate = item.image, let uiImage = UIImage(data: imageDate) {
            return Image(uiImage: uiImage)
        }
        return Image("PlaceholderImage")
    }

    var body: some View {
        Form {
            Section(header: Text("Item Name")) {
                TextField("Name", text: $name)
            }
            Section(header: Text("Quantity")) {
                TextField("Quantity", text: $quantity)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Image")) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
        }
        .navigationBarTitle("Item Details", displayMode: .inline)
        .navigationBarItems(trailing: Button("Save") {
            if let newQuantity = Int64(quantity), !imageName.isEmpty {
                viewModel.updateInventoryItem(item: item, name: name, quantity: newQuantity, imageName: imageName)
            }
        })
        .onAppear {
            name = item.name ?? ""
            quantity = "\(item.quantity)"
            imageName = "Placeholder Image Name"
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InventoryViewModel()
        let item = InventoryItem()
        item.name = "Sample Item"
        item.quantity = 10
        item.image = UIImage(named: "sampleImage")?.pngData()
        return DetailView(viewModel: viewModel, item: item)
    }
}
