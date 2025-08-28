//
//  PetModel.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/19/25.
//
import Foundation
import SwiftData

enum Sex: String, Codable, CaseIterable {
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
    var weight: Double?
    var active: Bool = true
    var hide: Bool = false
    var owners: [Person] = []
    var services: [Service] = []
    var carePlan: [CarePlan] = []
    var sex: Sex = Sex.unknown
    
    // FIX
    var notes: [String] = []
    var vaccines: [String:Date] = [:]
//    var outdoor: Bool = false
    
    
    
    init(name: String, species: String) {
        self.id = UUID()
        self.name = name
        self.birthday = Date()
        self.species = species
    }
    
    init(name: String, species: String, birthday: Date, owners: [Person], sex: Sex){
        self.id = UUID()
        self.name = name
        self.species = species
        self.birthday = birthday
        self.owners = owners
        self.sex = sex
    }
}


@Model
final class CarePlan: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: String
    
    // if date is nil there is no specific time
    var amount_at_time: [Double:Date?]
    
    init(name: String, type: String, amount_at_time: [Double:Date?]) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.amount_at_time = amount_at_time
    }
}
