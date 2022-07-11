//
//  MoviesRepositoryImpl.swift
//  Movies
//
//  Created by Pham Trung Huy on 05/07/2022.
//

import Foundation

final class MoviesRepository {

}

extension MoviesRepository: MoviesRepositoryProtocol {
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        APICaller.shared.getMovie(with: query, completion: completion)
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.getTrendingMovies(completion: completion)
    }

    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.getTrendingTvs(completion: completion)
    }

    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.getUpcomingMovies(completion: completion)
    }

    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.getPopular(completion: completion)
    }

    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.getTopRated(completion: completion)
    }

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.getDiscoverMovies(completion: completion)
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        APICaller.shared.search(with: query, completion: completion)
    }
}
