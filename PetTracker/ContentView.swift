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
    @State var router = Router()

    
    var body: some View {
        NavigationStack(path: $router.navigationPath){
            MainView()
                
                .onAppear {
                    addTestData()
                }.navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        MainView()
                    case .detail(let pet):
                        PetDetailView(pet: pet)
                    case .edit(let pet):
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
    }

}

#Preview {
    ContentView()
        .modelContainer(for:[Pet.self,Person.self], isAutosaveEnabled: false)
}
