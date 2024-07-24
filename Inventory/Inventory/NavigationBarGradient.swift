//
//  NavigationBarGradient.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct NavigationBarGradient: View {
    var title: String
    var gradientColors: [Color]

    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
                .frame(height: 100) // Höhe der NavigationBar anpassen
                .edgesIgnoringSafeArea(.top)
                .overlay(
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    , alignment: .center
                )
            Spacer()
        }
    }
}
