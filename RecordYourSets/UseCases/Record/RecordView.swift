//
//  SetsView.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

struct RecordView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var recordVM = RecordViewModel()
    @State var showCreateRecord = false
    var exercise: Exercise
    
    @State var items: [[Record]] = []
    
    
    var body: some View {
        VStack {

            if let records = exercise.records?.allObjects as? [Record] {
                List {
                    ForEach(items, id: \.self) { ex in

                        Section {
                            ForEach(ex, id: \.self) { exo in
                                HStack {

                                    if let date = exo.recordDate {
                                        Text("reps: \(exo.recordReps) date: \(date , format: .dateTime.day().month())")
                                    } else {
                                        Text("No data to show")
                                    }


                                    }
                                }
                        } header: {
                            Text("\(ex.first!.recordDate ?? Date.now, format: .dateTime.day().month())")
                                .foregroundColor(Color.foreground)
                        }


                    }
                }
                .onAppear {
                    items = recordVM.sortForDates(sets: records)
                }
                .scrollContentBackground(.hidden)
            }



            Button {
                showCreateRecord.toggle()
            } label: {
                Text("New record!")
            }

            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        
        .onAppear {
            
            self.items = recordVM.sortForDates(sets: recordVM.returnRecord())
        }
        
        .sheet(isPresented: $showCreateRecord) {
                CreateRecordView(exercise: exercise)
            
        }
        
        .navigationTitle("Set View")
    }
    
}
