//
//  Notification.swift
//  Reminder
//
//  Created by RAHUL GOEL on 07/09/20.
//

import Foundation
import UserNotifications

class LocalNotificationManager{
    
    func getUserPermissionForNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] success, error in
            if success {
                self?.setNotfication(title: "Hi", desc: "Mansi is Cool", time: 2.0)
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func setNotfication(title: String, desc:String, time:TimeInterval){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = desc
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        print("hello")
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}
