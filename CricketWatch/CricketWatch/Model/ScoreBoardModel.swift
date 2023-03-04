// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scoreBoard = try? JSONDecoder().decode(ScoreBoard.self, from: jsonData)

import Foundation

// MARK: - ScoreBoard
struct ScoreBoard: Codable {
    let data: Score
}

// MARK: - DataClass
struct Score: Codable {
//    let resource: String
//    let id: Int
//    let leagueID: Int
//    let seasonID: Int
//    let stageID: Int
//    let round: String
      let localteam: LVTeam
      let visitorteam: LVTeam
//    let startingAt: String
//    let type: String
//    let live: Bool
//    let status: String
//    //let lastPeriod: JSONNull?
//    let note: String
//    //let venueID, tossWonTeamID, winnerTeamID: Int
//    let drawNoresult: JSONNull?
//    //let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int
//    let manOfMatchID: Int?
//    let manOfSeriesID: Int?
//    let totalOversPlayed: Int?
    //let elected: String
    //let superOver, followOn: Bool
//    let localteamDLData, visitorteamDLData: TeamDLData
//    let rpcOvers, rpcTarget: JSONNull?
   // let weatherReport: [JSONAny]
    var batting: [Batting]
    let bowling: [Bowling]
    let runs: [Run]
    let scoreboards: [ScoreboardElement]?
    
    enum CodingKeys: String, CodingKey {
        //case resource, id
        //case leagueID = "league_id"
        //case seasonID = "season_id"
        //case stageID = "stage_id"
        //case round
        case localteam 
        case visitorteam
        //case startingAt = "starting_at"
        //case type, live, status
        //case lastPeriod = "last_period"
        //case note
        //case venueID = "venue_id"
        //case tossWonTeamID = "toss_won_team_id"
        //case winnerTeamID = "winner_team_id"
        //case drawNoresult = "draw_noresult"
        //case firstUmpireID = "first_umpire_id"
        //case secondUmpireID = "second_umpire_id"
        //case tvUmpireID = "tv_umpire_id"
        //case refereeID = "referee_id"
        //case manOfMatchID = "man_of_match_id"
        //case manOfSeriesID = "man_of_series_id"
        //case totalOversPlayed = "total_overs_played"
        //case elected
        //case superOver = "super_over"
        //case followOn = "follow_on"
        //case localteamDLData = "localteam_dl_data"
        //case visitorteamDLData = "visitorteam_dl_data"
        //case rpcOvers = "rpc_overs"
        //case rpcTarget = "rpc_target"
        //case weatherReport = "weather_report"
        case batting
        case bowling
        case runs
        case scoreboards
    }
}

// MARK: - Batting
struct Batting: Codable {
    //    let resource: String
    //    let id, sort, fixtureID, teamID: Int?
    //    let active: Bool?
    let scoreboard: String?
    let playerID, ball, scoreID, score: Int
    let fourX, sixX: Int
    //    let catchStumpPlayerID, runoutByID: Int?
    //    let batsmanoutID: Int?
    //    let bowlingPlayerID: Int?
    //    let fowScore: Int?
    //    let fowBalls: Double?
    let rate: Int
    //    let updatedAt: String?
    let team: Team
    let batsman: Batsman?
    let bowler: Batsman?
    let result: TeamResult
    
    enum CodingKeys: String, CodingKey {
        //case resource, id, sort
        //case fixtureID = "fixture_id"
        //case teamID = "team_id"
        //case active
        case scoreboard
        case playerID = "player_id"
        case ball
        case scoreID = "score_id"
        case score
        case fourX = "four_x"
        case sixX = "six_x"
        //case catchStumpPlayerID = "catch_stump_player_id"
        //case runoutByID = "runout_by_id"
        //case batsmanoutID = "batsmanout_id"
        //case bowlingPlayerID = "bowling_player_id"
        //case fowScore = "fow_score"
        //case fowBalls = "fow_balls"
        case rate
        //case updatedAt = "updated_at"
        case team
        case batsman
        case bowler
        case result
    }
}

