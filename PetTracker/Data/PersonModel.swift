//
//  OwnerModel.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/20/25.
//
import Foundation
import SwiftData


@Model
class Person: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var firstName: String
    var lastName: String = ""
    var phoneNumber: String = ""
    var user: Bool = true
    var pets: [Pet] = []
    
    @Relationship(deleteRule: .cascade)
    var address: Address
    var email: String = ""

    init(firstName: String, phoneNumber: String,address: Address?) {
        self.id = UUID()
        self.firstName = firstName
        self.address = address ?? Address()
    }
}


@Model
class Address: Identifiable{
    var street: String = ""
    var city: String = ""
    var zip: String = ""
    var state: String = ""

    init() {
      
    }
}

