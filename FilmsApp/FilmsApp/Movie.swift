//
//  Movie.swift
//  FilmsApp
//
//  Created by Daniil on 25.10.2022.
//

import Foundation

//struct MovieResult: Codable {
//    var result: [Movie]
//}
//
//struct Movie: Codable {
//    let filmName: String
//    let mainImageName: String
//    let overview: String
//    let filmVote: Int
//    let realeaseDate: String
//
//    enum CodingKeys: String, CodingKey {
//        case filmName = "title"
//        case mainImageName = "poster_path"
//        case overview
//        case filmVote = "vote_average"
//        case realeaseDate = "release_date"
//    }
//}

// MARK: - Welcome
struct MovieResult: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}



