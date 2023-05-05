//
//  SetsViewModel.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import Foundation
import CoreData

class RecordViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var records: [Record] = []
    
    init () {
        fetchRecords()
    }
    
    func fetchRecords() {
        let request = NSFetchRequest<Record>(entityName: "Record")
        do {
            records = try manager.context.fetch(request)
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
    func returnRecord() -> [Record] {
        
        let request = NSFetchRequest<Record>(entityName: "Record")
        do {
            return try manager.context.fetch(request)
        } catch let error {
            print("\(error.localizedDescription)")
        }
        
        return []
    }
    
    func addSetToExercise(weight: Double, reps: Int, date: Date, exerciseToAdd: Exercise) {

        let newRecord = Record(context: manager.context)
        newRecord.recordId = UUID()
        newRecord.recordReps = Int16(reps)
        newRecord.recordDate = date
        newRecord.recordWeights = weight

        exerciseToAdd.addToRecords(newRecord)
        saveData()
    }
    
    func sortForDates(sets: [Record]) -> [[Record]] {
        
        

        var datesRegistered: [Int] = []
        var arrays: [[Record]] = []

        // con un Set se puede arrelgar esto...
        for exercise in sets {
            
            var counter = 0
            var array: [Record] = []
            
            if let date = exercise.recordDate {
                if datesRegistered.contains(date.get(.day)) {
                    counter += 1

                } else {
                    datesRegistered.append(date.get(.day))
                    array.append(exercise)
                    
                }
                
            }
            
            
        }
        
     
            
        for index in datesRegistered {
            
            var array: [Record] = []
            
            for exercise in sets {
                
                if exercise.recordDate?.get(.day) == index {
                    array.append(exercise)
                }
                
                
            }
            
            arrays.append(array)
        }
            
        
        
        //print(datesRegistered)
        return arrays
    }
    
//    func addSetToExercise(weight: Double, reps: Int, date: Date, exerciseToAdd: Exercise) {
//
//        let newRecord = Record(context: manager.context)
//        newRecord.recordId = UUID()
//        newRecord.recordReps = Int16(reps)
//        newRecord.recordDate = date
//        newRecord.recordWeights = weight
//
//        exerciseToAdd.addToRecords(newRecord)
//        saveData()
//    }
    
    func saveData() {
        manager.save()
        fetchRecords()
    }
}
