//
//  PetListView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/9/25.
//

import SwiftUI
import SwiftData


struct PetListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var pets: [Pet]
    @State private var petList: Bool = false
    @State private var path = NavigationPath()
    @State private var selectedPet: Pet?
    
    var body: some View {
        NavigationStack(path: $path){
            
            VStack{
                Button(action: addPet) {
                    Label("Add Pet", systemImage: "plus")
                }
                if pets.isEmpty{
                    Text("You have no pets added.")
                    
                } else {
                    
                    List(pets) { pet in
                        NavigationLink(pet.name, value: pet)
                    }
                    .navigationDestination(for: Pet.self) { pet in
                        PetDetailView(pet: pet)
                    }
                    
                    
                }
        
//                NavigationStack(path: $path) {
//                    List(pets) { pet in
//                        NavigationLink(pet.name, value: pet.name)
//                    }
//                    .navigationDestination(for: Pet.self) { pet in
//                        PetDetailView(pet: pet)
//                    }
//                    
//                }
            }
            }
        }
        
       
    
    

    private func addPet(){
        withAnimation{
            let newPet = Pet(name: "Totoro", species: "dog")
            modelContext.insert(newPet)
        }
    }
    
    private func deletePet(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    modelContext.delete(pets[index])
                }
            }
        }
}
#Preview {
    
    PetListView()
        .modelContainer(for: Pet.self, inMemory: true, isAutosaveEnabled: false)
}
