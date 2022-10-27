//
//  Movie.swift
//  FilmsApp
//
//  Created by Daniil on 25.10.2022.
//

import Foundation

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


// MARK: - Welcome
struct TrailerData: Codable {
    let id: Int
    let results: [TrailerResult]
}

// MARK: - Result
struct TrailerResult: Codable {
    let iso639_1, iso3166_1, name, key: String
    let publishedAt, site: String
    let size: Int
    let type: String
    let official: Bool
    let id: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key
        case publishedAt = "published_at"
        case site, size, type, official, id
    }
}
