//
//  PetModel.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/19/25.
//
import Foundation
import SwiftData

enum Gender: String, Codable, CaseIterable {
    case unknown = "Unknown"
    case female = "Female"
    case altfemale = "Altered Female"
    case male = "Male"
    case altmale = "Altered Male"
}


@Model
class Pet: Identifiable, Hashable {
    
    @Attribute(.unique) var id: UUID
    var name: String
    var species: String
    var birthday: Date
    var breed: [String]? = []
    var weight: Float? = -1.0
    var active: Bool = true
    var hide: Bool = false
    var owners: [Owner]
    var services: [Service] = []
    var carePlan: [CarePlan]?
    var gender: Gender = Gender.unknown
    
    
    
    // FIX
    var notes: [String] = []
    var vaccines: [String:Date] = [:]
    var outdoor: Bool = false
    
    
    
    init(name: String, species: String, owners: [Owner]) {
        self.id = UUID()
        self.name = name
        self.birthday = Date()
        self.species = species
        self.owners = owners
    }
}


@Model
final class CarePlan: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: String
    
    // if date is nil there is no specific time
    var amount_at_time: [Float:Date?]
    
    init(name: String, type: String, amount_at_time: [Float:Date?]) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.amount_at_time = amount_at_time
    }
}
