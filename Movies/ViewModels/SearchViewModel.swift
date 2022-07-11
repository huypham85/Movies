//
//  SearchViewModel.swift
//  Movies
//
//  Created by Pham Trung Huy on 05/07/2022.
//

import Foundation
import Combine

final class SearchViewModel {
    @Published var discoverTitles: [Title] = []

    @Published var searchedTitles: [Title] = []

    @Published var errorMessage: String = ""

    private let repository: MoviesRepository


    init(repository: MoviesRepository) {
        self.repository = repository
    }

    func fetchDiscoverMovies() {
        repository.getDiscoverMovies { result in
            switch(result) {
            case .success(let titles):
                self.discoverTitles = titles
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        repository.search(with: query, completion: completion)
    }

    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        repository.getMovie(with: query, completion: completion)
    }
}
