//
//  PetTrackerApp.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI
import SwiftData

@main
struct PetTrackerApp: App {

    @MainActor var appContainer: ModelContainer {
        let container = try! ModelContainer(for: Schema([
            Pet.self,
            Person.self,
            Address.self,
            Specie.self
        ]))
        container.mainContext.autosaveEnabled = false
        return container
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(appContainer)
    }
    
}

