//
//  ImagesEntity.swift
//  ViperApp
//
//  Created by Даир Алаев on 13.06.2021.
//

import Foundation

struct ImagesEntity: Decodable {
    let backdrops: [Image]
    let posters: [Image]
    
    enum CodingKeys: String, CodingKey {
        case backdrops
        case posters
    }
    
    struct Image: Decodable {
        let file_path: String?
        
        enum CodingKeys: String, CodingKey {
            case file_path
        }
    }
}
