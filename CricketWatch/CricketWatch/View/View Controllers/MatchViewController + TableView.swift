//
//  MatchViewController + TableView.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import Foundation
import UIKit

extension MatchViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "RecentMatchViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RecentMatchViewCell")
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        260
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recentMatchCellDataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentMatchViewCell", for: indexPath) as! RecentMatchViewCell
        cell.setUpCell(shortRecentFixtureList: recentMatchCellDataSource, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MatchDetailViewController", sender: tableView)
    }
   
}


