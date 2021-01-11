//
//  Login+CoreDataProperties.swift
//  Reminder
//
//  Created by RAHUL GOEL on 09/01/21.
//
//

import Foundation
import CoreData


extension Login {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Login> {
        return NSFetchRequest<Login>(entityName: "Login")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
