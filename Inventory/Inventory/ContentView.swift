//
//  ContentView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 3.0
    @State private var opacity: Double = 0.0
    @StateObject private var viewModel = InventoryViewModel()
    
    var body: some View {
        Group {
            if isActive {
                CategoryView()
                    .environmentObject(viewModel)
                    
            } else {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("INVENTORY")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .scaleEffect(scale)
                            .opacity(opacity)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2.0)) {
                                    scale = 1.0
                                    opacity = 1.0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    withAnimation {
                                        isActive = true
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(InventoryViewModel())
    }
}
