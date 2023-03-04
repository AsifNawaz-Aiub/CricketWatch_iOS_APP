//
//  SquadInfoViewController.swift
//  CricketWatch
//
//  Created by BJIT on 18/2/23.
//

import UIKit
import Combine
import SDWebImage
class SquadInfoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var leftTeamImage: UIImageView!
    @IBOutlet weak var leftTeamName: UILabel!
    @IBOutlet weak var rightTeamImage: UIImageView!
    @IBOutlet weak var rightTeamName: UILabel!
    private var cancelables : Set<AnyCancellable> = []
    var viewModel : MatchViewModel = MatchViewModel()
    var fixtureId : Int? = nil
    var run: [Run] = []
    var visitorTeamName : String = ""
    var visitorTeamImagePath: String? = nil
    var matchStatus: Status!
    var leftTeamIndex: Int = 0
    var rightTeamIndex: Int = 11
    var lineupCollectionViewCellDataSource: Lineup!
    var delegate: MatchDetailViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTeamIndex = 0
        rightTeamIndex = 11
        setUpBinder()
    
    }
    override func viewWillAppear(_ animated: Bool) {
       
        if let fixtureId = fixtureId {
            viewModel.getRecentMatcheLineup(id: fixtureId){ completed in
                if completed{
                    DispatchQueue.main.async {
                        self.setCollectionView()
                    }
                }
            }
        }
        setUpSquadHeaderView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        leftTeamIndex = 0
        rightTeamIndex = 11
    }
    
    func setUpBinder() {
        viewModel.$matchLineup.sink{ [weak self] lineup in
            guard let self = self else {return}
            self.lineupCollectionViewCellDataSource = lineup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.store(in: &cancelables)
    
    }
    
    func setUpSquadHeaderView(){
        if !run.isEmpty {
            
            leftTeamName.text = run[0].team?.name
            
            let placeholderImage = UIImage(named: "default")
            leftTeamImage.image = placeholderImage
            rightTeamImage.image = placeholderImage
            
            if let  leftTeamImagePath = run[0].team?.image_path {
                let  leftTeamImageURL = URL(string:  leftTeamImagePath )
                leftTeamImage.sd_setImage(with:  leftTeamImageURL, placeholderImage: placeholderImage)
            }
           
            if matchStatus == .finished || matchStatus == .second{
                rightTeamName.text = run[1].team?.name
                if let  rightTeamImagePath = run[1].team?.image_path {
                    let  rightTeamImageURL = URL(string:  rightTeamImagePath )
                    rightTeamImage.sd_setImage(with:  rightTeamImageURL, placeholderImage: placeholderImage)
                }
            } else if matchStatus == .first ||  matchStatus == .aban {
                rightTeamName.text = visitorTeamName
                if let  rightTeamImagePath = visitorTeamImagePath {
                    let  rightTeamImageURL = URL(string:  rightTeamImagePath )
                    rightTeamImage.sd_setImage(with:  rightTeamImageURL, placeholderImage: placeholderImage)
                }
            }
        }
    }
    
    
    
    

}

extension SquadInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        lineupCollectionViewCellDataSource.lineup.count
        //0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquadCollectionViewCell", for: indexPath) as! SquadCollectionViewCell
        cell.setUpCell(index: indexPath.row, lineupList: lineupCollectionViewCellDataSource.lineup, leftTeamIndex: &leftTeamIndex, rightTeamIndex: &rightTeamIndex)
        return cell
    }
    
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionViewCellLayout = UICollectionViewFlowLayout()
        collectionViewCellLayout.itemSize = CGSize(width: collectionView.frame.width/2 - 10, height: 65)
                collectionViewCellLayout.scrollDirection = .vertical
                collectionView.collectionViewLayout = layoutOne()
        
        let nib = UINib(nibName: "SquadCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:  "SquadCollectionViewCell")
        //collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    func layoutOne () -> UICollectionViewCompositionalLayout {
        //let inset = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let itemOfLayoutOneSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        let itemOfLayoutOne = NSCollectionLayoutItem(layoutSize: itemOfLayoutOneSize)
        //itemOfLayoutOne.contentInsets = inset
        let groupOfLayoutOneSize =  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/6))
        let groupOfLayoutOne = NSCollectionLayoutGroup.horizontal(layoutSize: groupOfLayoutOneSize, subitems: [itemOfLayoutOne,itemOfLayoutOne])
        let section = NSCollectionLayoutSection(group: groupOfLayoutOne)
        let layoutOne = UICollectionViewCompositionalLayout (section: section)
     
        return layoutOne
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UICollectionView{
            let offsetY = scrollView.contentOffset.y
            //let contentHeight = scrollView.contentSize.height
            
            if let delegate = delegate {
                delegate.animateScroll(offsetY: offsetY)
            }
          
        }
    }
}
