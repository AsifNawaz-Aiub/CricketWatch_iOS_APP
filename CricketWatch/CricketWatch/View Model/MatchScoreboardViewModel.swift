//
//  MatchDetailViewModel.swift
//  CricketWatch
//
//  Created by BJIT on 14/2/23.
//

import Foundation

class MatchScoreboardViewModel {
    @Published var score : Score!
    //var recentMatchCellDataSource : [ShortFixture] = []
    
    func getFixtureById(id: Int, completion: @escaping (Bool)->()) {
        FixtureDataRepository().getShortFixtureById(id: id) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.score = data.data
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRowForSection(scoreBoard : Score, sectionNo: Int) -> Int{
        if sectionNo == 0 {
            let filter = scoreBoard.batting.filter({ a in
                return a.scoreboard == "S1"
            })
            return filter.count
            
        }else if  sectionNo == 1 {
            let filter = scoreBoard.bowling.filter({ a in
                return a.scoreboard == "S1"
            })
            return filter.count
        }   else if sectionNo == 2 {
            let filter = scoreBoard.batting.filter({ a in
                return a.scoreboard == "S2"
            })
            return filter.count
            
        }else if  sectionNo == 3 {
            let filter = scoreBoard.bowling.filter({ a in
                return a.scoreboard == "S2"
            })
            return filter.count
        }
        
        
        return 0
    }
    
    func getAllRowsForSection(scoreBoard : Score, sectionNo: Int) -> Score?{
        if sectionNo == 0 {

            let result = Score(localteam:scoreBoard.localteam,visitorteam:scoreBoard.visitorteam,batting: scoreBoard.batting.filter({ batting in
                batting.scoreboard == "S1"
            }), bowling:scoreBoard.bowling, runs:scoreBoard.runs, scoreboards: [])
            
            return result

        }else if  sectionNo == 1 {
            let result = Score(localteam:scoreBoard.localteam,visitorteam:scoreBoard.visitorteam,batting:[], bowling:scoreBoard.bowling.filter({ bowling in
                bowling.scoreboard == "S1"
            }), runs:scoreBoard.runs, scoreboards: [])
            
            return result
            } else if sectionNo == 2 {
                let result = Score(localteam:scoreBoard.localteam,visitorteam:scoreBoard.visitorteam,batting: scoreBoard.batting.filter({ batting in
                    batting.scoreboard == "S2"
                }), bowling:scoreBoard.bowling, runs:scoreBoard.runs, scoreboards: [])
                
                return result
                
            }else if  sectionNo == 3 {
                let result = Score(localteam:scoreBoard.localteam,visitorteam:scoreBoard.visitorteam,batting:[], bowling:scoreBoard.bowling.filter({ bowling in
                    bowling.scoreboard == "S2"
                }), runs:scoreBoard.runs, scoreboards: [])
                
                return result
                
                
            }
        
        
        return nil
    }
}

//let result = Score(batting: scoreBoard.batting.filter({ batting in
//    batting.scoreboard == "S1"
//}), bowling: scoreBoard.bowling.filter({ batting in
//    batting.scoreboard == "S2"
//}), runs: scoreBoard.runs.filter({ run in
//    run.inning == 1
//}), scoreboards: scoreBoard.scoreboards?.filter({ scoreboard in
//    scoreboard.scoreboard.rawValue == "S1"
//}))

