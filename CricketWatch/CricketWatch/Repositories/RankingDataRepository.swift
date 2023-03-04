//
//  RankingDataRepository.swift
//  CricketWatch
//
//  Created by BJIT on 24/2/23.
//

import Foundation

class RankingDataRepository {
    
    let endPoint : String = "/api/v2.0/team-rankings"
    
    var parameters: [String: String] = [
      "filter[type]": "",
      "api_token": Constants.apiKey,
    ]
    
    func getAllRankings(typeFilter: String? = nil,completion: @escaping (Result<RankingData,CustomError>)->()){
        if let typeFilter = typeFilter{
            parameters["filter[type]"] = "\(typeFilter)"
        }
        print(parameters)
        
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters) { (result) in
            switch result {
            case .success(let data):
                do{
                    let rankingData = try JSONDecoder().decode(RankingData.self, from: data)
                    completion(.success(rankingData))
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
