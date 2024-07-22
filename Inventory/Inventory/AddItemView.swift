//
//  AddItemView.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var imageName: String = ""
    @State private var showImagePicker = false
    @StateObject var viewModel: InventoryViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name des Inventars")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Anzahl")) {
                    TextField("Anzahl", text: $quantity)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Bilder")) {
                    HStack {
                        Text(imageName.isEmpty ? "Suche ein Bild" : imageName)
                        Spacer()
                        Button(action: {
                            showImagePicker.toggle()
                        }) {
                            Image(systemName: "photo")
                        }
                    }
                }
            }
            .navigationBarTitle("Add Item", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                if let quantity = Int64(quantity), !imageName.isEmpty {
                    viewModel.addInventoryItem(name: name, quantity: quantity, imageName: imageName)
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(selectedImageName: $imageName)
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(viewModel: InventoryViewModel())
    }
}
