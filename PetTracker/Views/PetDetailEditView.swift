//
//  PetDetailEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/18/25.
//

import SwiftUI
import SwiftData


struct PetDetailEditView: View {
    @Environment(\.modelContext) private var modelContext
    var pet: Pet
//    @Query
    
    var body: some View {
        
       
    }


}

#Preview {
    
    PetDetailEditView(pet: Pet(name: "Totoro", species: "dog"))
        .modelContainer(for: Pet.self, inMemory: true)
}
