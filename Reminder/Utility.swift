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
    class func setEmailInUserDefault(email : String){
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
    }
    class func getEmailFromUserDefault() -> String {
        let defaults = UserDefaults.standard
        
        return defaults.value(forKey: "email") as? String ?? ""
        
    }
    class func removeEmailUserDefault(){
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "email")
    }
}
