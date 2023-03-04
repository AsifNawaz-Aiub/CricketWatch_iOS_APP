//
//  PlayerDetailInfoModel.swift
//  CricketWatch
//
//  Created by BJIT on 21/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playerData = try? JSONDecoder().decode(PlayerData.self, from: jsonData)

import Foundation

// MARK: - PlayerData
struct PlayerData: Codable {
    let data: PlayerDetail
}

// MARK: - DataClass
struct PlayerDetail: Codable {
    let resource: String
    let id, countryID: Int
    let firstname, lastname, fullname: String?
    let imagePath: String
    let dateofbirth, gender, battingstyle: String
    let bowlingstyle: String?
    let position: Position
    let country: Country
//    let updatedAt: String
    let career: [Career]
//    let teams: [TeamV2]
//    let currentteams: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position, country
        case career
//        case updatedAt = "updated_at"
//        case career, teams, currentteams
    }
}

// MARK: - Career
struct Career: Codable {
    let resource: String
    let type: TypeEnum
    let seasonID, playerID: Int
    let bowling:  CareerStatsBowling?
    let batting: CareerStats?
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case resource, type
        case seasonID = "season_id"
        case playerID = "player_id"
        case bowling, batting
        case updatedAt = "updated_at"
    }
}

enum CareerResource: String, Codable {
    case careers = "careers"
}

enum TypeEnum: String, Codable {
    case odi = "ODI"
    case t10 = "T10"
    case t20 = "T20"
    case t20I = "T20I"
    case test5Day = "Test/5day"
    case fourDay = "4day"
    case test = "Test"
    case listA = "List A"
    
}


enum Name: String, Codable {
    case adelaideStrikers = "Adelaide Strikers"
    case bangladesh = "Bangladesh"
    case melbourneRenegades = "Melbourne Renegades"
}



// MARK: - Team
struct TeamV2: Codable {
    let resource: String
    let id: Int
    let name: String?
    let code: String?
    let imagePath: String
    let countryID: Int
    let nationalTeam: Bool
    let updatedAt: String?
    let inSquad: InSquad

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case imagePath = "image_path"
        case countryID = "country_id"
        case nationalTeam = "national_team"
        case updatedAt = "updated_at"
        case inSquad = "in_squad"
    }
}



// MARK: - InSquad
struct InSquad: Codable {
    let seasonID, leagueID: Int

    enum CodingKeys: String, CodingKey {
        case seasonID = "season_id"
        case leagueID = "league_id"
    }
}



struct CareerStats: Codable{
    var matches: Double = 0.0
    var innings: Double = 0.00
    var runs_scored: Double = 0.00
    var not_outs: Double = 0.00
    var highest_inning_score: Double = 0.00
    var strike_rate: Double? = 0.00
    
    var balls_faced: Double = 0.00
    var average: Double = 0.00
    var four_x: Double = 0.00
    var six_x: Double = 0.00
    
    var hundreds: Double = 0.00
    var fifties: Double = 0.00
}
struct CareerStatsBowling: Codable{
    var matches: Double = 0.0
    var innings: Double = 0.00
    var overs: Double = 0.00
    var econ_rate: Double = 0.00
    var medians: Double = 0.00
    var runs: Double = 0.00
    
    var wickets: Double = 0.00
    var wide: Double = 0.00
    var noball: Double = 0.00
 
}


struct PlayerBattingBowlingCareer{
    var batting: [TypeEnum: CareerStats] = [:]
    var bowling: [TypeEnum: CareerStatsBowling] = [:]
}
