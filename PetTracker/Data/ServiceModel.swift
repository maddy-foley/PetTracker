//
//  PetModel.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/11/25.
//

import Foundation
import SwiftData


enum ServiceType: String, Codable, CaseIterable {
    case vet = "Vet"
    case trainer = "Trainer"
    case caretaker = "Caretaker"
    case groomer = "Groomer"
    case other = "Other"
}


@Model
final class Service: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: ServiceType
    var other: String?
    var phoneNumber: String
    var email: String?
    var address: String?
    var active: Bool

    init(name: String, type: ServiceType, phoneNumber: String, email: String?, address: String?) {
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
    var service: Service?
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


