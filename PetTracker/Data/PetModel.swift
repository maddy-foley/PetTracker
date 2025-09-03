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
class Specie: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    @Attribute(.unique) var name: String
    var systemImage: String
    

    var pets: [Pet] = []
    
    init(name: String, systemImage: String) {
        self.id = UUID()
        self.name = name
        self.systemImage = systemImage
    }
    
}

@Model
class Pet: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var birthday: Date
    var image: Data?
    var weight: Double?
    var active: Bool = true
    var hide: Bool = false
    var owners: [Person] = []
    var services: [Service] = []
    var carePlan: [CarePlan] = []
    var sex: Sex = Sex.unknown
    var specie: Specie

    var notes: [String] = []
    
    
    
    init(name: String, specie: Specie) {
        self.id = UUID()
        self.name = name
        self.birthday = Date()
        self.specie = specie
    }
    
    init(name: String, specie: Specie, birthday: Date, owners: [Person], sex: Sex){
        self.id = UUID()
        self.name = name
        self.birthday = birthday
        self.owners = owners
        self.sex = sex
        self.specie = specie
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
