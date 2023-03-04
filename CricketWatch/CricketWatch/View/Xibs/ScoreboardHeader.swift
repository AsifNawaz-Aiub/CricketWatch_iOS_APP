//
//  ScoreboardHeader.swift
//  CricketWatch
//
//  Created by BJIT on 16/2/23.
//

import UIKit

class ScoreboardHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var s1Img: UIImageView!
    @IBOutlet weak var scoreBoardTeamName: UILabel!
    @IBOutlet weak var scoreboardName: UILabel!
    @IBOutlet weak var columnOne: UILabel!
    
     @IBOutlet weak var columnTwo: UILabel!
  
    @IBOutlet weak var columnThree: UILabel!
    @IBOutlet weak var columnFour: UILabel!
    @IBOutlet weak var columnFive: UILabel!
 
    func setUpCell(scoreBoard: Score, section: Int, status: Status){
        
        let placeholderImage = UIImage(named: "default")
        s1Img.image = placeholderImage
        scoreboardName.text = "Battings"
        var iningsOneTeamId: Int? = nil
        var inningsTwoTeamId: Int? = nil
         if scoreBoard.runs.count == 0 {return}
        if section == 0 || section == 3 {
            scoreBoardTeamName.text = scoreBoard.runs[0].team?.name
            if let teamOneImagePath = scoreBoard.runs[0].team?.image_path {
                let lteamOneImageURL = URL(string: teamOneImagePath )
                s1Img.sd_setImage(with: lteamOneImageURL, placeholderImage: placeholderImage)
            }
        }else{
            if status == .finished {
                scoreBoardTeamName.text = scoreBoard.runs[1].team?.name
                if let teamOneImagePath = scoreBoard.runs[1].team?.image_path {
                    let lteamOneImageURL = URL(string: teamOneImagePath )
                    s1Img.sd_setImage(with: lteamOneImageURL, placeholderImage: placeholderImage)
                }
            }else if status == .first {
                scoreBoardTeamName.text = scoreBoard.bowling[0].team.name
                if let teamOneImagePath = scoreBoard.bowling[0].team.image_path {
                    let lteamOneImageURL = URL(string: teamOneImagePath )
                    s1Img.sd_setImage(with: lteamOneImageURL, placeholderImage: placeholderImage)
                }
            }else if status == .second {
                scoreBoardTeamName.text = scoreBoard.runs[1].team?.name
                if let teamOneImagePath = scoreBoard.runs[1].team?.image_path  {
                    let lteamOneImageURL = URL(string: teamOneImagePath )
                    s1Img.sd_setImage(with: lteamOneImageURL, placeholderImage: placeholderImage)
                }
            }else if status == .aban {
                scoreBoardTeamName.text = scoreBoard.bowling[0].team.name
                if let teamOneImagePath = scoreBoard.bowling[0].team.image_path {
                    let lteamOneImageURL = URL(string: teamOneImagePath )
                    s1Img.sd_setImage(with: lteamOneImageURL, placeholderImage: placeholderImage)
                }
            }
        }
        
        if section == 1 || section == 3 {
            if section == 1{
                scoreboardName.text = "Bowlings - 1st Innings"
            }else{
                scoreboardName.text = "Bowlings - 2nd Innings"
            }
            columnOne.text = "O"
            columnTwo.text = "M"
            columnThree.text = "R"
            columnFour.text = "W"
            columnFive.text = "ER"
        }else{
            if section == 0{
                scoreboardName.text = "Battings - 1st Innings"
            }else{
                scoreboardName.text = "Battings - 2nd Innings"
            }
            
            columnOne.text = "R"
            columnTwo.text = "B"
            columnThree.text = "4s"
            columnFour.text = "6s"
            columnFive.text = "SR"
        }
        
    }
}
