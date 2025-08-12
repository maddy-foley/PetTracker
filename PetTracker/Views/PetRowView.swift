//
//  PetRowView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/12/25.
//

import SwiftUI


struct PetRowView: View {
    @Environment(\.modelContext) private var modelContext
    var pet: Pet


    var body: some View {
        HStack {
            Text(pet.name)


            Spacer()
        }
    }
}
