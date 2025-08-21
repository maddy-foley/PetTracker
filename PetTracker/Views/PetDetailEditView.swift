//
//  PetDetailEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/18/25.
//

import SwiftUI
import SwiftData


struct PetDetailEditView: View {
//    @Environment(\.modelContext) private var modelContext
    var modelContext: ModelContext
    @Bindable var pet: Pet
//    var petID: UUID
    
        init(petID: PersistentIdentifier, in container: ModelContainer) {
            modelContext = ModelContext(container)
            modelContext.autosaveEnabled = false
            pet = modelContext.model(for: petID) as! Pet
        }

   
    

    @Environment(\.dismiss) private var dismiss


//    @Environment(\.undoManager) private var undoManager
    
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
                    Picker("Sex", selection: $pet.gender){
                        ForEach(Sex.allCases, id: \.self) { sex in
                            Text(sex.rawValue)
                        }
                    }
                }
                
            }
            
        }.toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    try? modelContext.save()
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
       
    
    }
    

}