// MARK: - Batsman
struct Batsman: Codable {
    let resource: String
    let id, countryID: Int?
    let firstname, lastname, fullname: String?
    let imagePath: String?
    let dateofbirth: String?
    let gender: String?
    let battingstyle: String?
    let bowlingstyle: String?
    let position: Position
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position
        case updatedAt = "updated_at"
    }
}

enum Battingstyle: String, Codable {
    case leftHandBat = "left-hand-bat"
    case rightHandBat = "right-hand-bat"
}

enum Bowlingstyle: String, Codable {
    case leftArmFastMedium = "left-arm-fast-medium"
    case rightArmFastMedium = "right-arm-fast-medium"
    case rightArmOffbreak = "right-arm-offbreak"
    case slowLeftArmOrthodox = "slow-left-arm-orthodox"
}

enum Gender: String, Codable {
    case m = "m"
}

// MARK: - Position
struct Position: Codable {
    let resource: String
    let id: Int
    let name: String?
}

enum PositionName: String, Codable {
    case allrounder = "Allrounder"
    case batsman = "Batsman"
    case bowler = "Bowler"
    case wicketkeeper = "Wicketkeeper"
}

enum PositionResource: String, Codable {
    case positions = "positions"
}

enum BatsmanResource: String, Codable {
    case players = "players"
}

enum BattingResource: String, Codable {
    case battings = "battings"
}

// MARK: - Result
struct TeamResult: Codable {
    let resource: String
    let id: Int
    let name: String
    let runs: Int
    let four, six: Bool
    let bye, legBye, noball, noballRuns: Int
    let isWicket, ball, out: Bool

    enum CodingKeys: String, CodingKey {
        case resource, id, name, runs, four, six, bye
        case legBye = "leg_bye"
        case noball
        case noballRuns = "noball_runs"
        case isWicket = "is_wicket"
        case ball, out
    }
}

enum ResultName: String, Codable {
    case catchOut = "Catch Out"
    case notOut = "Not Out"
    case runOut = "Run Out"
}

enum ResultResource: String, Codable {
    case scores = "scores"
}

enum ScoreboardEnum: String, Codable {
    case s1 = "S1"
    case s2 = "S2"
}

enum Code: String, Codable {
    case bh = "BH"
    case ps = "PS"
}

enum TeamName: String, Codable {
    case brisbaneHeat = "Brisbane Heat"
    case perthScorchers = "Perth Scorchers"
}

enum TeamResource: String, Codable {
    case teams = "teams"
}

enum TeamUpdatedAt: String, Codable {
    case the20181129T114720000000Z = "2018-11-29T11:47:20.000000Z"
    case the20191209T064502000000Z = "2019-12-09T06:45:02.000000Z"
}

enum BattingUpdatedAt: String, Codable {
    case the20230204T115944000000Z = "2023-02-04T11:59:44.000000Z"
}

// MARK: - Bowling
struct Bowling: Codable {
    let resource: String
    let id, sort, fixtureID, teamID: Int
    let active: Bool
    let scoreboard: String
    let playerID: Int
    let overs: Double
    let medians, runs, wickets, wide: Int
    let noball: Int
    let rate: Double
    let updatedAt: String
    let bowler: Batsman
    let team: Team
    enum CodingKeys: String, CodingKey {
        case resource, id, sort
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case active, scoreboard
        case playerID = "player_id"
        case overs, medians, runs, wickets, wide, noball, rate
        case updatedAt = "updated_at"
        case bowler
        case team
    }
}

enum BowlingResource: String, Codable {
    case bowlings = "bowlings"
}






// MARK: - ScoreboardElement
struct ScoreboardElement: Codable {
    let resource: String
    let id, fixtureID, teamID: Int
    let type: String
    let scoreboard: ScoreboardEnum
    let wide, noballRuns, noballBalls, bye: Int
    let legBye, penalty, total: Int
    let overs: Double
    let wickets: Int
    let updatedAt: String
    let team: Team

