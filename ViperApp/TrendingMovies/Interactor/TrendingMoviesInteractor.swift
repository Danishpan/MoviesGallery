//
//  TrendingMoviesTrendingMoviesInteractor.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import Foundation

class TrendingMoviesInteractor {

    

    weak var output: TrendingMoviesInteractorOutput!

}

extension TrendingMoviesInteractor: TrendingMoviesInteractorInput {
    func getPlayingMovies(_ pageNumber: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/now_playing")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
            URLQueryItem(name: "page", value: "\(pageNumber)")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().sync {
                        do {
                            if let data = data {
                                let movies = try JSONDecoder().decode(TrendingMovieEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setPlayingMovies(movies.movies)
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    
    
    func getSoonMovies(_ pageNumber: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/upcoming")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
            URLQueryItem(name: "page", value: "\(pageNumber)")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().sync {
                        do {
                            if let data = data {
                                let movies = try JSONDecoder().decode(TrendingMovieEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setSoonMovies(movies.movies)
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    
    func getTrendingMovies(_ pageNumber: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/trending/movie/week")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
            URLQueryItem(name: "page", value: "\(pageNumber)")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().sync {
                        do {
                            if let data = data {
                                let movies = try JSONDecoder().decode(TrendingMovieEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setTrendingMovies(movies.movies)
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
}
