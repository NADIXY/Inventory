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
    @StateObject var viewModel: InventoryViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Item Name")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Quantity")) {
                    TextField("Quantity", text: $quantity)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Image Name")) {
                    TextField("Image Name", text: $imageName)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
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
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(viewModel: InventoryViewModel())
    }
}
