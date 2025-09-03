//
//  specieEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 9/2/25.
//

import SwiftUI
import SwiftData


struct specieEditView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) var router
    @State var specie: Specie
    @State var isConfirmed = true
    
    var body: some View {
        VStack{
            Form{
                Section("Name"){
                    TextField("Name", text: $specie.name)
                        .disableAutocorrection(true)
                }
            }
            
//            EditButtonView(isConfirmed: $isConfirmed)
              
        }
    }
}
