//
//  CreateRecord.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

struct CreateRecordView: View {
    
    // ViewModel instance
    @ObservedObject var createRecordVM = CreateRecordViewModel()
    
    // View States
    @State var weightsTextField = ""
    @State var repetitionsTextField = ""
    @Environment(\.dismiss) var dismiss
    
    // Component from the outside
    var exercise: Exercise
    
    var body: some View {
        
        VStack {
            
            TextField("Insert Weights", text: $weightsTextField)
                .multilineTextAlignment(.center)
                .padding(.leading, 5)
                .frame(maxWidth: 250, maxHeight: 50)
                .background(Color.textField)
                .cornerRadius(12)
            
            TextField("Insert Repetitions", text: $repetitionsTextField)
                .multilineTextAlignment(.center)
                .padding(.leading, 5)
                .frame(maxWidth: 250, maxHeight: 50)
                .background(Color.textField)
                .cornerRadius(12)
            
            
            Button {
                /// Error: After performance this function, this drop the view to ExerciseView instead of just reutnr RecordView...
                createRecordVM.addSetToExercise(weight: Double(weightsTextField)!,reps:Int(repetitionsTextField)!,date: Date.now,exerciseToAdd: exercise)
            
                
                dismiss()
                
            } label: {
                Text("Save")
                    .foregroundColor(Color.foreground)
                    .frame(maxWidth: 175, maxHeight: 40)
                    .background(Color.rowBackground)
                    .cornerRadius(15)
            }

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        

    }
}

