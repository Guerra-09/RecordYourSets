//
//  ExerciseViewModel.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import Foundation
import CoreData

class ExerciseViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var exercises: [Exercise] = []
    
    init() {
        fetchExercises()
    }
    
    func fetchExercises() {
        let request = NSFetchRequest<Exercise>(entityName: "Exercise")
        do {
            self.exercises = try manager.context.fetch(request)
            
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
    }
    
    func addExerciseToFolder(folderToAdd: Folder, exerciseName: String) {
        let newExercise = Exercise(context: manager.context)
        newExercise.exerciseId = UUID()
        newExercise.exerciseName = exerciseName
        folderToAdd.addToExercises(newExercise)
        saveData()
    }
    
    func saveData() {
        manager.save()
        fetchExercises()
    }
    
    
}
