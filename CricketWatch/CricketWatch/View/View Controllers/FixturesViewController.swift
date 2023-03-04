//
//  FixturesViewController.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import UIKit
import Combine

class FixturesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var firstDate: UIDatePicker!
    @IBOutlet weak var secondDate: UIDatePicker!
    @IBOutlet weak var matchLabel: UILabel!
    var startsBetween : String = ""
    var viewModel : LeagueViewModel = LeagueViewModel()
    var leagues:  [AllLeagues] = []
    var matchCellDataSource : [ShortFixture] = []
    var selectedLeagueId : Int? = nil
    private var cancelables : Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDate()
        setUpBinder()
        viewModel.sender = self
        collectionView.tag = 0
        collectionView2.tag = 1
        setCollectionView()
        firstDate.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        secondDate.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        viewModel.getLeagues{ completed in
            if completed{
                DispatchQueue.main.async {
                    self.setCollectionView()
                    self.viewModel.getMatches(firstDate: self.firstDate, secondDate: self.secondDate){ completed in
                        if completed{
                            //nothing
                        }
                    }
                }
            }
        }
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        self.viewModel.getMatches(firstDate: self.firstDate, secondDate: self.secondDate, leagueId: selectedLeagueId){ completed in
            if completed{}
        }
        
     }
    func initializeDate() {
        
        firstDate.date = Date()
        
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = 30
        let thirtyDaysFromToday = calendar.date(byAdding: components, to: Date()) ?? Date()
        secondDate.date = thirtyDaysFromToday
        
  
    }
    func setUpBinder() {
        viewModel.$leagues.sink{ [weak self] leagues in
            guard let self = self else {return}
            self.leagues = leagues
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.store(in: &cancelables)
        
        viewModel.$shortFixture.sink{ [weak self] fixture in
            guard let self = self else {return}
            self.matchCellDataSource = fixture
            DispatchQueue.main.async {
                self.collectionView2.reloadData()
            }
        }.store(in: &cancelables)
    }

}




extension FixturesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        let collectionViewCellLayout = UICollectionViewFlowLayout()
        let collectionViewCellLayout2 = UICollectionViewFlowLayout()
        collectionViewCellLayout.itemSize = CGSize(width: collectionView.frame.width/5, height: 90)
        collectionViewCellLayout.scrollDirection = .horizontal
        collectionViewCellLayout2.itemSize = CGSize(width: collectionView.frame.width/5, height: 90)
        collectionViewCellLayout2.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = collectionViewCellLayout
        collectionView2.collectionViewLayout = collectionViewCellLayout2
        
        let nib = UINib(nibName: "LeagueCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:  "LeagueCollectionViewCell")
        let nib2 = UINib(nibName: "MatchCollectionViewCell", bundle: nil)
        collectionView2.register(nib2, forCellWithReuseIdentifier:  "MatchCollectionViewCell")
        //collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return matchCellDataSource.count
        case 0:
            return leagues.count
        default:
            return 0
        }
        //leagues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 200)
        case 0:
            return CGSize(width: collectionView.bounds.width/3.2, height:collectionView.bounds.height - 10 )
        default:
            return CGSize(width: 0, height:0)
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchCollectionViewCell", for: indexPath) as! MatchCollectionViewCell
            cell.setUpCell(shortFixtureList: matchCellDataSource, indexPath: indexPath, sender: self)
            return cell
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCollectionViewCell", for: indexPath) as! LeagueCollectionViewCell
            cell.setUpCell(league: leagues[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCollectionViewCell", for: indexPath) as! LeagueCollectionViewCell
            cell.setUpCell(league: leagues[indexPath.row])
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 1:
            if let cell = collectionView.cellForItem(at: indexPath) {
                      // Apply shadow to the selected cell
                      cell.layer.shadowColor = UIColor.black.cgColor
                      cell.layer.shadowOffset = CGSize(width: 0, height: 2)
                      cell.layer.shadowOpacity = 0.5
                      cell.layer.shadowRadius = 4
                      cell.clipsToBounds = false
                  }
            let storyboard = UIStoryboard(name: "MatchDetailStoryboard", bundle: nil)
            guard let matchDetailViewController = storyboard.instantiateViewController(withIdentifier: "MatchDetailViewController") as? MatchDetailViewController else { return }
            if let selectedIndex = collectionView.indexPathsForSelectedItems?[0].row
            {
                matchDetailViewController.loadViewIfNeeded()
                matchDetailViewController.matchFixture = [matchCellDataSource[selectedIndex]]
            }
            self.navigationController?.pushViewController(matchDetailViewController, animated: true)
        case 0:
            if let cell = collectionView.cellForItem(at: indexPath) {
                      // Apply shadow to the selected cell
                      cell.layer.shadowColor = UIColor.black.cgColor
                      cell.layer.shadowOffset = CGSize(width: 0, height: 2)
                      cell.layer.shadowOpacity = 0.5
                      cell.layer.shadowRadius = 4
                      cell.clipsToBounds = false
                  }
            let selectedIndex = collectionView.indexPathsForSelectedItems![0].row
            
            selectedLeagueId = leagues[selectedIndex].id
            collectionView.isUserInteractionEnabled = false
            self.viewModel.getMatches(firstDate: self.firstDate, secondDate: self.secondDate,leagueId: selectedLeagueId){[weak self] completed in
                guard let self = self else {return}
                if completed{
                    DispatchQueue.main.async {
                        self.collectionView.isUserInteractionEnabled = true
                    }
                }else{
                    DispatchQueue.main.async {
                        self.collectionView.isUserInteractionEnabled = true
                    }
                }
            }
            
        default:
            if let cell = collectionView.cellForItem(at: indexPath) {
                      // Apply shadow to the selected cell
                      cell.layer.shadowColor = UIColor.black.cgColor
                      cell.layer.shadowOffset = CGSize(width: 0, height: 2)
                      cell.layer.shadowOpacity = 0.5
                      cell.layer.shadowRadius = 4
                      cell.clipsToBounds = false
                  }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 1:
            if let cell = collectionView.cellForItem(at: indexPath) {
                // Remove shadow from the deselected cell
                cell.layer.shadowColor = nil
                cell.layer.shadowOffset = CGSize.zero
                cell.layer.shadowOpacity = 0
                cell.layer.shadowRadius = 0
                cell.clipsToBounds = true
            }
        case 0:
            if let cell = collectionView.cellForItem(at: indexPath) {
                // Remove shadow from the deselected cell
                cell.layer.shadowColor = nil
                cell.layer.shadowOffset = CGSize.zero
                cell.layer.shadowOpacity = 0
                cell.layer.shadowRadius = 0
                cell.clipsToBounds = true
            }
        default:
            if let cell = collectionView.cellForItem(at: indexPath) {
                // Remove shadow from the deselected cell
                cell.layer.shadowColor = nil
                cell.layer.shadowOffset = CGSize.zero
                cell.layer.shadowOpacity = 0
                cell.layer.shadowRadius = 0
                cell.clipsToBounds = true
            }
        }
    }
}
