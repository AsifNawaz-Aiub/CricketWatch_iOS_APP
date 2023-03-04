//
//  LeagueDataRepository.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import Foundation


class LeagueDataRepository {
    let endPoint : String = "/api/v2.0/leagues"
    
    var parameters: [String: String] = [
        "api_token": Constants.apiKey,
    ]
    func getAllLeagues(completion: @escaping (Result<LeagueData,CustomError>)->()){
        
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let leagueData = try JSONDecoder().decode(LeagueData.self, from: data)
                  completion(.success(leagueData))
              }catch{
                  completion(.failure(.invalidData))
                  
              }
          case .failure(let error):
              completion(.failure(error))
          }
         }
    }
    
}
