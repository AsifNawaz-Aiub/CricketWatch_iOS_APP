//
//  MatchScoreboardViewController.swift
//  CricketWatch
//
//  Created by BJIT on 14/2/23.
//

import UIKit
import Combine

class MatchScoreboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var delegate: MatchDetailViewController? = nil
    
    private var cancelables : Set<AnyCancellable> = []
    var viewModel : MatchScoreboardViewModel = MatchScoreboardViewModel()
    var fixtureId : Int? = nil
    var matchStatus : Status!
    var scoreBoardTableCellDataSource : Score?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpBinder()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let fixtureId = fixtureId {
            viewModel.getFixtureById(id: fixtureId){ completed in
                if completed{
                    DispatchQueue.main.async {
                        self.setTableView()
                    }
                }
            }
        }
    }
    func setUpBinder() {
        viewModel.$score.sink{ [weak self] score in
            guard let self = self else {return}
            self.scoreBoardTableCellDataSource = score
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.store(in: &cancelables)
    
    }

    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "ScoreboardViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ScoreboardViewCell")
        let nib2 = UINib(nibName: "ScoreboardHeader", bundle: nil)
        tableView.register(nib2, forHeaderFooterViewReuseIdentifier: "ScoreboardHeader")
    }
}

extension MatchScoreboardViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let scoreBoard = scoreBoardTableCellDataSource{
           
            return viewModel.getRowForSection(scoreBoard: scoreBoard, sectionNo: section)
        
        }else{
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if matchStatus == .finished {
            return 4
        }else if matchStatus ==  .first{
            return 2
        }else if matchStatus ==  .second{
            return 4
        }else if matchStatus ==  .aban{
            if let scoreBoardTableCellDataSource = scoreBoardTableCellDataSource{
                if scoreBoardTableCellDataSource.runs.count == 1{
                    return 2
                }else if scoreBoardTableCellDataSource.runs.count == 2 {
                    return 4
                }else{
                    return 0
                }
            }
        }else{
            return 0
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      45
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        53
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ScoreboardHeader") as! ScoreboardHeader
        
        if let scoreBoard = scoreBoardTableCellDataSource{
            if let filterdData = viewModel.getAllRowsForSection(scoreBoard: scoreBoard, sectionNo: section){
                header.setUpCell(scoreBoard: filterdData, section: section, status: matchStatus)
            }
        }
        return header
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ScoreboardViewCell") as! ScoreboardViewCell
        if let scoreBoard = scoreBoardTableCellDataSource{
            if let filterdData = viewModel.getAllRowsForSection(scoreBoard: scoreBoard, sectionNo: indexPath.section){
                cell.setUpCell(score: filterdData, index: indexPath, status: matchStatus)
                return cell
            }
        }else{
            return cell
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        // Make sure the header is a UITableViewHeaderFooterView
//        guard let header = view as? UITableViewHeaderFooterView else { return }
//        
//        // Apply a flip effect to the header while scrolling
//        let transform = CATransform3DMakeRotation(.pi, 1, 0, 0)
//        header.layer.transform = transform
//        header.alpha = 1
//        
//        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
//            header.layer.transform = CATransform3DIdentity
//            header.alpha = 1
//        }, completion: nil)
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UITableView{
            let offsetY = scrollView.contentOffset.y
            //let contentHeight = scrollView.contentSize.height
            
            if let delegate = delegate {
                delegate.animateScroll(offsetY: offsetY)
            }
          
        }
    }

}
