//
//  LeagueCollectionViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 23/2/23.
//

import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpCell(league: AllLeagues){
        leagueName.text = league.name
        let placeholderImage = UIImage(named: "default")
        leagueImage.image = placeholderImage
        
        let leagueImagePathURL = URL(string: league.imagePath )
        leagueImage.sd_setImage(with: leagueImagePathURL, placeholderImage: placeholderImage)
        
    }
}
