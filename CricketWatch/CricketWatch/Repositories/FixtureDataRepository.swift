//
//  FixtureRepository.swift
//  CricketWatch
//
//  Created by BJIT on 10/2/23.
//

import Foundation

class FixtureDataRepository {
    
    let endPoint : String = "/api/v2.0/fixtures"
    
    var parameters: [String: String] = [
      "include": "",
      "api_token": Constants.apiKey,
      "sort": "-starting_at",
      "filter[starts_between]" : "2023-02-16,2023-03-17"
    ]
    func getStrDate() -> String{
        let currentDate = Date()
        let thirtyDaysFromNow = Calendar.current.date(byAdding: .day, value: 60, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date1 = dateFormatter.string(from: currentDate)
        let date2 = dateFormatter.string(from: thirtyDaysFromNow!)
        return ("\(date1),\(date2)")

    }
    func getStrDateForRecentFixture() -> String{
        let currentDate = Date()
        let pastThirtyDaysFromNow = Calendar.current.date(byAdding: .day, value: -30, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date1 = dateFormatter.string(from: currentDate)
        let date2 = dateFormatter.string(from: pastThirtyDaysFromNow!)
        return ("\(date2),\(date1)")

    }
    func getStrDateForWinPrediction() -> String{
        let currentDate = Date()
        let pastThirtyDaysFromNow = Calendar.current.date(byAdding: .day, value: -500, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date1 = dateFormatter.string(from: currentDate)
        let date2 = dateFormatter.string(from: pastThirtyDaysFromNow!)
        return ("\(date2),\(date1)")

    }
    func getShortUpcomingFixture(completion: @escaping (Result<ShortFixtureList,CustomError>)->()) {
        
        parameters["include"] = "localteam.country,visitorteam.country,league,stage,runs.team,venue,season,tosswon,winnerteam"
        print("121",getStrDate() )
       parameters["filter[starts_between]"] = getStrDate() //"2023-02-25,2023-02-26" //
       parameters.removeValue(forKey: "sort")
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let shortFixture = try JSONDecoder().decode(ShortFixtureList.self, from: data)
                  completion(.success(shortFixture))
              }catch let error{
                  print(error)
                  completion(.failure(.invalidData))
              }
          case .failure(let error):
              completion(.failure(error))
              
          }
         }
    }
    
    
    func getShortRecentFixture(completion: @escaping (Result<ShortFixtureList,CustomError>)->()) {
        
        parameters["include"] = "localteam.country,visitorteam.country,league,stage,runs.team,venue,season,tosswon,winnerteam"
        parameters["filter[starts_between]"] = getStrDateForRecentFixture()
        
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let shortFixture = try JSONDecoder().decode(ShortFixtureList.self, from: data)
                  completion(.success(shortFixture))
              }catch let error{
                  print(error)
                  completion(.failure(.invalidData))
              }
          case .failure(let error):
              completion(.failure(error))
              
          }
         }
    }
    
    func getShortFixtureById(id: Int, completion: @escaping (Result<ScoreBoard,CustomError>)->()){
        let endPointWithId : String = "\(endPoint)/\(id)"
        parameters["include"] = "localteam,visitorteam,batting.batsman,bowling.bowler,runs.team,scoreboards.team,batting,batting.result,batting.team,batting.batsman,batting.bowler,bowling.team"
    
        parameters.removeValue(forKey: "filter[starts_between]")

        NetworkManager.shared.fetchData(with: endPointWithId, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let shortFixtureById = try JSONDecoder().decode(ScoreBoard.self, from: data)
                  completion(.success(shortFixtureById))
              }catch{
                  completion(.failure(.invalidData))
              }
          case .failure(let error):
              completion(.failure(error))
          }
         }
    }
    func getShortFixtureByIdIncldingLineup(id: Int, completion: @escaping (Result<LineupData,CustomError>)->()){
        let endPointWithId : String = "\(endPoint)/\(id)"
        parameters["include"] = "lineup"
        parameters.removeValue(forKey: "filter[starts_between]")

        NetworkManager.shared.fetchData(with: endPointWithId, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let lineupData = try JSONDecoder().decode(LineupData.self, from: data)
                  completion(.success(lineupData))
              }catch{
                  completion(.failure(.invalidData))
                  
              }
          case .failure(let error):
              completion(.failure(error))
          }
         }
    }
    
    func getMatchByDate(startsBetween: String ,completion: @escaping (Result<ShortFixtureList,CustomError>)->()) {
        
        parameters["include"] = "localteam.country,visitorteam.country,league,stage,runs.team,venue,season,tosswon,winnerteam"
       parameters["filter[starts_between]"] = startsBetween
        print(parameters)
        
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let shortFixture = try JSONDecoder().decode(ShortFixtureList.self, from: data)
                  completion(.success(shortFixture))
              }catch{
                  completion(.failure(.invalidData))
              }
          case .failure(let error):
              completion(.failure(error))
              
          }
         }
    }
    
    func getShortRecentFixtureByTeamId(teamId: Int, filterStr: String, completion: @escaping (Result<ShortFixtureList,CustomError>)->()) {
        
        let parameters2: [String: String] = [
            "include": "localteam.country,visitorteam.country,league,stage,runs.team,venue,season,tosswon,winnerteam",
            "api_token": Constants.apiKey,
            "sort": "-starting_at",
            "filter[\(filterStr)]":"\(teamId)",
            "filter[starts_between]" : getStrDateForWinPrediction()
        ]
        
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters2) { (result) in
          switch result {
          case .success(let data):
              do{
                  let shortFixture = try JSONDecoder().decode(ShortFixtureList.self, from: data)
                  completion(.success(shortFixture))
                
              }catch let error{
                  print(error)
                  completion(.failure(.invalidData))
              }
          case .failure(let error):
              completion(.failure(error))
              
          }
         }
    }
    
    
}
// Detail https://cricket.sportmonks.com/api/v2.0/fixtures/45401?sort=-starting_at&include=scoreboards,localteam,visitorteam,league,stage,runs,batting.batsman,bowling,lineup,venue

// short https://cricket.sportmonks.com/api/v2.0/fixtures/45401?sort=-starting_at&include=localteam,visitorteam,league,stage,runs,venue
