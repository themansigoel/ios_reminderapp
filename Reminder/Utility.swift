//
//  Utility.swift
//  Reminder
//
//  Created by Mansi on 28/09/20.
//

import Foundation
class Utility{
    class func getDateFormatter()->DateFormatter{
        let dateFormatter = DateFormatter()
               dateFormatter.timeZone = .current
               dateFormatter.dateFormat = "dd-E HH-mm"
        return dateFormatter
    }
}
