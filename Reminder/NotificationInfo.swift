//
//  NotificationInfo.swift
//  Reminder
//
//  Created by Mansi on 23/09/20.
//

import Foundation

class NotificationInfo {
    var title : String
    var subTitle:String
    var time : Date
    
    init(title: String, subtitle:String, time:Date) {
        self.title = title
        self.subTitle = subtitle
        self.time = time
    }
}


