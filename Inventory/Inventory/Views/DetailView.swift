//
//  DetailView.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = InventoryViewModel()
    var item: InventoryItem
    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var info: String = ""
    @State private var selectedImageName: String = ""
    @Environment(\.presentationMode) var presentationMode // Use presentation mode to dismiss view

    var body: some View {
        Form {
            Section(header: Text("Name des Inventars")) {
                TextField("Name", text: $name)
            }
            Section(header: Text("Info des Inventars")) {
                TextField("Info", text: $info)
            }
            Section(header: Text("Anzahl")) {
                TextField("Anzahl", text: $quantity)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Bild")) {
                // Use ImageRollerView to select an image
                ImageRollerView(selectedImageName: $selectedImageName, images: ImageAsset.allCases)
                    .frame(height: 200)
                
                // Show the selected image or default image if none is selected
                if let uiImage = UIImage(named: selectedImageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                } else {
                    Image("default") // Default image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                }
            }
        }
        .navigationBarTitle("Detail meines Inventars", displayMode: .inline)
        .navigationBarItems(trailing: Button("Update") {
            if let newQuantity = Int64(quantity) {
                let imageNameToSave = selectedImageName.isEmpty ? "default" : selectedImageName
                viewModel.updateInventoryItem(item: item, name: name, quantity: newQuantity, imageName: imageNameToSave, info: info)
                viewModel.fetchInventoryItems(category: item.category ?? "")
                presentationMode.wrappedValue.dismiss() // Close the view
            }
        })
        .onAppear {
            name = item.name ?? ""
            quantity = "\(item.quantity)"
            info = item.info ?? ""
            selectedImageName = item.imageName ?? "" // Set the selected image name
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InventoryViewModel()
        let item = InventoryItem()
        item.name = "Sample Item"
        item.quantity = 10
        item.imageName = "sampleImage" // Example image name
        return DetailView(viewModel: viewModel, item: item)
    }
}
