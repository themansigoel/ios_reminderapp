//
//  Notification.swift
//  Reminder
//
//  Created by RAHUL GOEL on 07/09/20.
//

import Foundation
import UserNotifications

class LocalNotificationManager{
    
    
    func getUserPermissionForNotification(completion: @escaping (Bool , Error?)-> Void){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            DispatchQueue.main.async {
                completion(success, error)
            }
            }
        }

    func setNotfication(title: String, desc:String, time:TimeInterval){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = desc
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        print("hello")
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}
