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
    @State var deletionConfirmed = false
    
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
        
        EditButtonView(includeDelete: true, deletionConfirmed: $deletionConfirmed, title: "Delete \(pet.name)? (Cannot be Undone).")
            .onChange(of: deletionConfirmed) {
                delete(pet: pet)
        }
    }
    
    
    func delete(pet: Pet){
        do {
            modelContext.delete(pet)
            try modelContext.save()
            router.pop(2)
        } catch {
            modelContext.rollback()
            router.pop()
        }
    }
    
    
}

