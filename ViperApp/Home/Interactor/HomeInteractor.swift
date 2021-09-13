//
//  HomeHomeInteractor.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import Foundation

class HomeInteractor {

    weak var output: HomeInteractorOutput!

}

extension HomeInteractor: HomeInteractorInput {
    func getTrendingPeople() {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/trending/person/week")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().sync {
                        do {
                            if let data = data {
                                let people = try JSONDecoder().decode(PeopleEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setTrendingPeople(people.people)
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
    
    
    
    func getTrendingMovies() {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/trending/movie/week")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b")
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
