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
        HStack{
            Text("pet view")
        }
        
        
    }
}
