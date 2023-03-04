// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ShortFixtureList: Codable {
    let data: [ShortFixture]
   // let links: Links
    //let meta: Meta
}

// MARK: - Datum
struct ShortFixture: Codable {
    let resource: String
    let id, leagueID, seasonID, stageID: Int
    let round: String
    let localteamID, visitorteamID: Int
    let startingAt: String
    let type: DatumType
    let live: Bool
    let status: Status
    let lastPeriod: JSONNull?
    let note: String
    let venueID, tossWonTeamID, winnerTeamID: Int?
    let drawNoresult: String?
    let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
    let manOfMatchID, manOfSeriesID, totalOversPlayed: Int?
    let elected: Elected?
    let superOver, followOn: Bool
    let localteamDLData, visitorteamDLData: TeamDLData?
    let rpcOvers, rpcTarget: String?
    let weatherReport: [JSONAny]
    let league: League
    let season: Season
    let localteam, visitorteam: LVTeam
    let runs: [Run]
    let winnerteam, tosswon: League?
    let venue: Venue?
    let stage: League

    enum CodingKeys: String, CodingKey {
        case resource, id
        case leagueID = "league_id"
        case seasonID = "season_id"
        case stageID = "stage_id"
        case round
        case localteamID = "localteam_id"
        case visitorteamID = "visitorteam_id"
        case startingAt = "starting_at"
        case type, live, status
        case lastPeriod = "last_period"
        case note
        case venueID = "venue_id"
        case tossWonTeamID = "toss_won_team_id"
        case winnerTeamID = "winner_team_id"
        case drawNoresult = "draw_noresult"
        case firstUmpireID = "first_umpire_id"
        case secondUmpireID = "second_umpire_id"
        case tvUmpireID = "tv_umpire_id"
        case refereeID = "referee_id"
        case manOfMatchID = "man_of_match_id"
        case manOfSeriesID = "man_of_series_id"
        case totalOversPlayed = "total_overs_played"
        case elected
        case superOver = "super_over"
        case followOn = "follow_on"
        case localteamDLData = "localteam_dl_data"
        case visitorteamDLData = "visitorteam_dl_data"
        case rpcOvers = "rpc_overs"
        case rpcTarget = "rpc_target"
        case weatherReport = "weather_report"
        case league, season, localteam, visitorteam, runs, winnerteam, tosswon, venue, stage
    }
}

enum Elected: String, Codable {
    case batting = "batting"
    case bowling = "bowling"
}

// MARK: - League
struct League: Codable {
    let resource: LeagueResource
    let id: Int
    let seasonID, countryID: Int?
    let name, code: String
    let imagePath: String?
    let type: LeagueType?
    let updatedAt: String
    let nationalTeam: Bool?
    let leagueID: Int?
    let standings: Bool?
    //let country: Country?
    enum CodingKeys: String, CodingKey {
        case resource, id
        case seasonID = "season_id"
        case countryID = "country_id"
        case name, code
        case imagePath = "image_path"
        case type
        case updatedAt = "updated_at"
        case nationalTeam = "national_team"
        case leagueID = "league_id"
        case standings
        //case country
    }
}
struct LVTeam: Codable {
    let resource: String?
    let id: Int
    let country_id: Int?
    let name, code: String
    let image_path: String?
    let updated_at: String
    let national_team: Bool?
    let country: Country?
}

struct Country: Codable {
    let resource: String?
    let id, continent_id: Int?
    let name: String?
    let image_path: String?
    let updated_at: String?
}

enum LeagueResource: String, Codable {
    case leagues = "leagues"
    case stages = "stages"
    case teams = "teams"
}

enum LeagueType: String, Codable {
    case league = "league"
    case phase = "phase"
}

// MARK: - TeamDLData
struct TeamDLData: Codable {
    let score, overs, wicketsOut: String?

    enum CodingKeys: String, CodingKey {
        case score, overs
        case wicketsOut = "wickets_out"
    }
}

enum DatumResource: String, Codable {
    case fixtures = "fixtures"
}
struct Team: Codable {
    let resource: String?
    let id: Int?
    let name, code: String?
    let image_path: String?
    let countryID: Int?
    let nationalTeam: Bool?
    let updatedAt: String?
}
enum CodingKeys: String, CodingKey {
    case resource, id, name, code
    case imagePath = "image_path"
    case countryID = "country_id"
    case nationalTeam = "national_team"
    case updatedAt = "updated_at"
}
// MARK: - Run
struct Run: Codable {
    let resource: String
    let id, fixtureID, teamID, inning: Int
    let score, wickets: Int
    let overs: Double
    let pp1: String?
    let pp2: String?
    let pp3: String?
    let updatedAt: String
    let team: Team?
    enum CodingKeys: String, CodingKey {
        case resource, id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case inning, score, wickets, overs, pp1, pp2, pp3
        case updatedAt = "updated_at"
        case team
    }
}

enum Pp1: String, Codable {
    case the12 = "1-2"
    case the13 = "1-3"
    case the14 = "1-4"
    case the16 = "1-6"
}

enum RunResource: String, Codable {
    case runs = "runs"
}

// MARK: - Season
struct Season: Codable {
    let resource: SeasonResource
    let id, leagueID: Int
    let name, code: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case resource, id
        case leagueID = "league_id"
        case name, code
        case updatedAt = "updated_at"
    }
}

enum SeasonResource: String, Codable {
    case seasons = "seasons"
}

enum UpdatedAt: String, Codable {
    case the20220703T121458000000Z = "2022-07-03T12:14:58.000000Z"
    case the20220708T201509000000Z = "2022-07-08T20:15:09.000000Z"
}

enum Status: String, Codable {
    case aban = "Aban."
    case finished = "Finished"
    case ns = "NS"
    case first = "1st Innings"
    case second = "2nd Innings"
    case c = "3rd Innings"
    case a = "4th Innings"
    case b = "Stump Day 1"

    case d = "Stump Day 2"
    case e = "Stump Day 3"
    case f = "Stump Day 4"
    case g = "Tea Break"
    case h = "Lunch"
  
    //case i = "Lunch"
    case j = "Dinner"
    case k = "Postp."
    case l = "Int."
    case inningsBreak = "Innings Break"
 
    

}

enum DatumType: String, Codable {
    case t20 = "T20"
    case t20I = "T20I"
    
    case t10 = "T10"
    case odi = "ODI"
    case fourDay = "4day"
    case test = "Test"
    case tes5 = "Test/5day"
    case listA = "List A"
}

// MARK: - Venue
struct Venue: Codable {
    let resource: VenueResource
    let id, countryID: Int
    let name, city: String
    let imagePath: String
    let capacity: Int?
    let floodlight: Bool
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case name, city
        case imagePath = "image_path"
        case capacity, floodlight
        case updatedAt = "updated_at"
    }
}

enum VenueResource: String, Codable {
    case venues = "venues"
}

// MARK: - Links
struct Links: Codable {
    let first, last: String
    let prev, next: JSONNull?
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int
    let links: [Link]
    let path: String
    let perPage, to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case links, path
        case perPage = "per_page"
        case to, total
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
