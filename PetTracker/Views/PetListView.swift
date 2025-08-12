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
    
    var body: some View {
        VStack{
            Button(action: addPet) {
                Label("Add Pet", systemImage: "plus")
            }
            if pets.isEmpty{
                Text("You have no pets added.")
                
            } else {
                NavigationView{
                    List(pets) { pet in
                        NavigationLink {
                            PetDetailView(pet: pet)
                        } label: {
                            PetRowView(pet: pet)
                        }
                    }
                    
//                    ForEach(pets, id: \.self) { pet in
//                        PetRowView(pet: pet)
//                    }
//                    .onDelete(perform: deletePet) // Optional: for deleting items
                    
                }
            }
        }
        
       
    }
    
    //FIX example input
    private func addPet(){
        withAnimation{
            let newPet = Pet(name: "Totoro", species: "dog", weight: 6.0)
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
