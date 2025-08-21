//
//  PetView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/12/25.
//

import SwiftUI
import SwiftData


struct PetDetailView: View {
    @Environment(\.modelContext) private var modelContext
    var pet: Pet

    var body: some View {
      
        ZStack{
            VStack{
                HStack{
                    Image(systemName: "pawprint.circle")
                        .resizable()
                        .frame(width: 170, height: 170, alignment: .topLeading)
                    Spacer()
                    VStack(alignment: .trailing){
                       
                            NavigationLink {
                                
                                PetDetailEditView( petID: pet.id,in: modelContext.container)
                                
                            } label: {
                                Text("Edit")
                                Image(systemName: "pencil")
                                    
                                
                            }
                            .foregroundStyle(Color.pink)
                        
                        
                        Text("")
                        Label(pet.name, systemImage: "female")
                            .font(.title)
                            .padding(.top)
                        Text(pet.species)
                        
                        Text(pet.birthday.formatted(date: .long, time: .omitted))
                    }
                    
                    
                }
                Divider()
             
                VStack{
                    if ((pet.weight) != nil){
                        Text("Weight: ")
                        Text(pet.weight ?? 0.0, format: .number)
                    }
                    
               }
                    
                    Spacer()
                }
                .padding()
            }
            .padding()
            
        }
            
    
    
    private func editPet(pet: Pet){
        
    }
}

#Preview {
    
    PetDetailView(pet: Pet(name: "Totoro", species: "dog"))
        .modelContainer(for: Pet.self, inMemory: true, isAutosaveEnabled: false)
}
