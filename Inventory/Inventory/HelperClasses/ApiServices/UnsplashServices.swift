//
//  UnsplashServices.swift
//  Inventory
//
//  Created by Lutz Brückner on 26.07.24.
//

import Foundation
import Combine

class UnsplashService: ObservableObject {
    @Published var photos: [UnsplashPhoto] = []
    private var cancellable: AnyCancellable?
    
    private let accessKey = "_UDHotKY1PJ4setjlB5llL_DEKMZaJDW2eB7TReUw74"
    private var currentPage: Int = 1
    
    func fetchPhotos(query: String, page: Int = 1, perPage: Int = 50) {
           let urlString = "https://api.unsplash.com/search/photos?query=\(query)&page=\(page)&per_page=\(perPage)&client_id=\(accessKey)"
        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UnsplashSearchResponse.self, decoder: JSONDecoder())
            .replaceError(with: UnsplashSearchResponse(results: []))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] response in
                self?.photos.append(contentsOf: response.results)
                self?.currentPage = page
                
            })
    }
}

struct UnsplashSearchResponse: Codable {
    let results: [UnsplashPhoto]
}







