//
//  PlayerInfoTableViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 21/2/23.
//

import UIKit

class PlayerInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var gender: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(cellDataSource: PlayerDetail){
        playerName.text =  cellDataSource.fullname
        countryName.text = cellDataSource.country.name
        playerPosition.text = cellDataSource.position.name
        battingStyle.text = cellDataSource.battingstyle
        bowlingStyle.text = cellDataSource.bowlingstyle
        dateOfBirth.text = cellDataSource.dateofbirth
        gender.text = cellDataSource.gender == "m" ? "Male" : "Female"
    }

}
