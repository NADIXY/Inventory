//
//  AddCategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct AddCategoryView: View {
    @EnvironmentObject var viewModel: InventoryViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var imageName = ""
    @State private var subcategories: [String] = []
    @State private var newSubcategory = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category Details")) {
                    TextField("Name", text: $name)
                    TextField("Image Name", text: $imageName)
                }
                
                Section(header: Text("Subcategories")) {
                    ForEach(subcategories, id: \.self) { subcategory in
                        Text(subcategory)
                    }
                    TextField("New Subcategory", text: $newSubcategory)
                    Button(action: {
                        if !newSubcategory.isEmpty {
                            subcategories.append(newSubcategory)
                            newSubcategory = ""
                        }
                    }) {
                        Text("Add Subcategory")
                    }
                }
                
                Button(action: {
                    viewModel.addCategory(name: name, imageName: imageName, subcategories: subcategories)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            }
            .navigationBarTitle("Add Category")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            })
        }
    }
}
