//
//  PopUp.swift
//  PetTracker
//
//  Created by Maddy Foley on 9/2/25.
//
//
import Foundation
import SwiftUI
import SwiftData


// throw errors, not currently in use
struct ErrorWrapper: Identifiable, Hashable {
    let id: UUID
    let error: CustomError
    let guidance: String
    let title: String

    init(_ error: CustomError, guidance: String, title: String) {
        self.id = UUID()
        self.error = error
        self.guidance = guidance
        self.title = title
    }
}


enum CustomError: Error {
    case deletionFailed
}
