//
//  ImagePickerView.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var selectedImageName: String
    @Environment(\.presentationMode) var presentationMode

    
    let imageNames = ["gymnastikmatte", "sportbh", "trinkflasche", "taucherbrille", "gabel", "tablet", "hemden", "betten", "cd", "drum", "smartwatch1", "sofa", "stick", "festplatte" ]

    var body: some View {
        NavigationStack {
            List(imageNames, id: \.self) { imageName in
                Button(action: {
                    selectedImageName = imageName
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text(imageName)
                    }
                }
            }
            .navigationBarTitle("Select Image", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
