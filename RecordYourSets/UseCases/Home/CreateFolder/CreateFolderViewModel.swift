//
//  CreateFolderViewModel.swift
//  RecordYourSets
//
//  Created by José Guerra on 02-05-23.
//

import SwiftUI

class CreateFolderViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    init() {
        
    }
    
    func createFolder(folderName: String) {
        let newFolder = Folder(context: manager.context)
        newFolder.folderId = UUID()
        newFolder.folderName = folderName
        saveData()
    }
    
    func saveData() {
        manager.save()
    }
}

