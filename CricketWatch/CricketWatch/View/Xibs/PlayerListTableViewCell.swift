//
//  PlayerListTableViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 19/2/23.
//

import UIKit
import SDWebImage
class PlayerListTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: CustomUIImage!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRole: UILabel!
    @IBOutlet weak var playerCountryImage: CustomUIImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(cellDataSource:  [PlayerCoreData], indexPath: IndexPath){
        playerName.text = cellDataSource[indexPath.row].fullname 
        //playerName.text = String(cellDataSource[indexPath.row].id)
        let placeholderImage = UIImage(named: "default")
        playerImage.image = placeholderImage
        playerCountryImage.image = placeholderImage
        if let playerImagePath =  cellDataSource[indexPath.row].imagePath {
            let playerImagePathURL = URL(string: playerImagePath )
            playerImage.sd_setImage(with: playerImagePathURL, placeholderImage: placeholderImage)
        }
        if let playerCountryImagePath =  cellDataSource[indexPath.row].countryImage {
            let playerImagePathURL = URL(string:  playerCountryImagePath )
            playerCountryImage.sd_setImage(with: playerImagePathURL, placeholderImage: placeholderImage)
        }
       // playerRole.text = cellDataSource[indexPath.row].position?.name
    }
}
