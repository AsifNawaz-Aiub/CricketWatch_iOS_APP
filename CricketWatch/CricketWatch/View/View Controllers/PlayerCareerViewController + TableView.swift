//
//  PlayerCareerViewController + TableView.swift
//  CricketWatch
//
//  Created by BJIT on 22/2/23.
//

import Foundation
import UIKit

extension PlayerCareerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "PlayerCareerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PlayerCareerTableViewCell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "PlayerCareerTableViewCell") as! PlayerCareerTableViewCell
        if didSelectBatting {
            cell.setUpBattingCell(battingCareerKey: keys[indexPath.row], battingCareer: career.batting)
        }else{
            cell.setUpBowlingCell(bowlingCareerKey:  keys[indexPath.row], bowlingCareer: career.bowling)
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//       return "Perosnal Information"
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        20
//    }
   
    
}


