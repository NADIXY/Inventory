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
    @State private var selectedImageName: String = ""
    @State private var showImagePicker: Bool = false

    private var image: Image {
        if let imageData = item.image, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else if let uiImage = UIImage(named: selectedImageName) {
            return Image(uiImage: uiImage)
        }
        return Image("inventar") // Default-Bild
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
                Button("Ändere Bild") {
                    showImagePicker = true
                }
            }
        }
        .navigationBarTitle("Detail meines Inventars", displayMode: .inline)
        .navigationBarItems(trailing: Button("Update") {
            if let newQuantity = Int64(quantity) {
                viewModel.updateInventoryItem(item: item, name: name, quantity: newQuantity, imageName: selectedImageName)
            }
        })
        .onAppear {
            name = item.name ?? ""
            quantity = "\(item.quantity)"
            selectedImageName = "" // Hier kannst du einen Standardwert setzen, wenn benötigt
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(selectedImageName: $selectedImageName)
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
