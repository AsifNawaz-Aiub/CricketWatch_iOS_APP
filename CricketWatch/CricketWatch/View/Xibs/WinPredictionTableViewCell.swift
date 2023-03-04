//
//  WinPredictionTableViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 26/2/23.
//

import UIKit

class WinPredictionTableViewCell: UITableViewCell {

    @IBOutlet weak var team2Bar: UIProgressView!
    @IBOutlet weak var team1Bar: UIProgressView!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team1Rate: UILabel!
    @IBOutlet weak var team2Rate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(shortFixture: ShortFixture,winPrediction: [String:Double]){
        team1Name.text = shortFixture.localteam.name
        team2Name.text =  shortFixture.visitorteam.name
        team1Rate.text = String(format: "%.1f", winPrediction["teamOneWinPrediction"]!) + " %"
        team1Bar.setProgress(Float(winPrediction["teamOneWinPrediction"]! / 100), animated: true)
        team2Bar.setProgress(Float(winPrediction["teamTwoWinPrediction"]! / 100), animated: true)
        team2Rate.text = String(format: "%.1f", winPrediction["teamTwoWinPrediction"]!) + " %"
    }
}
