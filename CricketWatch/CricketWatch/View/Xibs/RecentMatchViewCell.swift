//
//  RecentMatchViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 10/2/23.
//

import UIKit

class RecentMatchViewCell: UITableViewCell {

    @IBOutlet weak var fristImg: UIImageView!
    @IBOutlet weak var firstOver: UILabel!
    @IBOutlet weak var firstRunAndWicket: UILabel!
    @IBOutlet weak var firtsTeamCode: UILabel!
    
    
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var secondOver: UILabel!
    @IBOutlet weak var secondRunAndWicket: UILabel!
    @IBOutlet weak var secondTeamCode: UILabel!
    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var leagueCodeLabel: UILabel!
    
    @IBOutlet weak var stageImage: CustomUIImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(shortRecentFixtureList : [ShortFixture], indexPath : IndexPath){
        firstOver.text = "-"
        firstRunAndWicket.text = "-/-"
        secondOver.text = "-"
        secondRunAndWicket.text = "-/-"
        
        let placeholderImage = UIImage(named: "default")
        fristImg.image = placeholderImage
        secondImg.image = placeholderImage
        stageImage.image = placeholderImage
        leagueCodeLabel.text = shortRecentFixtureList[indexPath.row].stage.name
        if let imagePath = shortRecentFixtureList[indexPath.row].league.imagePath {
            let imagePathURL = URL(string: imagePath )
            stageImage.sd_setImage(with: imagePathURL, placeholderImage: placeholderImage)
        }
        noteLabel.text = shortRecentFixtureList[indexPath.row].note
        
        var iningsOneTeamId: Int? = nil
        var inningsTwoTeamId: Int? = nil
        
        for (index, _) in shortRecentFixtureList[indexPath.row].runs.enumerated(){
            if index ==  0{
                iningsOneTeamId = shortRecentFixtureList[indexPath.row].runs[0].team?.id
                firtsTeamCode.text = shortRecentFixtureList[indexPath.row].runs[0].team?.code
                if let firstTeamImagePath = shortRecentFixtureList[indexPath.row].runs[0].team?.image_path {
                    let localTeamImageURL = URL(string: firstTeamImagePath )
                    fristImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                }
                firstOver.text = "\(shortRecentFixtureList[indexPath.row].runs[0].overs) over"
                firstRunAndWicket.text = "\(shortRecentFixtureList[indexPath.row].runs[0].score)/\(shortRecentFixtureList[indexPath.row].runs[0].wickets)"
            }else if index == 1{
                inningsTwoTeamId = shortRecentFixtureList[indexPath.row].runs[1].team?.id
                secondTeamCode.text = shortRecentFixtureList[indexPath.row].runs[1].team?.code
                if let secondTeamImagePath = shortRecentFixtureList[indexPath.row].runs[1].team?.image_path {
                    let localTeamImageURL = URL(string: secondTeamImagePath )
                    secondImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                }
                secondOver.text = "\(shortRecentFixtureList[indexPath.row].runs[1].overs) over"
                
                secondRunAndWicket.text = "\(shortRecentFixtureList[indexPath.row].runs[1].score)/\(shortRecentFixtureList[indexPath.row].runs[1].wickets)"
            }
        }
        
        if  iningsOneTeamId == nil{
            if iningsOneTeamId == shortRecentFixtureList[indexPath.row].localteamID{
                if let localTeamImagePath = shortRecentFixtureList[indexPath.row].localteam.image_path {
                    let localTeamImageURL = URL(string: localTeamImagePath )
                    fristImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                }
                if (shortRecentFixtureList[indexPath.row].localteam.name.count > 10){
                    firtsTeamCode.text = shortRecentFixtureList[indexPath.row].localteam.code
                }else{
                    firtsTeamCode.text = shortRecentFixtureList[indexPath.row].localteam.name
                }
            }else{
                if let localTeamImagePath = shortRecentFixtureList[indexPath.row].visitorteam.image_path {
                    let localTeamImageURL = URL(string: localTeamImagePath )
                    secondImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                }
                if (shortRecentFixtureList[indexPath.row].visitorteam.name.count > 10){
                    firtsTeamCode.text = shortRecentFixtureList[indexPath.row].visitorteam.code
                }else{
                    firtsTeamCode.text = shortRecentFixtureList[indexPath.row].visitorteam.name
                }
            }
        }
        if inningsTwoTeamId ==  nil{
            if inningsTwoTeamId == shortRecentFixtureList[indexPath.row].localteamID{
                if let visitorTeamImagePath = shortRecentFixtureList[indexPath.row].localteam.image_path {
                    let  visitorTeamImageURL = URL(string: visitorTeamImagePath )
                    secondImg.sd_setImage(with:  visitorTeamImageURL, placeholderImage: placeholderImage)
                }
                if (shortRecentFixtureList[indexPath.row].localteam.name.count > 10){
                    secondTeamCode.text = shortRecentFixtureList[indexPath.row].localteam.code
                }else{
                    secondTeamCode.text = shortRecentFixtureList[indexPath.row].localteam.name
                }
            }else{
                if let visitorTeamImagePath = shortRecentFixtureList[indexPath.row].visitorteam.image_path {
                    let  visitorTeamImageURL = URL(string: visitorTeamImagePath )
                    secondImg.sd_setImage(with:  visitorTeamImageURL, placeholderImage: placeholderImage)
                }
                if (shortRecentFixtureList[indexPath.row].visitorteam.name.count > 10){
                    secondTeamCode.text = shortRecentFixtureList[indexPath.row].visitorteam.code
                }else{
                    secondTeamCode.text = shortRecentFixtureList[indexPath.row].visitorteam.name
                }
            }
        }
      
    }
    
}
