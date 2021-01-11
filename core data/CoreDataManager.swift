//
//  CoreDataManager.swift
//  Reminder
//
//  Created by RAHUL GOEL on 08/01/21.
//

import Foundation
import CoreData
import Foundation

final class  CoreDataManager{
    
    static var shared:CoreDataManager = CoreDataManager() //Singleton object
    
    private init(){
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let modelURL = Bundle(for: CoreDataManager.self).url(forResource: "CoreDataModel", withExtension: "momd")
        
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            guard let error = error as NSError? else { return }
            print("persistent store container initialization error \(error)")
            //Decide the merge Policy
            self.persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            self.persistentContainer.viewContext.undoManager = nil
            self.persistentContainer.viewContext.shouldDeleteInaccessibleFaults = true
            
        })
        return container
    }()

    lazy var privateContext:NSManagedObjectContext  = persistentContainer.newBackgroundContext()
    
    func saveContext () {
        //To save Private Context changes If any
        if privateContext.hasChanges{
            do{
                try privateContext.save()
            }catch{
                print(error.localizedDescription)
            }
        }
        //To save Main Context changes If any
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    

    
    func documentDirectoryPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        return paths[0]
    }
    
    func persistentContainerDefaultURL()->URL{
        return NSPersistentContainer.defaultDirectoryURL()
    }
    
    func deleteCoreDataStack(){
        let storeURL = self.persistentContainerDefaultURL().appendingPathComponent("CoreDataModel.sqlite")
            do {
                try FileManager.default.removeItem(at: storeURL)
            }catch{
                //Delete Failed
                return
            }
        
            //To Delete -shm and -wal file
            let _ = try? FileManager.default.removeItem(at: self.persistentContainerDefaultURL().appendingPathComponent("CoreDataModel.sqlite-shm"))
            let _ = try? FileManager.default.removeItem(at: self.persistentContainerDefaultURL().appendingPathComponent("CoreDataModel.sqlite-wal"))
    }
}

extension NSManagedObject{
    
    func getPropertyDictionary()->[String:Any]?{
        let keys = Array(self.entity.attributesByName.keys)
        var dict: [String : Any]? = nil
        dict = self.dictionaryWithValues(forKeys: keys)
        return dict
    }
    
    func getRelationshipDictionary()->[String:Any]?{
        let keys = Array(self.entity.relationshipsByName.keys)
        var dict: [String : Any]? = nil
        dict = self.dictionaryWithValues(forKeys: keys)
        return dict
    }
}

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}

