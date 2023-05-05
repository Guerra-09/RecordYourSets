//
//  CoreDataManager.swift
//  RecordYourSets
//
//  Created by José Guerra on 01-05-23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    var container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading data. \(error.localizedDescription)")
            }
        }
        context = container.viewContext
        
    }
    
    func deleteAll() {
        // Get a reference to a NSPersistentStoreCoordinator
        let storeContainer = container.persistentStoreCoordinator
        

        // Delete each existing persistent store
        for store in storeContainer.persistentStores {
        
            do {
                try storeContainer.destroyPersistentStore(at: store.url!, ofType: store.type, options: nil)
            } catch {
                print("error \(error)")
            }
                
        }

        // Re-create the persistent container
        container = NSPersistentContainer(
            name: "Model"
        )

        // Calling loadPersistentStores will re-create the
        // persistent stores
        container.loadPersistentStores {
            (store, error) in
            // Handle errors
        }
    }
    
    func save() {
        do {
            try context.save()
            
        } catch let error {
            print("Error saving. \(error.localizedDescription)")
        }
    }
}
