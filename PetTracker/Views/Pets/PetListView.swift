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
                ForEach(pets) {pet in
                    // convert later Fix
                    Button {
                        router.add(to: .petDetail(pet: pet))
                    } label: {
                        Image(systemName: pet.species.systemImage)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .topLeading)
                            .overlay(
                                Text(pet.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(
                                        Color.black.opacity(0.7))
                                    .frame(width: 170)
                                , alignment: .bottom
                            )
                            
                    }
                }
            }
        }
    }
    
    
    private func addPet(){
//        withAnimation{
//            let newPet = Pet(name: "Totoro", species: "dog")
//            modelContext.insert(newPet)
//        }
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
