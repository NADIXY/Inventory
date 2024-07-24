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
    @State private var info: String = ""
    @State private var imageName: String = ""
    @State private var showImageRoller = false
    @StateObject var viewModel: InventoryViewModel
    let category: String
    let subcategory: String
    
    // Bildnamen aus der Enum abrufen
    var imageNames: [String] {
        ImageAsset.allCases.map { $0.name }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Name des Inventars")) {
                        TextField("Name", text: $name)
                    }
                    Section(header: Text("Information")) {
                        TextField("Info", text: $info)
                    }
                    Section(header: Text("Anzahl")) {
                        TextField("Anzahl", text: $quantity)
                            .keyboardType(.numberPad)
                    }
                }
                
                
                ImageRollerView(selectedImageName: $imageName, imageNames: imageNames)
                    .frame(height: 200)
                    .padding()
                    .border(Color.gray.opacity(0.5), width: 1) 
                
                Spacer()
                
                HStack {
                    Button(action: {
                        if let quantity = Int64(quantity), !imageName.isEmpty {
                            viewModel.addInventoryItem(name: name, quantity: quantity, imageName: imageName, info: info, category: category, subcategory: subcategory)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text("Save")
                            .bold()
                    }
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .bold()
                    }
                }
                .padding()
            }
            .navigationBarTitle("Add Item", displayMode: .inline)
        }
    }
}
