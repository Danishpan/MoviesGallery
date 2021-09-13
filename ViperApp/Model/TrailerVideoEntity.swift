//
//  TrailerVideoEntity.swift
//  ViperApp
//
//  Created by Даир Алаев on 13.06.2021.
//

import Foundation

struct TrailerVideoEntity: Decodable {
    let results: [Video]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    struct Video: Decodable {
        let key: String?
        let site: String?
        let type: String?
        
        enum CodingKeys: String, CodingKey {
            case key
            case site
            case type
        }
    }
}
