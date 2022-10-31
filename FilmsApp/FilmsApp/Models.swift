// Models.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
<<<<<<< HEAD
/// Movies model
=======

>>>>>>> 87a7c29 (Исправил 42/43 замечаний)
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
    let backdropPath: String
    let id: Int
    let overview: String
    let posterPath, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
    }
}

struct TrailerData: Codable {
    let id: Int
    let results: [TrailerResult]
}

struct TrailerResult: Codable {
    let key: String
    let id: String
}

<<<<<<< HEAD
/// Actors model

// MARK: - Welcome

struct Welcome: Codable {
=======
struct ActorResults: Codable {
>>>>>>> 87a7c29 (Исправил 42/43 замечаний)
    let id: Int
    let cast, crew: [Cast]
}

// MARK: - Cast

struct Cast: Codable {
    let id: Int
    let originalName: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalName = "original_name"
        case profilePath = "profile_path"
    }
}
