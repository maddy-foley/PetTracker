//
//  PetDetailEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/18/25.
//

import SwiftUI
import SwiftData


struct PetDetailEditView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) var router
    @Bindable var pet: Pet
    @State var isConfirmed = false
    
    var body: some View {
        VStack{
            Form{
                Section("Name"){
                    TextField("Name", text: $pet.name)
                        .disableAutocorrection(true)
                }
                Section("Birthday"){
                    DatePicker("Date", selection: $pet.birthday, displayedComponents: .date)
                }
                Section("Weight"){
                    TextField("Weight", value: $pet.weight, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Status"){
                    Toggle(isOn: $pet.active) {
                        Text("Active")
                    }
                }
                Section("Hide Pet"){
                    Toggle(isOn: $pet.hide) {
                        Text("Hide")
                    }
                }
                Section("Sex"){
                    Picker("Sex", selection: $pet.sex){
                        ForEach(Sex.allCases, id: \.self) { sex in
                            Text(sex.rawValue)
                        }
                    }
                }
                
            }
            
            
        }
        // pet deletion confirmation prompt (message, submit button, role)
        let popUpWrapper = PopUpWrapper("Delete \(pet.name)? (Cannot be Undone).", confirmationButtonText: "Delete", .deletion)
        
        //edit buttons
        EditButtonView(isConfirmed: $isConfirmed, popUpWrapper: popUpWrapper)
            .onChange(of: isConfirmed) {
                delete(pet)
            }
    }
    
    private func delete(_ pet: Pet){
        do {
            modelContext.delete(pet)
            try modelContext.save()
            
            // goes back to pet list
            router.pop(2)
            
        } catch {
            modelContext.rollback()
            
            // goes back to pet's profile
            router.pop()
        }
    }
}

