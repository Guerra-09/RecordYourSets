//
//  MainView.swift
//  RecordYourSets
//
//  Created by José Guerra on 01-05-23.
//

import SwiftUI

struct HomeView: View {
    
    // ViewModel
    @ObservedObject var homeVM = HomeViewModel()
    
    // View components
    @State var showCreateFolderView: Bool = false

    var body: some View {
        VStack {
            
            Section {
                List {
                    ForEach(homeVM.folders) { folder in
                        NavigationLink(destination: ExerciseView(folder: folder)) {
                            Text(folder.folderName ?? "error loading folder")
                            }
                    }
                    .onDelete(perform: homeVM.deleteFolder)
                    .listRowBackground(Color.rowBackground)
                }
                .scrollContentBackground(.hidden)
            }

            
            

            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.foreground)
        .background(Color.background)
        
        .sheet(isPresented: $showCreateFolderView, content: {
            NavigationView {
                CreateFolderView()
            }
        })
        
        
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showCreateFolderView.toggle()
                } label: {
                    Image(systemName: "folder.fill.badge.plus")
                        .foregroundColor(Color.foreground)
                }

            }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
