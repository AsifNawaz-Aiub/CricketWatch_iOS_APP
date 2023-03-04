//
//  RankingModel.swift
//  CricketWatch
//
//  Created by BJIT on 24/2/23.
//
import Foundation

// MARK: - RankingData
struct RankingData: Codable {
    let data: [TeamRanking]
}

// MARK: - Datum
struct TeamRanking: Codable {
    let resource, type: String
    let position, points, rating: JSONNull?
    let gender, updatedAt: String
    let team: [TeamV3]

    enum CodingKeys: String, CodingKey {
        case resource, type, position, points, rating, gender
        case updatedAt = "updated_at"
        case team
    }
}

// MARK: - Team
struct TeamV3: Codable {
    let resource: Resource
    let id: Int
    let name, code: String
    let imagePath: String
    let countryID: Int
    let nationalTeam: Bool
    let position: Int
    let updatedAt: String
    let ranking: Ranking

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case imagePath = "image_path"
        case countryID = "country_id"
        case nationalTeam = "national_team"
        case position
        case updatedAt = "updated_at"
        case ranking
    }
}

// MARK: - Ranking
struct Ranking: Codable {
    let position, matches, points, rating: Int
}

enum Resource: String, Codable {
    case teams = "teams"
}

