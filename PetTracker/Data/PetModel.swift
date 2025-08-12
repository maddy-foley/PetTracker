//
//  PetModel.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/11/25.
//

import Foundation
import SwiftData

//FIX INNITS


// potential to add: vaccines, owner, walks/travel and custom_caretaking category (likes, grooming, routine, etc)
@Model
final class Pet: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var species: String
    
    var weight: Float?
    
    init(name: String, species: String, weight: Float?) {
        self.id = UUID()
        self.name = name
        self.species = species
        self.weight = weight
    }
}

// add stores and measurement calculations
@Model
final class Food {
    var name: String
    
    // ratio per weight pound
    var ratio: Float?
    
    init(name: String, ratio: Float?) {
        self.name = name
        self.ratio = ratio
    }
}

@Model
final class Vet {
    var name: String
    var phoneNumber: String
    var active: Bool

    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        
        // default vet to active
        self.active = true
    }
}
