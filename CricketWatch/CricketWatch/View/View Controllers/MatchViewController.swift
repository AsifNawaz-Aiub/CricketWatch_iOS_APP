//
//  MatchViewController.swift
//  CricketWatch
//
//  Created by BJIT on 9/2/23.
//

import UIKit
import Combine
import UserNotifications
class MatchViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var liveAndUpcomingMatchCellDataSource : [ShortFixture] = []
    var recentMatchCellDataSource : [ShortFixture] = []
    
    var viewModel : MatchViewModel = MatchViewModel()
    private var cancelables : Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.sender = self
        self.setCollectionView()
        self.setTableView()
       
        setUpBinder()
      
    }
    func setUpBinder() {
        viewModel.$fixture.sink{ [weak self] fixture in
            guard let self = self else {return}
            self.liveAndUpcomingMatchCellDataSource = fixture
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.store(in: &cancelables)
        
        viewModel.$recentFixture.sink{ [weak self] fixture in
            guard let self = self else {return}
            self.recentMatchCellDataSource = fixture
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.store(in: &cancelables)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = sender as? UITableView {
            if let destinationVC =  segue.destination as? MatchDetailViewController{
                if let selectedIndex = tableView.indexPathForSelectedRow?.row
                {
                    destinationVC.loadViewIfNeeded()
                    destinationVC.matchFixture = [recentMatchCellDataSource[selectedIndex]]
                }
            }
        }else{
            if let destinationVC =  segue.destination as? MatchDetailViewController{
                if let selectedIndex = collectionView.indexPathsForSelectedItems?[0].row
                {
                    destinationVC.loadViewIfNeeded()
                    destinationVC.matchFixture = [liveAndUpcomingMatchCellDataSource[selectedIndex]]
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUpcomingMatches()
        viewModel.getRecentMatches()
    }

}



