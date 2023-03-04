//
//  LeagueViewModel.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import Foundation
import UIKit

class LeagueViewModel {
    @Published var leagues:  [AllLeagues] = []
    @Published var shortFixture:  [ShortFixture] = []
    var sender: UIViewController? = nil
    func getLeagues(completion: @escaping (Bool)->()){
        LeagueDataRepository().getAllLeagues(){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.leagues = data.data
                completion(true)
            case .failure(let error):
                print(error)
                if error == .unableToComplete{
                    DispatchQueue.main.async {
                        let layer = OverLayerView()
                        if let sender = self.sender {
                            layer.appear(sender: sender)
                        }
                    }
                }
                completion(false)
            }
        }
    }
    func getMatches(firstDate: UIDatePicker,secondDate: UIDatePicker, leagueId: Int? = nil, completion: @escaping (Bool)->()){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let firstDateString = dateFormatter.string(from: firstDate.date)
        let secondDateString = dateFormatter.string(from: secondDate.date)
        let startsBetween = "\(firstDateString),\(secondDateString)"
        FixtureDataRepository().getMatchByDate(startsBetween: startsBetween){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                var result = data.data
                result =  result.sorted{ a,b in
                    return a.startingAt < b.startingAt
                }
                if let leagueId = leagueId {
                    result =  result.filter{ a  in
                        return a.leagueID == leagueId
                    }
                    print(self.shortFixture)
                    
                }
                self.shortFixture = result
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
}
