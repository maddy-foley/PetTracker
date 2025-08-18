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
    var birthday: Date
    var breed: [String]?
    var weight: Float?
//    var profile: [Any]
    
    
    init(name: String, species: String) {
        self.id = UUID()
        self.name = name
        self.birthday = Date()
        self.species = species
    }
    
    func getProfile() -> [String:Any] {
        var res: [String:Any]
        res = [:]
        res["name"] = self.name
        
        return res
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

@Model
final class Service: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: String
    var phoneNumber: String
    var email: String?
    var address: String?
    var active: Bool

    init(name: String, type: String, phoneNumber: String, email: String?, address: String?) {
        self.name = name
        self.type = type
        self.phoneNumber = phoneNumber
        self.email = email
        self.active = true
        self.address = address
        self.id = UUID()
    }
}

@Model
final class Event: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: String
    var date: Date
    var pets: [Pet]?

    init(name: String, type: String, date: Date, pets: [Pet]?) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.date = date
        self.pets = pets
    }
}

@Model
final class User: Identifiable  {
    @Attribute(.unique) var id: UUID
    var name: String
    var phoneNumber: String?

    init(name: String, phoneNumber: String?) {
        self.id = UUID()
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
