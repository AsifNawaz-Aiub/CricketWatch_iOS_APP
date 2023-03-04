//
//  TeamInfoViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 15/2/23.
//

import UIKit

class TeamInfoViewCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(shortFixture: ShortFixture, index: Int){
        let placeholderImage = UIImage(named: "default")
        teamImg.image = placeholderImage
     
        
        if index == 0 {
            teamName.text = shortFixture.localteam.name
            countryName.text = shortFixture.localteam.country?.name
            if shortFixture.localteam.country?.name == "International"{
                leagueName.text =  "International"
            }else{
                leagueName.text =  shortFixture.league.name
            }
            
            if let teamImagePath = shortFixture.localteam.image_path {
                let localTeamImageURL = URL(string: teamImagePath )
                teamImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
            }
            
        }
        if index == 1 {
            teamName.text = shortFixture.visitorteam.name
            countryName.text = shortFixture.visitorteam.country?.name
            if shortFixture.visitorteam.country?.name == "International"{
                leagueName.text =  "International"
            }else{
                leagueName.text =  shortFixture.league.name
            }
            if let teamImagePath = shortFixture.visitorteam.image_path {
                let visitorTeamImageURL = URL(string: teamImagePath )
                teamImg.sd_setImage(with: visitorTeamImageURL, placeholderImage: placeholderImage)
            }
        }
    }
}
