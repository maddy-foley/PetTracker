//
//  Error.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/28/25.
//

import Foundation
import SwiftUI





struct ErrorWrapper: Identifiable, Hashable {
    let id: UUID
    let error: CustomError
    let guidance: String
    
    init(id: UUID = UUID(), error: CustomError, guidance: String) {
           self.id = id
           self.error = error
           self.guidance = guidance
       }

}

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) var router
    
    var body: some View {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        router.pop(count: 1)
                    }
                }
            }
        }
}
enum CustomError: Error {
    case deletionFailed
}

