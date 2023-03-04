//
//  RankingViewModel.swift
//  CricketWatch
//
//  Created by BJIT on 24/2/23.
//

import Foundation
import UIKit

class RankingViewModel {
    @Published var rankings:  [TeamRanking] = []
    var sender: UIViewController? = nil
    func getAllRankings( typeFilter: String? = nil){
        
        RankingDataRepository().getAllRankings(typeFilter: typeFilter){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                var result =  data.data
                result =  result.filter{
                    $0.gender == "men"
                }
                self.rankings = result
                //completion(true)
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
                //completion(false)
            }
        }
    }
    
    
}
