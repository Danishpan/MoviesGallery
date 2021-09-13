//
//  MovieDetailsEntity.swift
//  TrendingMovies
//
//  Created by Даир Алаев on 25.04.2021.
//

import Foundation

struct MovieDetailsEntity: Decodable {
        
        let id: Int?
        let poster: String?
        let title: String
        let releaseDate: String
        let overview: String
        let rating: Double
        
        enum CodingKeys: String, CodingKey {
            case id
            case poster = "backdrop_path"
            case title = "original_title"
            case releaseDate = "release_date"
            case overview
            case rating = "vote_average"
        }
}
