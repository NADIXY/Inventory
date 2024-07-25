//
//  ImageRollerView.swift
//  Inventory
//
//  Created by Lutz Brückner on 24.07.24.
//

import SwiftUI

struct ImageRollerView: View {
    @Binding var selectedImageName: String
    @StateObject private var unsplashService = UnsplashService()
    var searchQuery: String
    
    init(selectedImageName: Binding<String>, searchQuery: String) {
        _selectedImageName = selectedImageName
        self.searchQuery = searchQuery
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(unsplashService.photos) { photo in
                        VStack {
                            AsyncImage(url: URL(string: photo.imageUrl)) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Rectangle())
                                    .onTapGesture {
                                        selectedImageName = photo.id
                                    }
                                    .border(selectedImageName == photo.id ? Color.blue : Color.clear, width: 2)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 100)
                            }
                            Text(photo.alt_description ?? "No description")
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .onAppear {
            unsplashService.fetchPhotos(query: searchQuery, page: 1, perPage: 50 )
        }
    }
}
