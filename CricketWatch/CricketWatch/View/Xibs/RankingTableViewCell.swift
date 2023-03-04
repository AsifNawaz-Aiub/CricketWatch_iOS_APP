//
//  RankingTableViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 24/2/23.
//

import UIKit
import SDWebImage

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var matches: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(teamRanking: TeamV3){
        teamName.text = teamRanking.name
        position.text =  "\(teamRanking.ranking.position)"
        points.text = "\(teamRanking.ranking.points)"
        matches.text = "\(teamRanking.ranking.matches)"
        rating.text = "\(teamRanking.ranking.rating)"
        
        let placeholderImage = UIImage(named: "default")
        teamImage.image = placeholderImage
        
        let teamImagePath = teamRanking.imagePath
        let teamImageURL = URL(string: teamImagePath )
        teamImage.sd_setImage(with: teamImageURL, placeholderImage: placeholderImage)
        
        
    }

}
