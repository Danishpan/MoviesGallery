//
//  SearchSearchInteractor.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import Foundation

class SearchInteractor  {

    weak var output: SearchInteractorOutput!

}

extension SearchInteractor: SearchInteractorInput {
    func getResults(_ pageNumber: Int, _ query: String) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/search/movie")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
            URLQueryItem(name: "page", value: "\(pageNumber)"),
            URLQueryItem(name: "query", value: "\(query)")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().sync {
                        do {
                            if let data = data {
                                let movies = try JSONDecoder().decode(TrendingMovieEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setResults(movies.movies)
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
