//
//  MatchViewController + CollectionView.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import Foundation
import UIKit

extension MatchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionViewCellLayout = UICollectionViewFlowLayout()
        collectionViewCellLayout.itemSize = CGSize(width: collectionView.frame.width, height: 200)
                collectionViewCellLayout.scrollDirection = .horizontal
                collectionView.collectionViewLayout = collectionViewCellLayout
        
        let nib = UINib(nibName: "MatchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:  "MatchCollectionViewCell")
        //collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        liveAndUpcomingMatchCellDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: self.collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchCollectionViewCell", for: indexPath) as! MatchCollectionViewCell
        cell.setUpCell(shortFixtureList: liveAndUpcomingMatchCellDataSource, indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MatchDetailViewController", sender: collectionView)
    }
}
