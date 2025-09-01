//
//  PopUpView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/30/25.
//

import SwiftUI
import SwiftData




struct EditButtonView: View {
    @Environment(\.modelContext) private var modelContext
    @State var isDeleting = false
    @State var includeDelete = false
    @Binding var deletionConfirmed: Bool
    @State var title: String?
    @Environment(\.dismiss) private var dismiss
    

    
    var body: some View {
            ZStack{
                VStack(alignment: .trailing){
                    if includeDelete == true {
                        Button { isDeleting = true } label: {
                            Label("Delete", systemImage: "trash")
                                .help("Delete this pet")
                        }
                        .alert(title!, isPresented: $isDeleting) {
                            Button("Yes, delete") {
                                deletionConfirmed = true
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
//
//#Preview {
//    ButtonView()
//}
