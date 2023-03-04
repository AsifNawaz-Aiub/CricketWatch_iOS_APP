//
//  LeagueModel.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import Foundation

// MARK: - LeagueData
struct LeagueData: Codable {
    let data: [AllLeagues]
}

// MARK: - Datum
struct AllLeagues: Codable {
    let resource: String
    let id, seasonID, countryID: Int
    let name, code: String
    let imagePath: String
    let type, updatedAt: String

    enum CodingKeys: String, CodingKey {
          case resource, id
          case seasonID = "season_id"
          case countryID = "country_id"
          case name, code
          case imagePath = "image_path"
          case type
          case updatedAt = "updated_at"
      }
}
