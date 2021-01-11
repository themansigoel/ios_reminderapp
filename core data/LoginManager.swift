//
//  LoginManager.swift
//  Reminder
//
//  Created by RAHUL GOEL on 09/01/21.
//

import Foundation
import CoreData

extension CoreDataManager{
    func test(){
     let _ = NSEntityDescription.insertNewObject(forEntityName: "Login", into: privateContext) as? Login
}
    
    func saveUser(info: RegisterationInfo?)
    {
        let register = NSEntityDescription.insertNewObject(forEntityName: "Register", into: privateContext) as? Register
        
        register?.firstname = info?.firstname
        register?.lastname = info?.lastname
        register?.email = info?.email
        register?.password = info?.password
        register?.mobile = info?.mobile
        register?.city = info?.city
        register?.address = info?.address
       saveContext()
        
    }
    
    func fetchLoginCredentials(userName:String, password:String, completionHandler: @escaping((Bool)-> Void)){
        do{
            let fetchRequest : NSFetchRequest<Login> = Login.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username = %@", userName)
            
            let fetchResults = try privateContext.fetch(fetchRequest)
            print("fetchResults : \(fetchResults.count)")
            for cred in fetchResults{
                if let passwd = cred.password{
                    if passwd == password{
                        completionHandler(true)
                    }else{
                        completionHandler(false)
                    }
                }
            }
            completionHandler(false)
        }
        catch{
            print("error",error)
        }
    }
}
