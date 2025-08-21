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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Pet.self,
            Person.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
              
        }
//        .modelContainer(sharedModelContainer)
        .modelContainer(for:[Pet.self,Person.self], isAutosaveEnabled: false)
        
    }
}
