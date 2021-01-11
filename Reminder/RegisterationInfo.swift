//
//  RegisterationInfo.swift
//  Reminder
//
//  Created by RAHUL GOEL on 10/01/21.
//

import Foundation
class RegisterationInfo{
    var firstname : String
    var lastname : String
    var email : String
    var password : String
    var mobile : String
    var city : String
    var address : String
    
    init(firstname : String,lastname : String,email : String, password : String, mobile : String, city : String, address : String){
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.mobile = mobile
        self.city = city
        self.address = address
}
    
}
