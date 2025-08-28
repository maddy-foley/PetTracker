//
//  ContentView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var pets: [Pet]
    @Query private var persons: [Person]
    @State var router = Router()
    
    
    var body: some View {
        NavigationStack(path: $router.navigationPath){
            MainView()
                .onAppear {
                    addTestData()
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .homeTab:
                        MainView()
                    case .accountEdit(let account):
                        AccountEditView(account: account)
                    case .petDetail(let pet):
                        PetDetailView(pet: pet)
                    case .petEdit(let pet):
                        PetDetailEditView(pet: pet)
                    case .errorDetail(let errorWrapper):
                        ErrorView(errorWrapper: errorWrapper)
                    }
                }
            
        }
        .environment(router)
    }
    
    
    private func addTestData() {
        if pets.isEmpty {
            let newPet1 = Pet(name: "Totoro", species: "Dog")
            let newPet2 = Pet(name: "Alice", species: "Cat")
            modelContext.insert(newPet1)
            modelContext.insert(newPet2)
            try? modelContext.save()
        }
        
        if persons.isEmpty
        {
            let user = Person(firstName: "Maddy", phoneNumber: "555-666-7777", address: nil)
            modelContext.insert(user)
            try? modelContext.save()
        }
    }
    
}

#Preview {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Pet.self,
            Person.self,
            Address.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    ContentView()
        .modelContainer(sharedModelContainer)
}
