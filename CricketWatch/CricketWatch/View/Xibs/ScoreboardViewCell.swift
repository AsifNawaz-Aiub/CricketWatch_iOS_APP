//
//  ScoreboardViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 16/2/23.
//

import UIKit

class ScoreboardViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var headStack: CustomView!
    @IBOutlet weak var playerStatus: UILabel!
    @IBOutlet weak var run: UILabel!
    @IBOutlet weak var ball: UILabel!
    @IBOutlet weak var fours: UILabel!
    @IBOutlet weak var sixes: UILabel!
    @IBOutlet weak var sr: UILabel!
    @IBOutlet weak var rowStack: CustomView!
    @IBOutlet weak var playerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(score: Score, index: IndexPath, status: Status){
        if index.section == 0 || index.section == 2 {
            
            playerName.text = score.batting[index.row].batsman?.fullname
            playerStatus.text = "\(score.batting[index.row].result.name)"
            run.text = "\(score.batting[index.row].score)"
            ball.text = "\(score.batting[index.row].ball)"
            fours.text = "\(score.batting[index.row].fourX)"
            sixes.text = "\(score.batting[index.row].sixX)"
            sr.text = "\(score.batting[index.row].rate)"
            
            let placeholderImage = UIImage(named: "default")
            playerImg.image = placeholderImage
            if let playerImagePath = score.batting[index.row].batsman?.imagePath{
                let playerImageURL = URL(string: playerImagePath )
                playerImg.sd_setImage(with: playerImageURL, placeholderImage: placeholderImage)
            }
        }
        if index.section == 1 || index.section == 3 {
            playerName.text = score.bowling[index.row].bowler.fullname
            playerStatus.text = ""
            run.text = "\(score.bowling[index.row].overs)"
            ball.text = "\(score.bowling[index.row].medians)"
            fours.text = "\(score.bowling[index.row].runs)"
            sixes.text = "\(score.bowling[index.row].wickets)"
            sr.text = "\(score.bowling[index.row].rate)"
            
            let placeholderImage = UIImage(named: "default")
            playerImg.image = placeholderImage
            if let playerImagePath = score.bowling[index.row].bowler.imagePath{
                let playerImageURL = URL(string: playerImagePath )
                playerImg.sd_setImage(with: playerImageURL, placeholderImage: placeholderImage)
            }
        }
      
    }
    
}
