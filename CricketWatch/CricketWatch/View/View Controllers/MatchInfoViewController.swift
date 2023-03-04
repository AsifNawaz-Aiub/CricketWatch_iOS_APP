//
//  MatchInfoViewController.swift
//  CricketWatch
//
//  Created by BJIT on 14/2/23.
//

import UIKit

class MatchInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var shortFixture: ShortFixture!
    let sectionTitles = ["Win Probabiliy","Info", "Teams", "Venue Info"]
    var viewModel = MatchViewModel()
    var delegate: MatchDetailViewController? = nil
    var winPrediction : [String:Double] = [
        "teamOneWinPrediction": 0.00,
        "teamTwoWinPrediction": 0.00
    ]
    var i: Int = 0
    var isWinProbabilitySectionHidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionFooterHeight = 0
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if shortFixture.status == .finished || shortFixture.status == .aban {
            isWinProbabilitySectionHidden = true
            i = 1
        }
        if isWinProbabilitySectionHidden == false {
            viewModel.getWinPrediction(teamOneId: shortFixture.localteamID, teamTwoId: shortFixture.visitorteamID){ [weak self] result in
                guard let self = self else {return}
                if let result = result {
                    self.winPrediction = result
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            }
        }
    }

    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MatchInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MatchInfoTableViewCell")
        let nib2 = UINib(nibName: "TeamInfoViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "TeamInfoViewCell")
        let nib3 = UINib(nibName: "VenuInfoViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "VenuInfoViewCell")
        let nib4 = UINib(nibName: "WinPredictionTableViewCell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: "WinPredictionTableViewCell")
    }

}

extension MatchInfoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 - i {
            if isWinProbabilitySectionHidden == true {
                return 0
            }else{
                return 80
            }
        }else if indexPath.section == 1 - i{
            return 200
        }else if indexPath.section == 2 - i{
            return 120
        }else{
            return 300
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 - i {
            return 1
        }else if section == 1 - i {
            return 1
        }else if section == 2 - i{
            return 2
        }else{
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        4 - i
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 - i && isWinProbabilitySectionHidden == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WinPredictionTableViewCell", for: indexPath) as! WinPredictionTableViewCell
            cell.setUpCell(shortFixture: shortFixture, winPrediction: winPrediction)
            return cell
        }else if indexPath.section == 1 - i {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MatchInfoTableViewCell", for: indexPath) as! MatchInfoTableViewCell
            cell.setUpCell(shortFixture: shortFixture)
            return cell
        }
        else if indexPath.section == 2 - i{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamInfoViewCell", for: indexPath) as! TeamInfoViewCell
            cell.setUpCell(shortFixture: shortFixture, index: indexPath.row)
             return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "VenuInfoViewCell", for: indexPath) as! VenuInfoViewCell
            cell.setUpCell(shortFixture: shortFixture)
             return cell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section + i ]
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 - i && isWinProbabilitySectionHidden == true{
            return 0
        }else{
            return 30
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UITableView{
            let offsetY = scrollView.contentOffset.y
            //let contentHeight = scrollView.contentSize.height
            
            if let delegate = delegate {
                delegate.animateScroll(offsetY: offsetY)
            }
          
        }
      
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//       let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.width - 16, height: 44))
//       headerLabel.text = sectionTitles[section]
//       headerLabel.font = headerFont
//       return headerLabel
//     }
}
