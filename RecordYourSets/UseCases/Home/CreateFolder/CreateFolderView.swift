//
//  CreateFolderView.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

struct CreateFolderView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var createFolderVM = CreateFolderViewModel()
    @State var folderNameTF = ""
    
    var body: some View {
        VStack {
            
 
            
            TextField("folder name", text: $folderNameTF)
                .frame(width: 250, height: 30)
                .background(Color.gray)
                .cornerRadius(8)
            
            Button {
                createFolderVM.createFolder(folderName: folderNameTF)
                folderNameTF = ""
                dismiss()
                
            } label: {
                Text("Create a new folder")
                    .frame(width: 200, height: 30)
                    .background(Color.rowBackground)
                    .cornerRadius(12)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.rowBackground)
        
    }
}

struct CreateFolderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFolderView()
    }
}
