//
//  PlayerDetailViewController + LzViewPager.swift
//  CricketWatch
//
//  Created by BJIT on 21/2/23.
//

import Foundation
import UIKit

extension PlayerDetailViewController : LZViewPagerDelegate, LZViewPagerDataSource {

    func setUpViewPager(){
        viewPager.dataSource = self
        viewPager.delegate = self
        viewPager.hostController = self
 
        let vc1 = UIStoryboard(name: "PlayerDetailStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PlayerInfoViewController")
        let vc2 =  UIStoryboard(name: "PlayerDetailStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PlayerCareerViewController")
     
        subController = [vc1,vc2]
        vc1.loadViewIfNeeded()
        vc1.title = "Player Info"
        if let vc1 = vc1 as? PlayerInfoViewController {
            vc1.playerInfo = self.playerInfo
            //vc1.delegate = self
        }
        vc2.title = "Career Stats."
        vc2.loadViewIfNeeded()

        if let vc2 = vc2 as? PlayerCareerViewController {
             vc2.playerCareer =  self.playerInfo
        }
      
        viewPager.reload()
    }
    
    func numberOfItems() -> Int {
        return subController.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subController[index]
    }
    
    func button(at index: Int) -> UIButton {
          let button = UIButton()
          button.setTitleColor(UIColor.black, for: .normal)
          button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
          button.backgroundColor = .white
          return button
    }
//    func backgroundColorForHeader() -> UIColor {
//       UIColor(red: 25, green: 12, blue: 43, alpha: 5)
//    }
    func colorForIndicator(at index: Int) -> UIColor {
        return .brown
    }
    
    func animateScroll(offsetY: CGFloat){
        
        if offsetY > 100 {
            // scrolling down
            UIView.animate(withDuration: 0.7) { [weak self] in
                guard let self = self else {return}
               // self.noteLabelConst.constant = 10
                //self.noteLabelConst.constant = -197
                self.view.layoutIfNeeded()
            }
        } else {
            // scrolling up
            UIView.animate(withDuration: 0.7) { [weak self] in
                guard let self = self else {return}
                //self.noteLabelConst.constant = 197
                //self.noteLabelConst.constant = 0
                self.view.layoutIfNeeded()
            }
        }
        
    }
}
