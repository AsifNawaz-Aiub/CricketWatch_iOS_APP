////
////  LineupModel.swift
////  CricketWatch
////
////  Created by BJIT on 18/2/23.
////
//
//import Foundation
//
//
//// MARK: - Lineup
//struct LineupData: Codable {
//    let data: Lineup
//}
//
//// MARK: - DataClass
//struct Lineup: Codable {
//   let resource: String
////    let id, leagueID, seasonID, stageID: Int
////    let round: String
////    let localteamID, visitorteamID, manOfMatchID: Int?
////    let manOfSeriesID: Int?
//      let lineupOfBothTeam: [LineupElement]
//
//    enum CodingKeys: String, CodingKey {
//          case resource
//        //case id
////        case leagueID = "league_id"
////        case seasonID = "season_id"
////        case stageID = "stage_id"
////        case round
////        case localteamID = "localteam_id"
////        case visitorteamID = "visitorteam_id"
////        case manOfMatchID = "man_of_match_id"
////        case manOfSeriesID = "man_of_series_id"
//          case lineupOfBothTeam
//    }
//}
//
//// MARK: - LineupElement
//struct LineupElement: Codable {
//     //let resource: String?
//      let id, country_id: Int
////    let firstname, lastname, fullname: String?
////    let image_path: String?
////    let dateofbirth: String?
////    let gender: String?
////    let battingstyle: String?
////    let bowlingstyle: String?
////    let position: Position?
//   // let updated_at: String?
//   // let lineup: LineupLineup?
//
//    enum CodingKeys: String, CodingKey {
//       // case resource
//        case id
//        case country_id = "country_id"
////        case firstname, lastname, fullname
////        case image_path = "image_path"
//        //case dateofbirth, gender, battingstyle, bowlingstyle, position
//        //case updated_at = "updated_at"
//        //case lineup
//    }
//}
//
//// MARK: - LineupLineup
//struct LineupLineup: Codable {
//    let teamID: Int
//    let captain, wicketkeeper, substitution: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case teamID = "team_id"
//        case captain, wicketkeeper, substitution
//    }
//}
//
//enum LineupResource: String, Codable {
//    case players = "players"
//}
//
//// MARK: - Encode/decode helpers

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let lineup = try? JSONDecoder().decode(Lineup.self, from: jsonData)

import Foundation

// MARK: - Lineup
struct LineupData: Codable {
    let data: Lineup
}

// MARK: - DataClass
struct Lineup : Codable{
    let resource: String
    let lineup: [LineupElement]
}

// MARK: - LineupElement: Codable
struct LineupElement: Codable {
    let resource: String?
    let id, country_id: Int?
    let firstname, lastname, fullname: String?
    let image_path: String?
    let dateofbirth: String?
    //let gender: Gender
    let battingstyle: String?
    let bowlingstyle: String?
    let position: Position?
    //let updatedAt: String
    let lineup: LineupLineup?
}


// MARK: - LineupLineup
struct LineupLineup: Codable {
    let teamID: Int?
    let captain, wicketkeeper, substitution: Bool?
}

// MARK: - Position


enum LineupResource: Codable {
    case players
}
