//
//  PlayerInfoViewController + TableView.swift
//  CricketWatch
//
//  Created by BJIT on 21/2/23.
//

import Foundation
import UIKit

extension PlayerInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "PlayerInfoTableViewCell") as! PlayerInfoTableViewCell
        cell.setUpCell(cellDataSource: playerInfo)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        260
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Perosnal Information"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
   
    
}


