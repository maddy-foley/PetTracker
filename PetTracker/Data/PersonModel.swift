//
//  OwnerModel.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/20/25.
//
import Foundation
import SwiftData



@Model
class Person: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var phoneNumber: String?
    var user: Bool = true
    var pets: [Pet]?
    
    @Relationship(deleteRule: .cascade)
    var address: Address?
    var email: String?

    init(name: String, phoneNumber: String?) {
        self.id = UUID()
        self.name = name
        self.phoneNumber = phoneNumber
    }
}


@Model
class Address: Identifiable{
    var street: String
    var city: String
    var zip: String
    var state: String
    
    init(street: String, city: String, zip: String, state: String) {
        self.street = street
        self.city = city
        self.zip = zip
        self.state = state
    }
}

