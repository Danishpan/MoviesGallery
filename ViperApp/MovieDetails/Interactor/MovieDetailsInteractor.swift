//
//  MovieDetailsMovieDetailsInteractor.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import Foundation

class MovieDetailsInteractor  {

    weak var output: MovieDetailsInteractorOutput!

}

extension MovieDetailsInteractor: MovieDetailsInteractorInput {
    func getSimilarMovies(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)/similar")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
        ]
        print("entered reviews")
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let movies = try JSONDecoder().decode(TrendingMovieEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setSimilarMovies(movies.movies)
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
    
    
    
    func getImages(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)/images")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
        ]
        print("entered reviews")
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let images = try JSONDecoder().decode(ImagesEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setImages(images.backdrops, images.posters)
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
    
    
    
    func getReviews(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)/reviews")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
        ]
        print("entered reviews")
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let reviews = try JSONDecoder().decode(ReviewEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setReviews(reviews.results)
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
    
    func getVideoURL(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)/videos")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
        ]
        print("entered video")
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                print(url)
                                let video = try JSONDecoder().decode(TrailerVideoEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setVideoURL(video.results)
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
    
    func getMovieDetails(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "6f96f5d993b7a512f99ce8a69576284b"),
        ]
        
        print("entered details")

        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let movieDetails = try JSONDecoder().decode(MovieDetailsEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self.output.setMovieDetails(movieDetails)
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
