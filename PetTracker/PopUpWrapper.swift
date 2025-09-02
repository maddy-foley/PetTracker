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

struct PopUpWrapper: Identifiable, Hashable {
    let id: UUID
    let confirmationButtonText: String
    let message: String
    let buttonType: ButtonType
    
    
    init(_ message: String, confirmationButtonText: String,_ buttonType: ButtonType){
        self.id = UUID()
        self.message = message
        self.confirmationButtonText = confirmationButtonText
        self.buttonType = buttonType
    }
    
}

enum ButtonType: CaseIterable{
    case deletion
}

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
