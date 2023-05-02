//
//  SetsView.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

struct SetsView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var setsVM = SetsViewModel()
    var exercise: Exercise
    
    var body: some View {
        VStack {
            
            if let records = exercise.records?.allObjects as? [Record] {
                List {
                    ForEach(records) { sets in
                        Text(sets.recordDate ?? Date.now, style: .date)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            
            Button {
                setsVM.
            } label: {
                <#code#>
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}
