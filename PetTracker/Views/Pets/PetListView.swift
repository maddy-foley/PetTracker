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
    @Query(sort: \Species.name) private var species: [Species]
    @State private var petList: Bool = false
    @State private var isEditing: Bool = false
    @State private var selectedPet: Pet?
    @State private var isConfirmed = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            HStack{
                if isEditing{
                    Button("Cancel"){
                        modelContext.rollback()
                        isEditing = false
                    }
                    Spacer()
                    Button("Save"){
                        try? modelContext.save()
                        isEditing = false
                    }
                } else {
                    Spacer()
                    Button("Edit", systemImage: "pencil"){
                        isEditing = true
                    }
                }
            }
            .padding()
            VStack{
                if species.isEmpty{
                    Text("You have no pets added.")
                } else {
                    
                    //FIX CHECK
                    LazyVStack{
                        ForEach(species, id: \.self){specie in
                            Text(specie.name)
                                .font(.title)
                            Divider()
                            ScrollView(.horizontal){
                                LazyHStack{
                                    ForEach(specie.pets, id: \.self) {pet in
                                        PetRowView(pet: pet)
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
    
    
    private func addPet(){
        //        withAnimation{
        //            let newPet = Pet(name: "Totoro", species: "dog")
        //            modelContext.insert(newPet)
        //        }
    }
}


struct PetRowView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) private var router
    @State var pet: Pet
    
    var body: some View {
        Button {
            router.add(to: .petDetail(pet: pet))
        } label: {
            Image(systemName: pet.species.systemImage)
                .resizable()
                .frame(width: 100, height: 100, alignment: .topLeading)
                .zIndex(0)
                .padding()
                .overlay(
                    Text(pet.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .frame(width: .infinity, height: 100, alignment: .bottomLeading)
                        .background(
                            Circle()
                                .trim(from: 0.0, to: 0.5)
                                .fill(Color.black.opacity(0.5))
                                .frame(width: 100, height: 100)
                        )
                )
            
            
            
            
        }
    }
}
