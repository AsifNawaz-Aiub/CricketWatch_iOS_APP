//
//  PlayerListViewController + TableView.swift
//  CricketWatch
//
//  Created by BJIT on 19/2/23.
//

import Foundation
import UIKit

extension PlayerListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playerTableViewCellDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "PlayerListTableViewCell") as! PlayerListTableViewCell
        cell.setUpCell(cellDataSource: playerTableViewCellDataSource, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let playerDetailsViewController =  viewModel.prepareNavViewController(playerId: Int(playerTableViewCellDataSource[indexPath.row].id))
        //self.navigationController?.pushViewController(playerDetailsViewController, animated: true)
        performSegue(withIdentifier: "PlayerDetailViewController", sender: self)
    }
}
