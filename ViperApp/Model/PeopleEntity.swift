//
//  PeopleEntity.swift
//  ViperApp
//
//  Created by Даир Алаев on 14.06.2021.
//

import Foundation

struct PeopleEntity: Decodable {
    let people: [Person]
    
    enum CodingKeys: String, CodingKey {
        case people = "results"
    }
    
    struct Person: Decodable {
        let name: String
        let profile: String
        let dep: String
        let movies: [TrendingMovieEntity.Movie]
        
        enum CodingKeys: String, CodingKey {
            case name
            case dep = "known_for_department"
            case profile = "profile_path"
            case movies = "known_for"
        }
        
        struct Movie: Decodable {
            let id: Int
            let poster: String?
            let title: String?
            let releaseDate: String?
            let rating: Double?
            
            enum CodingKeys: String, CodingKey {
                case id
                case poster = "poster_path"
                case title = "title"
                case releaseDate = "release_date"
                case rating = "vote_average"
            }
        }
    }
}
