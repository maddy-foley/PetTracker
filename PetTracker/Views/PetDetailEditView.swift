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
    @State var pet: Pet
    //    @Query
    
    var body: some View {
        
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
       
            Button("Save") {
                do {
                   try modelContext.save()
               } catch {
                   print("Error saving context: \(error)")
               }
                
            }
        
    
    }
    

}

#Preview {
    PetDetailEditView(pet: Pet(name: "Totoro", species: "dog"))
        .modelContainer(for: Pet.self, inMemory: true)
}
