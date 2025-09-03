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
    @State private var dialogDeleteDetail: String?
    
    var body: some View{
        ZStack{
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
          
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role:.cancel){
                        modelContext.rollback()
                        router.pop()
                    }
                    
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save") {
                        try? modelContext.save()
                        router.pop()
                    }
                }
                ToolbarItem(placement: .bottomBar){
                    Button("Delete", role: .destructive) {
                        isDeleting = true
                    }
                    .confirmationDialog("Delete", isPresented: $isDeleting){
                        Button("Delete \(pet.name)? (Cannot be undone.)", role: .destructive){
                            delete(pet)
                        }
                        Button("Cancel", role: .cancel) {
                            dialogDeleteDetail = nil
                        }
                    }
                }
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
