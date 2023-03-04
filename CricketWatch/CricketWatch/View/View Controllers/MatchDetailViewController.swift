//
//  MatchDetailViewController.swift
//  CricketWatch
//
//  Created by BJIT on 14/2/23.
//

import UIKit
//import LZViewPager

class MatchDetailViewController: UIViewController {
 
    @IBOutlet weak var noteLabelConst: NSLayoutConstraint!
    @IBOutlet weak var viewPager: LZViewPager!
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var subController : [UIViewController] = []
    var matchFixture: [ShortFixture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.setCollectionView()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        setUpViewPager()
    
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionViewCellLayout = UICollectionViewFlowLayout()
                collectionViewCellLayout.itemSize = CGSize(width: 400, height: 200)
                collectionViewCellLayout.scrollDirection = .horizontal
                collectionView.collectionViewLayout = collectionViewCellLayout
        let nib = UINib(nibName: "MatchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:  "MatchCollectionViewCell")
       
        //collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }

}

extension MatchDetailViewController : LZViewPagerDelegate, LZViewPagerDataSource {
    
    func setUpViewPager(){
        viewPager.dataSource = self
        viewPager.delegate = self
        viewPager.hostController = self
 
        let vc1 = UIStoryboard(name: "MatchDetailStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MatchInfoViewController")
        let vc2 =  UIStoryboard(name: "MatchDetailStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MatchScoreboardViewController")
        let vc3 =  UIStoryboard(name: "MatchDetailStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SquadInfoViewController")
        if matchFixture[0].status == .ns{
            subController = [vc1]
        }else{
            subController = [vc1,vc2,vc3]
        }
        
        vc1.loadViewIfNeeded()
        vc1.title = "Info"
        if let vc1 = vc1 as? MatchInfoViewController {
            vc1.shortFixture = matchFixture[0]
            vc1.delegate = self
        }
        vc2.title = "Scoreboard"
        vc2.loadViewIfNeeded()
        
        if let vc2 = vc2 as? MatchScoreboardViewController {
            vc2.fixtureId = matchFixture[0].id
            vc2.matchStatus = matchFixture[0].status
            vc2.delegate = self
        }
        vc3.loadViewIfNeeded()
        vc3.title = "Squad"
        if let vc3 = vc3 as? SquadInfoViewController {
            vc3.fixtureId = matchFixture[0].id
            vc3.run = matchFixture[0].runs
            vc3.visitorTeamName =  matchFixture[0].visitorteam.name
            vc3.visitorTeamImagePath = matchFixture[0].visitorteam.image_path
            vc3.matchStatus = matchFixture[0].status
            vc3.delegate = self
        }
        viewPager.reload()
    }
    
    func numberOfItems() -> Int {
        return subController.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subController[index]
    }
    
    func button(at index: Int) -> UIButton {
          let button = UIButton()
          button.setTitleColor(UIColor.black, for: .normal)
          button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
          button.backgroundColor = .white
          return button
    }
//    func backgroundColorForHeader() -> UIColor {
//       UIColor(red: 25, green: 12, blue: 43, alpha: 5)
//    }
    func colorForIndicator(at index: Int) -> UIColor {
        return .brown
    }
    
    func animateScroll(offsetY: CGFloat){
        
        if offsetY > 0 {
            // scrolling down
            UIView.animate(withDuration: 0.7) { [weak self] in
                guard let self = self else {return}
                self.noteLabelConst.constant = 10
                //self.noteLabelConst.constant = -197
                self.view.layoutIfNeeded()
            }
        } else {
            // scrolling up
            UIView.animate(withDuration: 0.7) { [weak self] in
                guard let self = self else {return}
                self.noteLabelConst.constant = 197
                //self.noteLabelConst.constant = 0
                self.view.layoutIfNeeded()
            }
        }
        
    }
}
extension MatchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.collectionView.frame.width, height: self.collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchCollectionViewCell", for: indexPath) as! MatchCollectionViewCell
        cell.setUpCell(shortFixtureList: matchFixture, indexPath: indexPath)
        cell.bgView.shadowOpacity = 0
        if matchFixture[0].status == .ns {
            noteLabel.text = "Match Did Not Start Yet"
        }else if matchFixture[0].status == .finished{
            noteLabel.text = matchFixture[0].note
        }else if matchFixture[0].status == .aban{
            noteLabel.text = "Match is Abandoned"
        }
        else if matchFixture[0].status == .first || matchFixture[0].status == .second {
            noteLabel.text = "Match is Live!"
        }
        return cell
    }
    
}
