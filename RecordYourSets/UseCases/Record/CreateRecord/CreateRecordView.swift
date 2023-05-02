//
//  CreateRecord.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

struct CreateRecordView: View {
    
    // View States
    @State var weightsTextField = ""
    @State var repetitionsTextField = ""
    
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
                
            } label: {
                Text("Save")
            }

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

struct CreateRecord_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecordView()
    }
}
