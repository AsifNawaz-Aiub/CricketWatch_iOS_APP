//
//  PlayerListViewModel.swift
//  CricketWatch
//
//  Created by BJIT on 19/2/23.
//

import Foundation
import UIKit

class PlayerListViewModel {
   @Published var playerShortInfo =  [PlayerCoreData]()
    @Published var playerInfo:  PlayerDetail!

    
    func getPlayerInfoShort(completion: @escaping (Bool)->()){
        
        let result = CoreDataManager.shared.fetchAllPlayers()
        switch result{
        case .success(let players) :
            if players.count == 0 {
                PlayerDataRepository().getPlayerShortInfo{ [weak self] (result) in
                    guard let self = self else { return }
                    switch result {
                    case .success(let data):
                        // self.playerShortInfo = data.data
                        DispatchQueue.main.async {
                            CoreDataManager.shared.addPlayers(playersFetchedFromAPi: data.data){ result in
                                switch result{
                                case .success(let players):
                                    self.playerShortInfo = players
                                    completion(true)
                                case.failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                        }
                      
                    case .failure(let error):
                        print(error)
                        completion(false)
                    }
                }
            }else{
                self.playerShortInfo = players
                //print("123",players[0].fullname)
                completion(true)
            }
        case .failure(let error):
            print(error)
            completion(false)
        }
        
    
    }
    
    func prepareNavViewController(playerId: Int)-> UIViewController{
        let playerDetailsViewController =  PlayerDetailViewController()
        playerDetailsViewController.loadViewIfNeeded()
        playerDetailsViewController.playerId = playerId
        return playerDetailsViewController
    }
    
    func getPlayerInfoById(playerId: Int, completion: @escaping (Bool)->()){
        PlayerDataRepository().getPlayerById(playerId: playerId){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let playerData):
                self.playerInfo = playerData.data
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
    
    func careerStats(player: PlayerDetail, completion: (PlayerBattingBowlingCareer)->()){
        var statsByTypeBatting: [TypeEnum: CareerStats] = [:]
        var statsByTypeBowling: [TypeEnum: CareerStatsBowling] = [:]
        
        for career in player.career {
            if let batting = career.batting {
                let type = career.type
                let runs = batting.runs_scored
                let matches = batting.matches
                let hundreds = batting.hundreds
                let fifties = batting.fifties
                let innings = batting.innings
                let ballsFaced = batting.balls_faced
                let highestScore = batting.highest_inning_score
                let fours = batting.four_x
                let sixes = batting.six_x

                var stats = statsByTypeBatting[type] ?? CareerStats()
                stats.runs_scored += runs
                stats.matches += matches
                stats.hundreds += hundreds
                stats.fifties += fifties
                stats.innings += innings
                stats.balls_faced += ballsFaced
                stats.highest_inning_score = max(stats.highest_inning_score, highestScore)
                stats.four_x += fours
                stats.six_x += sixes
                
                stats.average = stats.runs_scored / stats.matches
                stats.strike_rate = stats.runs_scored/stats.balls_faced
                
                statsByTypeBatting[type] = stats
            }
            
            if let bowling = career.bowling {
                let type = career.type
                let matches = bowling.matches
                let overs = bowling.overs
                let innings = bowling.innings
                let econ_rate = bowling.econ_rate
                let medians = bowling.medians
                let runs = bowling.runs
                let wickets = bowling.wickets
                let wide = bowling.wide
                let noball = bowling.noball

                var stats = statsByTypeBowling[type] ?? CareerStatsBowling()
                stats.matches += matches
                stats.overs += overs
                stats.innings += innings
                stats.econ_rate += econ_rate
                stats.medians += medians
                stats.runs += runs
                stats.wickets = wickets
                stats.wide += wide
                stats.noball += noball
    
                statsByTypeBowling[type] = stats
            }
        }
        

        completion(PlayerBattingBowlingCareer(batting: statsByTypeBatting, bowling: statsByTypeBowling))
    }
}
