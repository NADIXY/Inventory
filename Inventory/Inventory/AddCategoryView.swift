//
//  AddCategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var imageName = ""
    @State private var subcategories = [String]()
    @State private var subcategoryInput = ""
    @ObservedObject var viewModel: InventoryViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Catergory Details")) {
                    TextField("Name", text: $name)
                    TextField("Image Name", text: $imageName)
                }
                
                Section(header: Text("Subcategories")) {
                    HStack {
                        TextField("Subcategory", text: $subcategoryInput)
                        Button(action: {
                            if !subcategoryInput.isEmpty {
                                subcategories.append(subcategoryInput)
                                subcategoryInput = ""
                            }
                        }) {
                            Text("Add")
                        }
                    }
                    
                    List {
                        ForEach(subcategories, id: \.self) { subcategory in
                            Text(subcategory)
                        }
                        .onDelete(perform: deleteSubcategory)
                    }
                }
            }
                            .navigationTitle("Kategorie hinzufügen")
                            .navigationBarItems(trailing: Button("Save") {
                                viewModel.addCategory(name: name, imageName: imageName, subcategories: subcategories)
                                presentationMode.wrappedValue.dismiss()
                            })
                                  
        }
    }
    
    private func deleteSubcategory(at offsets: IndexSet) {
        subcategories.remove(atOffsets: offsets)
    }
}



