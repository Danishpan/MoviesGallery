//
//  ReviewEntity.swift
//  ViperApp
//
//  Created by Даир Алаев on 13.06.2021.
//

import Foundation

struct ReviewEntity: Decodable {
    let results: [Review]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    struct Review: Decodable {
        let author_details: Author
        let content: String?
        
        enum CodingKeys: String, CodingKey {
            case author_details
            case content
        }
        
        struct Author: Decodable {
            let username: String?
            let avatar_path: String?
            
            enum CodingKeys: String, CodingKey {
                case username
                case avatar_path
            }
        }
    }
}
