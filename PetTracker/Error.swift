//
//  Error.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/28/25.
//

import Foundation
import SwiftUI
import SwiftData



struct ErrorWrapper: Identifiable, Hashable {
    let id: UUID
    let error: CustomError
    let guidance: String
    let title: String
    
    init(id: UUID = UUID(), error: CustomError, guidance: String, title: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
        self.title = title
    }
    
}


enum CustomError: Error {
    case deletionFailed
}


