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
        return Image("inventar")
    }

    var body: some View {
        Form {
            Section(header: Text("Name des Inventars")) {
                TextField("Name", text: $name)
            }
            Section(header: Text("Anzahl")) {
                TextField("Anzahl", text: $quantity)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Bild")) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
        }
        .navigationBarTitle("Detail meines Inventars", displayMode: .inline)
        .navigationBarItems(trailing: Button("Update") {
            if let newQuantity = Int64(quantity), !imageName.isEmpty {
                viewModel.updateInventoryItem(item: item, name: name, quantity: newQuantity, imageName: imageName)
            }
        })
        .onAppear {
            name = item.name ?? ""
            quantity = "\(item.quantity)"
            imageName = "inventar"
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
