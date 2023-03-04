//
//  MatchViewModel.swift
//  CricketWatch
//
//  Created by BJIT on 10/2/23.
//

import Foundation
import UIKit

class MatchViewModel {
    @Published var fixture : [ShortFixture] = []
    @Published var recentFixture : [ShortFixture] = []
    var teamOne : [ShortFixture] = []
    var teamTwo : [ShortFixture] = []
    @Published var matchLineup : Lineup? = nil
    var sender: UIViewController? =  nil
    //var recentMatchCellDataSource : [ShortFixture] = []
//    init(sender: UIViewController? = nil){
//        self.sender = sender
//    }
    func getUpcomingMatches() {
        FixtureDataRepository().getShortUpcomingFixture(){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                var result = data.data
                //self.fixture = data.data
                let groupedDictionary = Dictionary( grouping:  result) { element in
                    return element.stageID
                }

                result = groupedDictionary.map { group in
                    return group.value.first!
                }
              // self.fixture = result
                result = result.sorted{ a,b in
                    return a.startingAt < b.startingAt
                }
                result =  result.filter{ a  in
                    return a.status == .ns || a.status == .first || a.status == .second || a.status == .inningsBreak
                }
                self.fixture = result
            case .failure(let error):
                
                if error == .unableToComplete{
                    DispatchQueue.main.async {
                        let layer = OverLayerView()
                        if let sender = self.sender {
                            layer.appear(sender: sender)
                        }
                    }
                }
                print(error)
            }
        }
    }
    
    func getRecentMatches() {
        
        FixtureDataRepository().getShortRecentFixture(){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.recentFixture = data.data
                
            case .failure(let error):
                print(error)
            }
        }
    }
    func getRecentMatcheLineup(id: Int, completion: @escaping (Bool)->()) {
        FixtureDataRepository().getShortFixtureByIdIncldingLineup(id: id){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.matchLineup = data.data
                completion(true)
            case .failure(let error):
                completion(false)
                print(error)
            }
        }
    }
    
    func getRecentMatchesByTeamOneIdForWinPrediction(teamOne: Int,completion: @escaping (Bool)->()) {
        var filterStr: String = "localteam_id"
        FixtureDataRepository().getShortRecentFixtureByTeamId(teamId: teamOne, filterStr: filterStr){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.teamOne = data.data
               
                DispatchQueue.main.async {
                    filterStr = "visitorteam_id"
                    FixtureDataRepository().getShortRecentFixtureByTeamId(teamId: teamOne, filterStr: filterStr){ [weak self] (result) in
                        guard let self = self else { return }
                        switch result {
                        case .success(let data):
                          
                            DispatchQueue.main.async {
                                self.teamOne.append(contentsOf: data.data)
                                completion(true)
                            }
                           
                        case .failure(let error):
                            completion(false)
                            
                            print(error)
                        }
                    }
                }
                //completion(true)
            case .failure(let error):
               
                completion(false)
                print(error)
            }
        }
    }
    
    func getRecentMatchesByTeamTwoIdForWinPrediction(teamTwo: Int,completion: @escaping (Bool)->()) {
        var filterStr: String = "localteam_id"
        FixtureDataRepository().getShortRecentFixtureByTeamId(teamId: teamTwo, filterStr: filterStr){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.teamTwo = data.data
                DispatchQueue.main.async {
                    filterStr = "visitorteam_id"
                    FixtureDataRepository().getShortRecentFixtureByTeamId(teamId: teamTwo, filterStr: filterStr){ [weak self] (result) in
                        guard let self = self else { return }
                        switch result {
                        case .success(let data):
                            
                            DispatchQueue.main.async {
                                self.teamTwo.append(contentsOf: data.data)
                                completion(true)
                            }
                          
                        case .failure(let error):
                            completion(false)
                            print(error)
                        }
                    }
                }
                //completion(true)
            case .failure(let error):
                completion(false)
                print(error)
            }
        }
    }
    var winPrediction : [String:Double] = [
        "teamOneWinPrediction": 0.0,
        "teamTwoWinPrediction": 0.0
    ]
    func getWinPrediction(teamOneId: Int, teamTwoId: Int, completion: @escaping ([String:Double]?)->()){
        getRecentMatchesByTeamOneIdForWinPrediction(teamOne: teamOneId){ [weak self] completed in
            guard let self = self else {return}
            if completed{
                self.getRecentMatchesByTeamTwoIdForWinPrediction(teamTwo: teamTwoId){  [weak self] completed in
                    guard let self = self else {return}
                    DispatchQueue.main.async {
                      let result = self.predictWinner(teamOneFixtures: self.teamOne, teamTwoFixtures: self.teamTwo, teamOneId: teamOneId, teamTwoId: teamTwoId)
                        completion(result)
                    }
                }
            }
            
        }
    }
    
    func predictWinner(teamOneFixtures: [ShortFixture], teamTwoFixtures: [ShortFixture],teamOneId: Int, teamTwoId: Int) -> [String:Double]? {
        let teamOneWins = teamOneFixtures.filter({ $0.winnerteam?.id == teamOneId }).count
        let teamTwoWins = teamTwoFixtures.filter({ $0.winnerteam?.id == teamTwoId }).count
        
        guard teamOneWins + teamTwoWins > 0 else {
            return nil // no results to make a prediction
        }
        
        let teamOneWinRatio = (Double(teamOneWins) / Double(teamOneWins + teamTwoWins)) * 100
        let teamTwoWinRatio = (Double(teamTwoWins) / Double(teamOneWins + teamTwoWins)) * 100
        

        winPrediction["teamOneWinPrediction"] = teamOneWinRatio
        winPrediction["teamTwoWinPrediction"] = teamTwoWinRatio
        
        return winPrediction

    }

}
