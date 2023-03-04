//
//  PlayerCareerViewController.swift
//  CricketWatch
//
//  Created by BJIT on 22/2/23.
//

import UIKit

class PlayerCareerViewController: UIViewController {

    @IBOutlet weak var sgementBtn: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var playerCareer: PlayerDetail!
    //var totalCareerType: [TypeEnum] = []
    var career: PlayerBattingBowlingCareer!
    var keys: [TypeEnum] = []
    var viewModel: PlayerListViewModel = PlayerListViewModel()
    var didSelectBatting = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sgementBtn.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
 
        viewModel.careerStats(player: playerCareer){[weak self] result in
            guard let self = self else {return}
            self.career = result
            //self.sectionCount = career.batting.count
            self.keys = Array(career.batting.keys)
            //print("121",keys )
            //print("121", career.batting[keys[0]])
            //print("121",career.batting.count)
            //print("121",career.bowling.count)
            DispatchQueue.main.async {
                self.setTableView()
            }
        }
        
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
           // Handle the selection event
           switch sender.selectedSegmentIndex {
           case 0:
               self.keys = Array(career.batting.keys)
               didSelectBatting = true
               tableView.isHidden = false
               tableView.reloadData()
               if keys.count == 0{
                   tableView.isHidden = true
                   tableView.reloadData()
               }else{
                   tableView.isHidden = false
                   tableView.reloadData()
               }
           case 1:
               self.keys = Array(career.bowling.keys)
               didSelectBatting = false
               tableView.isHidden = false
               if keys.count == 0{
                   tableView.isHidden = true
                   tableView.reloadData()
               }else{
                   tableView.isHidden = false
                   tableView.reloadData()
               }
           default:
               break
           }
       }
    
//    func getNoOfSections()-> Int{
//        let groupedDictionary = Dictionary( grouping:  self.playerCareer.career) { element in
//            return element.type
//        }
//        let result = groupedDictionary.map { group in
//            return group.value
//        }
//        var dict: [String: Double] = [
//            "TotalMatches":0.00,
//            "TotalInnings:":0.00,
//            "TotalHundreds:":0.00,
//            "TotalFifties": 0.00,
//            "TotalRuns": 0.00,
//            "Average":0.00,
//            "HighestInningsScore": 0.00,
//            "Strike Rate":0.00,
//            "Total 4s:":0.00,
//            "Total 6s": 0.00,
//            "Total Balls Faced":0.00
//
//        ]
//        var dict2: [TypeEnum:[String:Double]] = [:]
//        for val in result{
//            for eachVal in val{
//
//            dict["TotalMatches"] = dict["TotalMatches"] ?? 0.00 + (eachVal.batting?["runs_scored"] ?? 0.00)
//                dict2[eachVal.type] = dict
//            }
//        }
//        return result.count
//    }


}
