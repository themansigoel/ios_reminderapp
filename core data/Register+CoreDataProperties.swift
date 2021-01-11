//
//  Register+CoreDataProperties.swift
//  Reminder
//
//  Created by RAHUL GOEL on 10/01/21.
//
//

import Foundation
import CoreData


extension Register {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Register> {
        return NSFetchRequest<Register>(entityName: "Register")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var mobile: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?

}
