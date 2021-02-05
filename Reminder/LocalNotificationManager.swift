//
//  Notification.swift
//  Reminder
//
//  Created by Mansi on 07/09/20.
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

    /*
     1. Content
        1. title
        2. substitle
        3. sound
        4. badge
        5. attachments
     
     2. Trigger
        1. Time
        2. Calender
        3. Location
     
     3. Request(Content, Trigger)
     
     */
    func setNotfication(title: String, desc:String, time:Date){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = desc
        content.sound = UNNotificationSound.default
        
        
        let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    func getListOfPendingNotifications(handler:@escaping ([NotificationInfo]) -> Void)
    {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: { requests in
            var arr = [NotificationInfo]()
            for req in requests{
                let content =  req.content
                if let trigger = req.trigger as? UNCalendarNotificationTrigger,
                    let triggerDate = trigger.nextTriggerDate(){
                arr.append(NotificationInfo(title: content.title, subtitle: content.subtitle, time: triggerDate))
            }
            handler(arr)
            }
}
)
}
}
