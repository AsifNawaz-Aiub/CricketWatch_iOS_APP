//
//  ScoreBoardDataRepository.swift
//  CricketWatch
//
//  Created by BJIT on 16/2/23.
//

import Foundation

class ScoreBoardDataRepository  {
    
    let endPoint : String = "/api/v2.0/fixtures"
    
    var parameters: [String: String] = [
      "include": "",
      "api_token": Constants.apiKey,
      "sort": "-starting_at",
      "filter[starts_between]" : "2022-12-13,2023-09-05"
    ]
    func getScoreBoardDate() -> String{
        let currentDate = Date()
        let thirtyDaysFromNow = Calendar.current.date(byAdding: .day, value: 30, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date1 = dateFormatter.string(from: currentDate)
        let date2 = dateFormatter.string(from: thirtyDaysFromNow!)
        return ("\(date1),\(date2)")

    }
    
    
}
