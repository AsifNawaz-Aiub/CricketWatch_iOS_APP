//
//  VenuInfoViewCell.swift
//  CricketWatch
//
//  Created by BJIT on 15/2/23.
//

import UIKit

class VenuInfoViewCell: UITableViewCell {

    @IBOutlet weak var venueImg: UIImageView!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueCity: UILabel!
    @IBOutlet weak var venueCapacity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(shortFixture: ShortFixture){
        let placeholderImage = UIImage(named: "default")
        venueImg.image = placeholderImage
        if let venueImagePath = shortFixture.venue?.imagePath {
            let venueImageURL = URL(string: venueImagePath )
            venueImg.sd_setImage(with: venueImageURL, placeholderImage: placeholderImage)
        }
        if let venue = shortFixture.venue{
            venueName.text = venue.name
            venueCity.text = "City - \(venue.city)"
            venueCapacity.text = "Capacity - \(venue.capacity ?? 0)"
        }
       
    }
    
}
