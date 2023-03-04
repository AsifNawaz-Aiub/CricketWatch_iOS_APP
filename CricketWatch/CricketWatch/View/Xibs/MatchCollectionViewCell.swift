//
//  MatchCollectionViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 9/2/23.
//

import UIKit
import SDWebImage

class MatchCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var localTeamCon: NSLayoutConstraint!
    @IBOutlet weak var visitorTeamCon: NSLayoutConstraint!
    

    @IBOutlet weak var bgView: CustomView!
    @IBOutlet weak var teamNameLocal: UILabel!
    @IBOutlet weak var teamNameVisitor: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var stageName: UILabel!
    @IBOutlet weak var loaclTeamRunWicket: UILabel!
    @IBOutlet weak var localTeamOver: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var localTeamImg: CustomUIImage!
    @IBOutlet weak var visitorTeamImg: CustomUIImage!
    @IBOutlet weak var visitorTeamRunWicket: UILabel!
    @IBOutlet weak var visitorTeamOver: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    var timerCount: Timer!
    var endDateStr : String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(shortFixtureList : [ShortFixture], indexPath : IndexPath, sender: UIViewController? = nil){
        
        teamNameLocal.text = shortFixtureList[indexPath.row].localteam.code
        teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.code
        bgView.shadowOpacity = 1
        timer.isHidden = true
        let placeholderImage = UIImage(named: "default")
        localTeamImg.image = placeholderImage
        visitorTeamImg.image = placeholderImage
        
        if let localTeamImagePath = shortFixtureList[indexPath.row].localteam.image_path {
            let localTeamImageURL = URL(string: localTeamImagePath )
            localTeamImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
        }
        if let visitorTeamImagePath = shortFixtureList[indexPath.row].visitorteam.image_path {
            let visitorTeamImageURL = URL(string: visitorTeamImagePath )
            visitorTeamImg.sd_setImage(with: visitorTeamImageURL, placeholderImage: placeholderImage)
        }
        
        leagueLabel.text = shortFixtureList[indexPath.row].league.name
        roundLabel.text = shortFixtureList[indexPath.row].round
        
        
        if shortFixtureList[indexPath.row].status == .ns {
            statusLabel.text = "Upcoming"
          
            if (shortFixtureList[indexPath.row].localteam.name.count > 10){
                teamNameLocal.text = shortFixtureList[indexPath.row].localteam.code
            }else{
                teamNameLocal.text = shortFixtureList[indexPath.row].localteam.name
            }
            if (shortFixtureList[indexPath.row].visitorteam.name.count > 10){
                teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.code
            }else{
                teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.name
            }

            NotificationManager().setNotificationOfUpcommingMatch(notificationContent: shortFixtureList[indexPath.row])
            loaclTeamRunWicket.isHidden = true
            visitorTeamRunWicket.isHidden = true
            localTeamOver.isHidden = true
            visitorTeamOver.isHidden = true
      
            timer.isHidden = false
            endDateStr = shortFixtureList[indexPath.row].startingAt
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            
            
        }else if shortFixtureList[indexPath.row].status == .finished || shortFixtureList[indexPath.row].status == .aban{
            if(shortFixtureList[indexPath.row].status == .aban){
                statusLabel.text = "Abondoned"
            }else{
                statusLabel.text = "Finished"
            }
            
            if let _ = sender as? FixturesViewController {
                bgView.shadowOpacity = 1
            }
            else{
                bgView.shadowOpacity = 0
            }
            loaclTeamRunWicket.isHidden = false
            visitorTeamRunWicket.isHidden = false
            localTeamOver.isHidden = false
            visitorTeamOver.isHidden = false
            timer.text = ""
            var iningsOneTeamId: Int? = nil
            var inningsTwoTeamId: Int? = nil
            for (index, _) in shortFixtureList[indexPath.row].runs.enumerated(){
                
                if index == 0{
                    iningsOneTeamId = shortFixtureList[indexPath.row].runs[0].team?.id
                    if let localTeamImagePath = shortFixtureList[indexPath.row].runs[0].team?.image_path {
                        let localTeamImageURL = URL(string: localTeamImagePath )
                        localTeamImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                    }
                    if (shortFixtureList[indexPath.row].runs[0].team!.name!.count > 10){
                        teamNameLocal.text = shortFixtureList[indexPath.row].runs[0].team?.code
                    }else{
                        teamNameLocal.text = shortFixtureList[indexPath.row].runs[0].team?.name
                    }
                    
                    loaclTeamRunWicket.text = "\(shortFixtureList[indexPath.row].runs[0].score)/\(shortFixtureList[indexPath.row].runs[0].wickets)"
                    localTeamOver.text = "\(shortFixtureList[indexPath.row].runs[0].overs) over"
                }else if index == 1{
                    inningsTwoTeamId = shortFixtureList[indexPath.row].runs[1].team?.id
                    visitorTeamRunWicket.text = "\(shortFixtureList[indexPath.row].runs[1].score)/\(shortFixtureList[indexPath.row].runs[1].wickets)"
                    visitorTeamOver.text = "\(shortFixtureList[indexPath.row].runs[1].overs) over"
                    if let visitorTeamImagePath = shortFixtureList[indexPath.row].runs[1].team?.image_path {
                        let visitorTeamImageURL = URL(string: visitorTeamImagePath )
                        visitorTeamImg.sd_setImage(with: visitorTeamImageURL, placeholderImage: placeholderImage)
                    }
                    
                    if (shortFixtureList[indexPath.row].runs[1].team!.name!.count > 10){
                        teamNameVisitor.text = shortFixtureList[indexPath.row].runs[1].team?.code
                    }else{
                        teamNameVisitor.text = shortFixtureList[indexPath.row].runs[1].team?.name
                    }
                }
                
                if  iningsOneTeamId != nil && shortFixtureList[indexPath.row].status == .aban && shortFixtureList[indexPath.row].runs.count == 1 {
                    iningsOneTeamId = shortFixtureList[indexPath.row].runs[0].team?.id
                    
                    if iningsOneTeamId == shortFixtureList[indexPath.row].localteamID{
                        if let localTeamImagePath = shortFixtureList[indexPath.row].localteam.image_path {
                            let localTeamImageURL = URL(string: localTeamImagePath )
                            localTeamImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                        }
                        if (shortFixtureList[indexPath.row].localteam.name.count > 10){
                            teamNameLocal.text = shortFixtureList[indexPath.row].localteam.code
                        }else{
                            teamNameLocal.text = shortFixtureList[indexPath.row].localteam.name
                        }
                        inningsTwoTeamId = shortFixtureList[indexPath.row].visitorteamID
                        
                    }else{
                        if let localTeamImagePath = shortFixtureList[indexPath.row].visitorteam.image_path {
                            let localTeamImageURL = URL(string: localTeamImagePath )
                            localTeamImg.sd_setImage(with: localTeamImageURL, placeholderImage: placeholderImage)
                        }
                        if (shortFixtureList[indexPath.row].visitorteam.name.count > 10){
                            teamNameLocal.text = shortFixtureList[indexPath.row].visitorteam.code
                        }else{
                            teamNameLocal.text = shortFixtureList[indexPath.row].visitorteam.name
                        }
                        inningsTwoTeamId = shortFixtureList[indexPath.row].localteamID
                    }
                    
                    
                }
                if inningsTwoTeamId !=  nil && shortFixtureList[indexPath.row].status == .aban{
                    if inningsTwoTeamId == shortFixtureList[indexPath.row].localteamID{
                        if let visitorTeamImagePath = shortFixtureList[indexPath.row].localteam.image_path {
                            let  visitorTeamImageURL = URL(string: visitorTeamImagePath )
                            visitorTeamImg.sd_setImage(with:  visitorTeamImageURL, placeholderImage: placeholderImage)
                        }
                        if (shortFixtureList[indexPath.row].localteam.name.count > 10){
                            teamNameVisitor.text = shortFixtureList[indexPath.row].localteam.code
                        }else{
                            teamNameVisitor.text = shortFixtureList[indexPath.row].localteam.name
                        }
                    }else{
                        if let visitorTeamImagePath = shortFixtureList[indexPath.row].visitorteam.image_path {
                            let  visitorTeamImageURL = URL(string: visitorTeamImagePath )
                            visitorTeamImg.sd_setImage(with:  visitorTeamImageURL, placeholderImage: placeholderImage)
                        }
                        if (shortFixtureList[indexPath.row].visitorteam.name.count > 10){
                            teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.code
                        }else{
                            teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.name
                        }
                    }
                }
            }
            
        }else if shortFixtureList[indexPath.row].status == .first || shortFixtureList[indexPath.row].status == .second || shortFixtureList[indexPath.row].status == .inningsBreak  {
            if (shortFixtureList[indexPath.row].localteam.name.count > 10){
                teamNameLocal.text = shortFixtureList[indexPath.row].localteam.code
            }else{
                teamNameLocal.text = shortFixtureList[indexPath.row].localteam.name
            }
            if (shortFixtureList[indexPath.row].visitorteam.name.count > 10){
                teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.code
            }else{
                teamNameVisitor.text = shortFixtureList[indexPath.row].visitorteam.name
            }

            statusLabel.text = "LIVE"
            timer.isHidden = true
            loaclTeamRunWicket.isHidden = false
            visitorTeamRunWicket.isHidden = false
            localTeamOver.isHidden = false
            visitorTeamOver.isHidden = false
            loaclTeamRunWicket.text = "\(shortFixtureList[indexPath.row].runs[0].score)/\(shortFixtureList[indexPath.row].runs[0].wickets)"
            localTeamOver.text = "\(shortFixtureList[indexPath.row].runs[0].overs) over"
            visitorTeamRunWicket.text = "---/-"
            visitorTeamOver.text = "- over"
            if shortFixtureList[indexPath.row].status == .second{
                if(shortFixtureList[indexPath.row].runs.count > 1){
                    visitorTeamRunWicket.text = "\(shortFixtureList[indexPath.row].runs[1].score)/\(shortFixtureList[indexPath.row].runs[1].wickets)"
                    visitorTeamOver.text = "\(shortFixtureList[indexPath.row].runs[1].overs) over"
                }
            }
        }
 
        stageName.text = shortFixtureList[indexPath.row].stage.name
        
    }
    @objc func updateTimer() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let endDate = dateFormatter.date(from: endDateStr)
        
        let currentDate = Date()
        if let timeInterval = endDate?.timeIntervalSince(currentDate) {
            
            if timeInterval <= 0 {
                timerCount.invalidate()
                // timerLabel.text = "Time's up!"
                return
            }
            let days = Int(timeInterval / 86400)
            let hours = Int((timeInterval.truncatingRemainder(dividingBy: 86400)) / 3600)
            let minutes = Int((timeInterval.truncatingRemainder(dividingBy: 3600)) / 60)
            let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
            timer.text = String(format: "%02d D, %02d H, %02d minutes, %02d S", days, hours, minutes, seconds)
        }
    }
   

}
