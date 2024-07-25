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
    @State private var showAlert = false
    @State private var alertText = ""
    
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
                                    if !name.isEmpty && !imageName.isEmpty && !subcategories.isEmpty {
                                        viewModel.addCategory(name: name, imageName: imageName, subcategories: subcategories)
                                        presentationMode.wrappedValue.dismiss()
                                    } else {
                                        alertText = "Bitte füllen Sie alle Felder aus."
                                        showAlert = true
                                    }
                                }) {
                                    Text("Füge deine Kategorie hinzu")
                                }
                                .alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("Fehler"),
                                        message: Text(alertText),
                                        dismissButton: .default(Text("OK"))
                                    )
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
