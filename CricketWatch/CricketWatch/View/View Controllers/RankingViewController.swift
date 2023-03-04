//
//  RankingViewController.swift
//  CricketWatch
//
//  Created by BJIT on 24/2/23.
//

import UIKit
import Combine

class RankingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedBtn: UISegmentedControl!
    var viewModel : RankingViewModel = RankingViewModel()
    private var cancelables : Set<AnyCancellable> = []
    var rankings:  [TeamRanking] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.sender = self
        setUpBinder()
        setTableView()
        segmentedBtn.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getAllRankings(typeFilter: "ODI")
    }
    
    func setUpBinder() {
        viewModel.$rankings.sink{ [weak self] rankings in
            guard let self = self else {return}
            self.rankings = rankings
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.store(in: &cancelables)
    
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
           // Handle the selection event
           switch sender.selectedSegmentIndex {
           case 0:
               viewModel.getAllRankings(typeFilter: "ODI")
           case 1:
               viewModel.getAllRankings(typeFilter: "T20I")
           case 2:
               viewModel.getAllRankings(typeFilter: "TEST")
           default:
               break
           }
       }

}

extension RankingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //let nib = UINib(nibName: "RankingTableViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: "RankingTableViewCell")
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rankings.first?.team.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell", for: indexPath) as! RankingTableViewCell
        if let teamRanking = rankings.first?.team[indexPath.row]{
            cell.setUpCell(teamRanking: teamRanking)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MatchDetailViewController", sender: tableView)
    }
   
}


