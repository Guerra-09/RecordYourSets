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
    let container: NSPersistentContainer
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
    
    func save() {
        do {
            try context.save()
            
        } catch let error {
            print("Error saving. \(error.localizedDescription)")
        }
    }
}
