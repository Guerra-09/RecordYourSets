//
//  ExerciseView.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

struct ExerciseView: View {
    
    @ObservedObject var exerciseVM = ExerciseViewModel()
    var folder: Folder
    
    @State var exerciseName = ""
    
    var body: some View {
        VStack {
            
            
            if let exercises = folder.exercises?.allObjects as? [Exercise] {
                List {
                    ForEach(exercises) { ex in
                        
                        NavigationLink(destination: RecordView(exercise: ex) ) {
                            Text(ex.exerciseName ?? "exercise not loading")
                        }
                        
                    }
                    .listRowBackground(Color.rowBackground)
                }
                .scrollContentBackground(.hidden)
            }
        
            
            
            TextField("Exercise name", text: $exerciseName)
                .frame(width: 250)
                .background(Color.textField)
            
            Button {
                
                exerciseVM.addExerciseToFolder(folderToAdd: folder, exerciseName: exerciseName)
                exerciseName = ""
                
            } label: {
                Text("Add")
            }

            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        
        .navigationTitle(Text(folder.folderName ?? "Error"))
    }
}


