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
    @Environment(Router.self) var router
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
                       
                        Button("Edit", systemImage: "Pencil"){
                            router.add(to: .petEdit(pet: pet))
                        }
                        
                        
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
            .navigationBarBackButtonHidden(true)
                  .toolbar {
                      ToolbarItem(placement: .navigationBarLeading) {
                          Button {
                              router.pop()
                          } label: {
                              HStack {
                                  Image(systemName: "chevron.left") // Example custom icon
                                  Text("Go Back") // Example custom text
                              }
                          }
                      }
                  }
            
            
        }
            
    
    
    private func editPet(pet: Pet){
        
    }
}

//#Preview {
//    
//    PetDetailView(pet: Pet(name: "Totoro", species: "dog"))
//        .modelContainer(for: Pet.self, inMemory: true, isAutosaveEnabled: false)
//}
