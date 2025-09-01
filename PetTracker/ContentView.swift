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
    @Query private var species: [Species]
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
                    }
                }
            
        }
        .environment(router)
    }
    
    
    private func addTestData() {
        
        let user = Person(firstName: "Maddy", phoneNumber: "555-666-7777", address: nil)
        if persons.isEmpty
        {
            modelContext.insert(user)
            try? modelContext.save()
        }
        let cat = Species(name: "Cat", systemImage: "cat.circle.fill")
        let dog = Species(name: "Dog", systemImage: "dog.circle.fill")
       
        if pets.isEmpty {
            if species.isEmpty{
                modelContext.insert(cat)
                modelContext.insert(dog)
                try? modelContext.save()
            }
                let newPet1 = Pet(name: "Totoro", species: dog)
                let newPet2 = Pet(name: "Alice", species: cat)
                let newPet3 = Pet(name: "Rudy", species: cat , birthday: Date(), owners: [user],sex: Sex.altmale)
                modelContext.insert(newPet1)
                modelContext.insert(newPet2)
                modelContext.insert(newPet3)
                try? modelContext.save()
        }
        
    }
    
}

#Preview {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Pet.self,
            Person.self,
            Address.self,
            Species.self
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