    enum CodingKeys: String, CodingKey {
        case resource, id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case type, scoreboard, wide
        case noballRuns = "noball_runs"
        case noballBalls = "noball_balls"
        case bye
        case legBye = "leg_bye"
        case penalty, total, overs, wickets
        case updatedAt = "updated_at"
        case team
    }
}




// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scoreBoard = try? JSONDecoder().decode(ScoreBoard.self, from: jsonData)

//import Foundation
//
//// MARK: - ScoreBoard
//struct ScoreBoard: Codable {
//    let data: Score
//}
//
//// MARK: - Datum
//struct Score: Codable {
//    //let resource: DatumResource
//    //let id, leagueID, seasonID, stageID: Int
//   // let round: String?
//    let localteamID: Int
//    let visitorteamID: Int
//    let startingAt: String
//    let type: String?
//    let live: Bool
//    let status: Status
//    //let lastPeriod: JSONNull?
////    let note: String
////    let venueID: Int
////    let tossWonTeamID, winnerTeamID: Int?
////    let drawNoresult: String?
//    //let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
//    //let manOfMatchID, manOfSeriesID, totalOversPlayed: Int?
//    //let elected: Elected?
//    //let superOver, followOn: Bool
//    //let localteamDLData: LocalteamDLData
//    //let visitorteamDLData: VisitorteamDLData
//    //let rpcOvers, rpcTarget: String?
//    //let weatherReport: [JSONAny]
//      let batting: [Batting]
////    let bowling: [Bowling]
////    let runs: [Run]
////    let scoreboards: [ScoreboardElement]
//
//    enum CodingKeys: String, CodingKey {
//        //case resource, id
//        //case leagueID = "league_id"
//        //case seasonID = "season_id"
//        //case stageID = "stage_id"
//        //case round
//        case localteamID = "localteam_id"
//        case visitorteamID = "visitorteam_id"
//        case startingAt = "starting_at"
//        case type, live, status
//        //case lastPeriod = "last_period"
////        case note
////        case venueID = "venue_id"
////        case tossWonTeamID = "toss_won_team_id"
////        case winnerTeamID = "winner_team_id"
////        case drawNoresult = "draw_noresult"
////        case firstUmpireID = "first_umpire_id"
////        case secondUmpireID = "second_umpire_id"
////        case tvUmpireID = "tv_umpire_id"
////        case refereeID = "referee_id"
////        case manOfMatchID = "man_of_match_id"
////        case manOfSeriesID = "man_of_series_id"
////        case totalOversPlayed = "total_overs_played"
////        case elected
////        case superOver = "super_over"
////        case followOn = "follow_on"
////        case localteamDLData = "localteam_dl_data"
////        case visitorteamDLData = "visitorteam_dl_data"
////        case rpcOvers = "rpc_overs"
////        case rpcTarget = "rpc_target"
////        case weatherReport = "weather_report"
//          case batting
//          //case bowling, runs, scoreboards
//    }
//}
//
//// MARK: - Batting
//struct Batting: Codable {
//    let resource: BattingResource
//    let id, sort, fixtureID, teamID: Int
//    let active: Bool
//    let scoreboard: ScoreboardEnum
//    let playerID, ball, scoreID, score: Int
//    let fourX, sixX: Int
//    let catchStumpPlayerID: Int?
//    let runoutByID, batsmanoutID: JSONNull?
//    let bowlingPlayerID, fowScore: Int?
//    let fowBalls: Double?
//    let rate: Double
//    let updatedAt: String
//    let team: Team
//    let batsman: Batsman
//    let bowler: Batsman?
//    let result: TeamResult
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, sort
//        case fixtureID = "fixture_id"
//        case teamID = "team_id"
//        case active, scoreboard
//        case playerID = "player_id"
//        case ball
//        case scoreID = "score_id"
//        case score
//        case fourX = "four_x"
//        case sixX = "six_x"
//        case catchStumpPlayerID = "catch_stump_player_id"
//        case runoutByID = "runout_by_id"
//        case batsmanoutID = "batsmanout_id"
//        case bowlingPlayerID = "bowling_player_id"
//        case fowScore = "fow_score"
//        case fowBalls = "fow_balls"
//        case rate
//        case updatedAt = "updated_at"
//        case team, batsman, bowler, result
//    }
//}
//
//// MARK: - Batsman
//struct Batsman: Codable {
//    let resource: BatsmanResource
//    let id, countryID: Int
//    let firstname, lastname, fullname: String
//    let imagePath: String
//    let dateofbirth: String
//    let gender: Gender
//    let battingstyle: Battingstyle?
//    let bowlingstyle: Bowlingstyle?
//    let position: String
//    let updatedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case countryID = "country_id"
//        case firstname, lastname, fullname
//        case imagePath = "image_path"
//        case dateofbirth, gender, battingstyle, bowlingstyle, position
//        case updatedAt = "updated_at"
//    }
//}
//
//enum Battingstyle: String, Codable {
//    case leftHandBat = "left-hand-bat"
//    case rightHandBat = "right-hand-bat"
//}
//
//enum Bowlingstyle: String, Codable {
//    case empty = ""
//    case leftArmChinaman = "left-arm-chinaman"
//    case leftArmFast = "left-arm-fast"
//    case leftArmFastMedium = "left-arm-fast-medium"
//    case legbreak = "legbreak"
//    case legbreakGoogly = "legbreak-googly"
//    case rightArmFast = "right-arm-fast"
//    case rightArmFastMedium = "right-arm-fast-medium"
//    case rightArmOffbreak = "right-arm-offbreak"
//    case slowLeftArmOrthodox = "slow-left-arm-orthodox"
//}
//
//enum Gender: String, Codable {
//    case m = "m"
//}
//
//// MARK: - Position
//struct Position: Codable {
//    let resource: PositionResource
//    let id: Int
//    let name: PositionName
//}
//
//enum PositionName: String, Codable {
//    case allrounder = "Allrounder"
//    case batsman = "Batsman"
//    case bowler = "Bowler"
//    case wicketkeeper = "Wicketkeeper"
//}
//
//enum PositionResource: String, Codable {
//    case positions = "positions"
//}
//
//enum BatsmanResource: String, Codable {
//    case players = "players"
//}
//
//enum BattingResource: String, Codable {
//    case battings = "battings"
//}
//
//// MARK: - Result
//struct TeamResult: Codable {
//    let resource: ResultResource
//    let id: Int
//    let name: ResultName
//    let runs: Int
//    let four, six: Bool
//    let bye, legBye, noball, noballRuns: Int
//    let isWicket, ball, out: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, name, runs, four, six, bye
//        case legBye = "leg_bye"
//        case noball
//        case noballRuns = "noball_runs"
//        case isWicket = "is_wicket"
//        case ball, out
//    }
//}
//
//enum ResultName: String, Codable {
//    case absent = "Absent"
//    case catchOut = "Catch Out"
//    case catchOutSub = "Catch Out (Sub)"
//    case cleanBowled = "Clean Bowled"
//    case hitWicket = "Hit Wicket"
//    case lbwOut = "LBW OUT"
//    case notOut = "Not Out"
//    case runOut = "Run Out"
//    case stumpOut = "Stump Out"
//    case the1WideStumpOut = "1 Wide + stump Out"
//}
//
//enum ResultResource: String, Codable {
//    case scores = "scores"
//}
//
//enum ScoreboardEnum: String, Codable {
//    case s1 = "S1"
//    case s2 = "S2"
//    case s3 = "S3"
//    case s4 = "S4"
//}
//
//
//enum Code: String, Codable {
//    case afg = "AFG"
//    case aus = "AUS"
//    case bel = "BEL"
//    case bgd = "BGD"
//    case deu = "DEU"
//    case eng = "ENG"
//    case ggy = "GGY"
//    case ind = "IND"
//    case ire = "IRE"
//    case ita = "ITA"
//    case jey = "JEY"
//    case lka = "LKA"
//    case nld = "NLD"
//    case npl = "NPL"
//    case nzl = "NZL"
//    case pak = "PAK"
//    case uae = "UAE"
//    case usa = "USA"
//    case wi = "WI"
//    case zaf = "ZAF"
//    case zim = "ZIM"
//}
//
//enum TeamName: String, Codable {
//    case afghanistan = "Afghanistan"
//    case australia = "Australia"
//    case bangladesh = "Bangladesh"
//    case belgium = "Belgium"
//    case england = "England"
//    case germany = "Germany"
//    case guernsey = "Guernsey"
//    case india = "India"
//    case ireland = "Ireland"
//    case italy = "Italy"
//    case jersey = "Jersey"
//    case nepal = "Nepal"
//    case netherlands = "Netherlands"
//    case newZealand = "New Zealand"
//    case pakistan = "Pakistan"
//    case southAfrica = "South Africa"
//    case sriLanka = "Sri Lanka"
//    case unitedArabEmirates = "United Arab Emirates"
//    case usa = "USA"
//    case westIndies = "West Indies"
//    case zimbabwe = "Zimbabwe"
//}
//
//enum TeamResource: String, Codable {
//    case teams = "teams"
//}
//
//// MARK: - Bowling
//struct Bowling: Codable {
//    let resource: BowlingResource
//    let id, sort, fixtureID, teamID: Int
//    let active: Bool
//    let scoreboard: ScoreboardEnum
//    let playerID: Int
//    let overs: Double
//    let medians, runs, wickets, wide: Int
//    let noball: Int
//    let rate: Double
//    let updatedAt: String
//    let bowler: Batsman
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, sort
//        case fixtureID = "fixture_id"
//        case teamID = "team_id"
//        case active, scoreboard
//        case playerID = "player_id"
//        case overs, medians, runs, wickets, wide, noball, rate
//        case updatedAt = "updated_at"
//        case bowler
//    }
//}
//
//enum BowlingResource: String, Codable {
//    case bowlings = "bowlings"
//}
//
//// MARK: - LocalteamDLData
//struct LocalteamDLData: Codable {
//    let score, overs, wicketsOut: String?
//    let rpcOvers, rpcTargets: String?
//
//    enum CodingKeys: String, CodingKey {
//        case score, overs
//        case wicketsOut = "wickets_out"
//        case rpcOvers = "rpc_overs"
//        case rpcTargets = "rpc_targets"
//    }
//}
//
//enum Round: String, Codable {
//    case onlyT20I = "Only T20I"
//    case the1StT20I = "1st T20I"
//    case the2NdT20I = "2nd T20I"
//    case the3RDT20I = "3rd T20I"
//}
//
//
//// MARK: - ScoreboardElement
//struct ScoreboardElement: Codable {
//    let resource: ScoreboardResource
//    let id, fixtureID, teamID: Int
//    let type: ScoreboardType
//    let scoreboard: ScoreboardEnum
//    let wide, noballRuns, noballBalls, bye: Int
//    let legBye, penalty, total: Int
//    let overs: Double
//    let wickets: Int
//    let updatedAt: String
//    let team: Team
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case fixtureID = "fixture_id"
//        case teamID = "team_id"
//        case type, scoreboard, wide
//        case noballRuns = "noball_runs"
//        case noballBalls = "noball_balls"
//        case bye
//        case legBye = "leg_bye"
//        case penalty, total, overs, wickets
//        case updatedAt = "updated_at"
//        case team
//    }
//}
//
//enum ScoreboardResource: String, Codable {
//    case scoreboards = "scoreboards"
//}
//
//enum ScoreboardType: String, Codable {
//    case extra = "extra"
//    case total = "total"
//}
//
//// MARK: - VisitorteamDLData
//struct VisitorteamDLData: Codable {
//    let score, overs, wicketsOut: String?
//    let totalOversPlayed: String?
//
//    enum CodingKeys: String, CodingKey {
//        case score, overs
//        case wicketsOut = "wickets_out"
//        case totalOversPlayed = "total_overs_played"
//    }
//}
//
//
//
//
//
//
