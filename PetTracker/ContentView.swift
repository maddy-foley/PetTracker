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
    @Query private var species: [Specie]
    @State var router = Router()
    
    
    var body: some View {
        NavigationStack(path: $router.navigationPath){
            MainNavView()
                .onAppear {
                    addTestData()
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .homeTab:
                        MainNavView()
                    case .accountEdit(let account):
                        AccountEditView(account: account)
                    case .petDetail(let pet):
                        PetDetailView(pet: pet)
                    case .petEdit(let pet):
                        PetDetailEditView(pet: pet)
//                    case .specieEdit(let specie):
//                        specieEditView(specie: Specie)
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
        let cat = Specie(name: "Cat", systemImage: "cat.circle.fill")
        let dog = Specie(name: "Dog", systemImage: "dog.circle.fill")
       
        if pets.isEmpty {
            if species.isEmpty{
                modelContext.insert(cat)
                modelContext.insert(dog)
                try? modelContext.save()
            }
                let newPet1 = Pet(name: "Totoro", specie: dog)
                let newPet2 = Pet(name: "Alice", specie: cat)
                let newPet3 = Pet(name: "Rudy", specie: cat , birthday: Date(), owners: [user],sex: Sex.altmale)
                modelContext.insert(newPet1)
                modelContext.insert(newPet2)
                modelContext.insert(newPet3)
            cat.pets.append(newPet2)
            cat.pets.append(newPet3)
            dog.pets.append(newPet1)
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
            Specie.self
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
