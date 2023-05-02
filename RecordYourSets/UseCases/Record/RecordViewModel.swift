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
    
    func addSetToExercise(weight: Double, reps: Int, date: Date, exerciseToAdd: Exercise) {

        let newRecord = Record(context: manager.context)
        newRecord.recordId = UUID()
        newRecord.recordReps = Int16(reps)
        newRecord.recordDate = date
        newRecord.recordWeights = weight

        exerciseToAdd.addToRecords(newRecord)
        saveData()
    }
    
    func saveData() {
        manager.save()
        fetchRecords()
    }
}
