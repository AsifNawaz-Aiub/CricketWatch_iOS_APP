//
//  PlayerInfoViewController.swift
//  CricketWatch
//
//  Created by BJIT on 21/2/23.
//

import UIKit

class PlayerInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var playerInfo: PlayerDetail!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setTableView()
    }

}
