//
//  MatchInfoTableViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 15/2/23.
//

import UIKit

class MatchInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var matchName: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tossLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(shortFixture : ShortFixture){
        matchName.text = shortFixture.round
        seriesName.text = shortFixture.stage.name
        
        let dateFormatGMT = DateFormatter()
        dateFormatGMT.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatGMT.timeZone = TimeZone(abbreviation: "GMT")
        let date = dateFormatGMT.date(from: shortFixture.startingAt)

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd-MMM-yyyy"
        let formattedDateString = outputDateFormatter.string(from: date!)
        
        let outputDateFormatterTime = DateFormatter()
        outputDateFormatterTime.dateFormat = "h:mm a"
        let formattedDateStringTime = outputDateFormatterTime.string(from: date!)

        timeLabel.text = "\(formattedDateStringTime) (In your time)"
        dateLabel.text = "\(formattedDateString) (In your time)"
        if let toss = shortFixture.tosswon, let elected = shortFixture.elected{
            tossLabel.text = "\(toss.name) elected \(elected) first"
        }
        
    }
}
