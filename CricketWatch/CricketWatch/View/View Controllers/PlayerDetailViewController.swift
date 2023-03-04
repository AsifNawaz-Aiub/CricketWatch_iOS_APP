//
//  PlayerDetailViewController.swift
//  CricketWatch
//
//  Created by BJIT on 20/2/23.
//

import UIKit
import Combine
import SDWebImage

class PlayerDetailViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var playerId: Int? = nil
    var viewModel: PlayerListViewModel = PlayerListViewModel()
    var playerInfo: PlayerDetail!
    let placeholderImage = UIImage(named: "default")
    @IBOutlet weak var viewPager: LZViewPager!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerRole: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var countryImage: CustomUIImage!
    var subController : [UIViewController] = []
    private var cancelables : Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinder()
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if let playerId = playerId {
            activityIndicator.startAnimating()
            viewModel.getPlayerInfoById(playerId: playerId){[weak self] completed in
                guard let self = self else{return}
                if completed {
                    DispatchQueue.main.async {
                        self.setUpViewPager()
                        self.setUpPlayerData()
                        self.activityIndicator.startAnimating()
                    }
                }
            }
        }
    }
    func setUpBinder() {
        viewModel.$playerInfo.sink{ [weak self] playerData in
            guard let self = self else {return}
            self.playerInfo = playerData
        }.store(in: &cancelables)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    func setUpPlayerData(){
        self.playerName.text = "\(self.playerInfo.firstname ?? "") \(self.playerInfo.lastname ?? "")"
        self.playerRole.text =  self.playerInfo.position.name
        self.playerImage.image = self.placeholderImage
        self.countryImage.image = self.placeholderImage
        let playerImagePath =  self.playerInfo.imagePath
        let playerImagePathURL = URL(string: playerImagePath)
        if let countryImagePath =  self.playerInfo.country.image_path {
            let countryImagePathURL = URL(string: countryImagePath)
            self.countryImage.sd_setImage(with: countryImagePathURL, placeholderImage: self.placeholderImage)
        }
        self.playerImage.sd_setImage(with: playerImagePathURL, placeholderImage: self.placeholderImage)
    }

}

