//
//  CoreDataManager.swift
//  VirtualBackpack
//
//  Created by Ishika Meel on 10/31/23.
//

import Foundation
import CoreData
class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    let customContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ToDoModel")
        customContext.parent = persistentContainer.viewContext

        
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                // Handle the error gracefully, e.g., by logging, showing an alert, or taking appropriate actions.
                print("Unable to initialize Core Data: \(error)")
            } else {
                print("Core Data initialized successfully")
            }
        }
    }
}

