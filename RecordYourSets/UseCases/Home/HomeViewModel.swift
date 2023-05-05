//
//  HomeViewModel.swift
//  RecordYourSets
//
//  Created by José Guerra on 01-05-23.
//

import Foundation
import CoreData
import Combine

class HomeViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var folders: [Folder] = []
 
    // Combine: this line is necessary for another instance
    private var cancellable: AnyCancellable?
    
    init() {
        fetchFolders()
        
        cancellable = NotificationCenter.default.publisher(for: NSManagedObjectContext.didSaveObjectsNotification, object: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
                self.fetchFolders()
            })
    }
    
    func fetchFolders() {
     
        let request = NSFetchRequest<Folder>(entityName: "Folder")
        do {
            self.folders = try manager.context.fetch(request)
            
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
    }
    
    
    
    func createFolder(folderName: String) {
        let newFolder = Folder(context: manager.context)
        newFolder.folderId = UUID()
        newFolder.folderName = folderName
        saveData()
    }
    
    func deleteFolder(offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let folderToDelete = folders[index]
        manager.container.viewContext.delete(folderToDelete)
        saveData()
    }
    
    
    private func saveData() {
        manager.save()
        fetchFolders()
    }
}
