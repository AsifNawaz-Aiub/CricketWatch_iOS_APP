//
//  PlayerModel.swift
//  CricketWatch
//
//  Created by BJIT on 19/2/23.
//

import Foundation

// MARK: - PlayerData
struct ShortPlayerData: Codable {
    let data: [PlayerShortInfo]
}

// MARK: - Datum
struct PlayerShortInfo: Codable {
    let resource: String
    let id: Int
    let fullname: String
    let image_path: String?
    let country: Country
    //let position: Position?
    let updated_at: String?
}
