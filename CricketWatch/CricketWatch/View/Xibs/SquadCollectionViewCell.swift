//
//  SquadCollectionViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 18/2/23.
//

import UIKit
import SDWebImage

class SquadCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leftPlayerImage: UIImageView!
    @IBOutlet weak var leftPlayerName: UILabel!
    @IBOutlet weak var leftPlayerRole: UILabel!
    @IBOutlet weak var rightPlayerImage: UIImageView!
    @IBOutlet weak var rightPlayerName: UILabel!
    @IBOutlet weak var rightPlayerRole: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func hideLeftPlayer(){
        leftPlayerName.text = ""
        leftPlayerRole.text = ""
    }
    func hideRightPlayer(){
        //rightPlayerImage.isHidden = true
        rightPlayerName.text = ""
        rightPlayerRole.text = ""
    }
    
    func setUpCell(index: Int, lineupList: [LineupElement], leftTeamIndex: inout Int, rightTeamIndex: inout Int){
     
        if index % 2 == 0 {
            hideRightPlayer()
            leftPlayerImage.isHidden = false
            rightPlayerImage.isHidden = true
            let placeholderImage = UIImage(named: "default")
            leftPlayerImage.image = placeholderImage
            
            if leftTeamIndex > 21{
                leftTeamIndex = 0
            }
            
            if let leftPlayerImagePath = lineupList[leftTeamIndex].image_path {
                let leftPlayerImageURL = URL(string: leftPlayerImagePath )
                leftPlayerImage.sd_setImage(with: leftPlayerImageURL, placeholderImage: placeholderImage)
            }
            
            leftPlayerName.text = lineupList[leftTeamIndex].fullname
            leftPlayerRole.text =  lineupList[leftTeamIndex].position?.name
            leftTeamIndex = leftTeamIndex + 1
        }else{
            hideLeftPlayer()
            leftPlayerImage.isHidden = true
            rightPlayerImage.isHidden = false
            let placeholderImage = UIImage(named: "default")
            rightPlayerImage.image = placeholderImage
            
            if let rightPlayerImagePath = lineupList[rightTeamIndex].image_path {
                let rightPlayerImageURL = URL(string: rightPlayerImagePath )
                rightPlayerImage.sd_setImage(with: rightPlayerImageURL, placeholderImage: placeholderImage)
            }
            rightPlayerName.text = lineupList[rightTeamIndex].fullname
            rightPlayerRole.text =  lineupList[rightTeamIndex].position?.name
            rightTeamIndex = rightTeamIndex + 1
            if rightTeamIndex == 22 {
                rightTeamIndex = 0
            }
        }
    }

}
