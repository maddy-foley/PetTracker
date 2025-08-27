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
    @Environment(Router.self) var router
    @Query private var pets: [Pet]
    @State private var petList: Bool = false
    @State private var selectedPet: Pet?
    
    var body: some View {
            
            VStack{
                Button(action: addPet) {
                    Label("Add Pet", systemImage: "plus")
                }
                if pets.isEmpty{
                    Text("You have no pets added.")
                    
                } else {
                    
                    List(pets) { pet in
                        Button(pet.name){
                                router.add(to: .petDetail(pet: pet))
                        }
                           
                           
                    }
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
//#Preview {
//    
//    PetListView()
//        .modelContainer(for: Pet.self, inMemory: true, isAutosaveEnabled: false)
//}
