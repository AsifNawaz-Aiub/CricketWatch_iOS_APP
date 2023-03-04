//
//  NotificationManager.swift
//  CricketWatch
//
//  Created by BJIT on 24/2/23.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    func setNotificationOfUpcommingMatch(notificationContent: ShortFixture){
        
        let content = UNMutableNotificationContent()
        content.title = "\(notificationContent.localteam.name) vs \(notificationContent.visitorteam.name) - \(notificationContent.league.name)"
        content.subtitle = "\(notificationContent.stage.name)"
        content.body = "The match is about to start"
        content.sound = UNNotificationSound.default
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let matchDate = dateFormatter.date(from: notificationContent.startingAt)
        let currentDate = Date()
        if let timeInterval = matchDate?.timeIntervalSince(currentDate) {
            
            if timeInterval > 600 {
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval - 600, repeats: false)
                let request = UNNotificationRequest(identifier: "notificationIdentifier\(notificationContent.id)", content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error {
                       print(error)
                    }
                }
            }
        }
    }
}
