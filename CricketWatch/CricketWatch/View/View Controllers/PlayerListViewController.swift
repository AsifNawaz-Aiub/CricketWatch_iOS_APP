//
//  PlayerListViewController.swift
//  CricketWatch
//
//  Created by BJIT on 19/2/23.
//

import UIKit
import Combine

class PlayerListViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: PlayerListViewModel = PlayerListViewModel()
    private var cancelables : Set<AnyCancellable> = []
    var playerTableViewCellDataSource = [PlayerCoreData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //CoreDataManager.shared.deleteAllPlayer()
        setUpBinder()
        searchTextField.delegate = self
        intializeSearchBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getPlayerInfoShort{ completed in
            if completed{
                DispatchQueue.main.async {
                    self.setTableView()
                }
            }
        }
    }
    func reloadData(){
        tableView.reloadData()
    }
    func setUpBinder() {
        viewModel.$playerShortInfo.sink{ [weak self] shortPlayerInfo in
            guard let self = self else {return}
            self.playerTableViewCellDataSource = shortPlayerInfo
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.store(in: &cancelables)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC =  segue.destination as? PlayerDetailViewController{
            if let selectedIndex = tableView.indexPathForSelectedRow?.row
            {
                //destinationVC.loadViewIfNeeded()
                destinationVC.playerId = Int(playerTableViewCellDataSource[selectedIndex].id)
            }
        }
    }
    func intializeSearchBar(){
        searchTextField.placeholder = "Search..."
        searchTextField.backgroundColor = .white
        searchTextField.layer.cornerRadius = 10.0
        searchTextField.layer.masksToBounds = true
        searchTextField.clearButtonMode = .whileEditing
    }
}

extension PlayerListViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchQuery = searchTextField.text!
        let result = CoreDataManager.shared.fetchAllPlayers(filter: searchQuery)
        switch result {
        case .success(let filterdplayers):
            playerTableViewCellDataSource = filterdplayers
            tableView.reloadData()
        case .failure(let error):
            print(error)
        }
    
        return true
    }
  
   
}


