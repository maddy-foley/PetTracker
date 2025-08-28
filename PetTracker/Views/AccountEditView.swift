//
//  AccountEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/27/25.
//
import SwiftUI
import SwiftData


// make generic person edit view?
struct AccountEditView: View {
    //    var modelContext: ModelContext
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) var router
    @Bindable var account: Person
    //    @State private var isDeleting = false
    
    
    //    init(accountID: PersistentIdentifier,in container: ModelContainer) {
    //        modelContext = ModelContext(container)
    //        modelContext.autosaveEnabled = false
    //        account = modelContext.model(for: accountID) as! Person
    //    }
    
    //    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form{
            Section("First Name"){
                TextField("Last Name", text: $account.firstName)
                    .disableAutocorrection(true)
            }
            Section("Last Name"){
                TextField("Last Name", text: $account.lastName)
                    .disableAutocorrection(true)
            }
            Section("Phone Number"){
                TextField("Phone Number", text: $account.phoneNumber)
                    .keyboardType(.phonePad)
            }
            Section("Email"){
                TextField("Email", text: $account.email)
                    .keyboardType(.emailAddress)
            }
            Section("Street"){
                TextField("Street", text: $account.address.street)
            }
            Section("City"){
                TextField("City", text: $account.address.city)
            }
            Section("Zip Code"){
                TextField("Zip Code", text: $account.address.zip)
                    .keyboardType(.decimalPad)
            }
            Section("State"){
                TextField("State", text: $account.address.state)
            }
            
        }
        
    }
//        .toolbar {
//            ToolbarItem(placement: .confirmationAction) {
//                Button("Save") {
//                    try? modelContext.save()
//                    router.pop()
//                }
//            }
//            ToolbarItem(placement: .cancellationAction) {
//                Button("Cancel") {
//                    modelContext.rollback()
//                    router.pop()
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button {
//                    router.pop()
//                } label: {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                        Text("Go Back")
//                    }
//                }
//            }
//        }
    

//        }
        
//    }
    
        //        .toolbar {
        //            Button { isDeleting = true } label: {
        //                Label("Delete \(pet.name)", systemImage: "trash")
        //                    .help("Delete this pet")
        //            }.alert("Delete \(pet.name)?", isPresented: $isDeleting) {
        //                Button("Yes, delete \(pet.name)", role: .destructive) {
        //                    delete(pet)
        //                    router.goBack(count: 2)
        //                }
        //            }
        //        }
        
        //    }
        //    private func delete(_ account: Person){
        //        do {
        //            modelContext.delete(person)
        //            try modelContext.save()
        //        } catch {        }
        //    }
    
    
    
}
