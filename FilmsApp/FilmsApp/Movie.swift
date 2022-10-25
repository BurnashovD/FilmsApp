//
//  Movie.swift
//  FilmsApp
//
//  Created by Daniil on 25.10.2022.
//

import Foundation

struct Movie: Codable {
    let filmName: String
    let mainImageName: String
    let overview: String
    let filmVote: Int
    let realeaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case filmName = "title"
        case mainImageName = "poster_path"
        case overview
        case filmVote = "vote_average"
        case realeaseDate = "release_date"
    }
}
