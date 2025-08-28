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
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Pet.self,
//            Person.self,
//            Address.self
//        ])
//       
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
//        
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//        
//      
//    }()
    @MainActor var appContainer: ModelContainer {
           let container = try! ModelContainer(for: Schema([
                        Pet.self,
                        Person.self,
                        Address.self
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
