//
//  EditButtonView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/30/25.
//

import SwiftUI
import SwiftData




struct EditButtonView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isConfirmed: Bool
    @State var isConfirming: Bool = false
    var popUpWrapper: PopUpWrapper?
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .trailing){
                
                if (popUpWrapper != nil) {
                    //switch statement for potential future confirmation handling
                    switch popUpWrapper!.buttonType {
                    case .deletion:
                        Button("Delete", systemImage: "trash") {
                            isConfirming = true
                        }
                        .help("Delete")
                        .confirmationDialog("Delete", isPresented: $isConfirming){
                            Button(popUpWrapper!.message, role: .destructive){
                                isConfirmed = true
                            }
                        }
                    }
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    try? modelContext.save()
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    modelContext.rollback()
                    dismiss()
                }
            }
        }
    }
    
    
    
}

