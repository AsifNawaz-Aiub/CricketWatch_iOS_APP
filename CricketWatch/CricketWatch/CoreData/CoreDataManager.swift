//
//  CoreDataManager.swift
//  CricketWatch
//
//  Created by BJIT on 20/2/23.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    //var count = 0
    private init() {}

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func addPlayers(playersFetchedFromAPi: [PlayerShortInfo] ,completion: (Result<[PlayerCoreData],Error>)->()){
        
        var playerCoreData: [PlayerCoreData] = []
        
        for eachPlayer in playersFetchedFromAPi{
            
            let players = PlayerCoreData(context: context)
            players.id = Int64(eachPlayer.id)
            players.fullname = eachPlayer.fullname
            players.imagePath = eachPlayer.image_path
            players.countryImage = eachPlayer.country.image_path
            do{
                try context.save()
                playerCoreData.append(players)
            }catch{
                print(error)
                completion(.failure(error))
            }
        }
        completion(.success(playerCoreData))
    }
    
    func fetchAllPlayers(filter : String? = nil) -> Result<[PlayerCoreData],Error>{
        let fetchReq = NSFetchRequest<PlayerCoreData>(entityName: "PlayerCoreData")
        
        if let filter = filter {
            let predicate = NSPredicate(format: "fullname CONTAINS[c] %@", filter)
            fetchReq.predicate = predicate
        }
        do{
            let players = try context.fetch(fetchReq)
            return (.success(players))
        }catch{
            print(error)
            return (.failure(error))
        }
    
    }
    
    func deleteAllPlayer(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlayerCoreData")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(batchDeleteRequest)
        } catch let error as NSError {
            print(error)
        }

    }
}
