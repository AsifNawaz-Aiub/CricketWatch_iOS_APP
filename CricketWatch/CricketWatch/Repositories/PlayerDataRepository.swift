//
//  PlayerDataRepository.swift
//  CricketWatch
//
//  Created by BJIT on 19/2/23.
//

import Foundation

class PlayerDataRepository {
    
    let endPoint : String = "/api/v2.0/players"
    
    var parameters: [String: String] = [
      "include": "",
      "fields[players]": "",
      "api_token": Constants.apiKey,
    ]
    
    func getPlayerShortInfo(completion: @escaping (Result<ShortPlayerData,CustomError>)->()){
        parameters["fields[players]"] = "id,fullname,image_path"
        parameters["include"] = "country"
         
        NetworkManager.shared.fetchData(with: endPoint, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let shortPlayerData = try JSONDecoder().decode(ShortPlayerData.self, from: data)
                  completion(.success(shortPlayerData))
              }catch{
                  completion(.failure(.invalidData))
                  
              }
          case .failure(let error):
              completion(.failure(error))
          }
         }
    }
    
    func getPlayerById(playerId: Int,completion: @escaping (Result<PlayerData,CustomError>)->()){
        parameters["include"] = "country,career,teams,career,currentteams"
        parameters.removeValue(forKey: "fields[players]")
        let endPointWithId : String = "\(endPoint)/\(playerId)"
        
        NetworkManager.shared.fetchData(with: endPointWithId, parameters: parameters) { (result) in
          switch result {
          case .success(let data):
              do{
                  let playerData = try JSONDecoder().decode(PlayerData.self, from: data)
                  completion(.success(playerData))
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
