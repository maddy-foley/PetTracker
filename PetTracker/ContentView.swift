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
                }.navigationDestination(for: Route.self) { route in
                    switch route {
                    case .homeTab:
                        MainView()
                    case .accountEdit(let account):
                        AccountEditView(accountID: account.id, in: modelContext.container)
                    case .petDetail(let pet):
                        PetDetailView(pet: pet)
                    case .petEdit(let pet):
                        PetDetailEditView(petID: pet.id, in: modelContext.container)
                    
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
            let user = Person(name: "Maddy", phoneNumber: "555-666-7777")
            modelContext.insert(user)
            try? modelContext.save()
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for:[Pet.self,Person.self], isAutosaveEnabled: false)
}
