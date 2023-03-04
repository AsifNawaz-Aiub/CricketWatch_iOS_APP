//
//  PlayerCareerTableViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 22/2/23.
//

import UIKit

class PlayerCareerTableViewCell: UITableViewCell {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    
    @IBOutlet weak var label1Value: UILabel!
    @IBOutlet weak var label2Value: UILabel!
    @IBOutlet weak var label3Value: UILabel!
    @IBOutlet weak var label4Value: UILabel!
    @IBOutlet weak var label5Value: UILabel!
    @IBOutlet weak var label6Value: UILabel!
    @IBOutlet weak var label7Value: UILabel!
    @IBOutlet weak var label8Value: UILabel!
    @IBOutlet weak var label9Value: UILabel!
    @IBOutlet weak var label10Value: UILabel!
    @IBOutlet weak var label11Value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpLabelForBatting(){
        heading.text = "Batting"
        label1.text = "Total Matches:"
        label2.text = "Total Innings:"
        label3.text = "Total Hundreds:"
        label4.text = "Total Fifties:"
        label5.text = "Total Runs:"
        label6.text = "Average:"
        label7.text = "Highest Innings Score"
        label8.text = "Strike Rate:"
        label9.text = "Total 4s:"
        label10.text = "Total 6s:"
        label11.text = "Total Balls Faced:"
    }
    func setUpLabelForBowling(){
        heading.text = "Batting"
        label1.text = "Total Matches:"
        label2.text = "Total Innings:"
        label3.text = "Total Overs:"
        label4.text = "Economoy Rate"
        label5.text = "Total Runs"
        label6.text = "Total Wickets:"
        label7.text = "Total Medians"
        label8.text = "Total No Balls"
        label9.text = "Total Wide Balls:"
        label10.text = ""
        label11.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpBattingCell(battingCareerKey: TypeEnum, battingCareer: [TypeEnum: CareerStats] ){
        setUpLabelForBatting()
        let battingCareerValue = battingCareer[battingCareerKey]
        heading.text = "Batting - \(battingCareerKey.rawValue)"
        if let battingCareerValue = battingCareerValue{
            label1Value.text = "\(battingCareerValue.matches)"
            label2Value.text = "\(battingCareerValue.innings)"
            label3Value.text = "\(battingCareerValue.hundreds)"
            label4Value.text = "\(battingCareerValue.fifties)"
            label5Value.text = "\(battingCareerValue.runs_scored)"
            label6Value.text = String(format: "%.2f", battingCareerValue.average)
            label7Value.text = "\(battingCareerValue.highest_inning_score)"
            label8Value.text = String(format: "%.2f", battingCareerValue.strike_rate ?? 0.00)
            label9Value.text = "\(battingCareerValue.four_x)"
            label10Value.text = "\(battingCareerValue.six_x)"
            label11Value.text = "\(battingCareerValue.balls_faced)"
        }
        
    }
    func setUpBowlingCell(bowlingCareerKey: TypeEnum, bowlingCareer: [TypeEnum: CareerStatsBowling] ){
        setUpLabelForBowling()
        let bowlingCareerValue = bowlingCareer[bowlingCareerKey]

        heading.text = "Bowling - \(bowlingCareerKey.rawValue)"
        if let bowlingCareerValue = bowlingCareerValue{
            label1Value.text = "\(bowlingCareerValue.matches)"
            label2Value.text = "\(bowlingCareerValue.innings)"
            label3Value.text =  String(format: "%.1f", bowlingCareerValue.overs)
            label4Value.text = String(format: "%.2f", bowlingCareerValue.econ_rate)
            label5Value.text = "\(bowlingCareerValue.runs)"
            label6Value.text = "\(bowlingCareerValue.wickets)"
            label7Value.text = "\(bowlingCareerValue.medians)"
            label8Value.text = "\(bowlingCareerValue.noball)"
            label9Value.text = "\(bowlingCareerValue.wide)"
            label10Value.text = ""
            label11Value.text = ""
        }
    }
    
}
