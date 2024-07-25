//
//  AddCategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct AddCategoryView: View {
    @ObservedObject var viewModel: InventoryViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var imageName = ""
    @State private var subcategories: [String] = []
    @State private var newSubcategory = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Kategorie Name")) {
                    TextField("Name", text: $name)
                    
                }
                
                Section(header: Text("Unterkategorien")) {
                    ForEach(subcategories, id: \.self) { subcategory in
                        Text(subcategory)
                    }
                    TextField("Neue Unterkategorie", text: $newSubcategory)
                    Button(action: {
                        if !newSubcategory.isEmpty {
                            subcategories.append(newSubcategory)
                            newSubcategory = ""
                        }
                    }) {
                        Text("Hinzufügen")
                    }
                }
                
                Button(action: {
                    viewModel.addCategory(name: name, imageName: imageName, subcategories: subcategories)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Füge deine Kategorie hinzu")
                }
            }
            .navigationBarTitle("Kategorie hinzufügen")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Abbrechen")
            })
        }
    }
}
