//
//  RecordYourSetsApp.swift
//  RecordYourSets
//
//  Created by José Guerra on 01-05-23.
//

import SwiftUI

@main
struct RecordYourSetsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
