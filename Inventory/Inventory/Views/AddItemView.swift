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
    @State private var showAlert = false
    @ObservedObject var viewModel = InventoryViewModel()
    let category: String
    let subcategory: String

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
                
                ImageRollerView(selectedImageName: $imageName, images: ImageAsset.allCases)
                    .frame(height: 200)
                    .padding()
                    .border(Color.gray.opacity(0.5), width: 1)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        if let quantity = Int64(quantity), !name.isEmpty, !imageName.isEmpty {
                            viewModel.addInventoryItem(name: name, quantity: quantity, imageName: imageName, info: info, category: category, subcategory: subcategory)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            showAlert = true
                        }
                    }) {
                        Text("Speichern")
                            .bold()
                            .foregroundColor(.gray)
                    }
                    .alert(isPresented: $showAlert) {
                                           Alert(
                                               title: Text("Fehler"),
                                               message: Text("Bitte füllen Sie alle Felder aus."),
                                               dismissButton: .default(Text("OK"))
                                           )
                                       }
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Abrechen")
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Inventar hinzufügen", displayMode: .inline)
            
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(viewModel: InventoryViewModel(), category: "Sport", subcategory: "Yoga")
    }
}
