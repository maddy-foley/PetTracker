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
    @State private var isDeleting = false
    
    var body: some View {
        
        VStack{
            Form{
                Section("Name"){
                    TextField("Name", text: $pet.name)
                        .disableAutocorrection(true)
                }
                Section("Species"){
                    TextField("Species", text: $pet.species)
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
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    try? modelContext.save()
                    router.pop()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    modelContext.rollback()
                    router.pop()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Button { isDeleting = true } label: {
                Label("Delete \(pet.name)", systemImage: "trash")
                    .help("Delete this pet")
            } .alert("Delete \(pet.name)?", isPresented: $isDeleting) {
                Button("Yes, delete \(pet.name)", role: .destructive) {
                    delete(pet)
                }
            }
            
        }
    }
    private func delete(_ pet: Pet){
        do {
            modelContext.delete(pet)
            try modelContext.save()
            router.pop(count: 2)
            
        } catch {
            modelContext.rollback()
            router.pop(count: 1)
            router.add(to: .errorDetail(errorWrapper: ErrorWrapper(error: CustomError.deletionFailed, guidance: "Failed")))
        }
    }
    
    
}

