//
//  AccountEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/27/25.
//
import SwiftUI
import SwiftData


struct AccountEditView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) var router
    @Bindable var account: Person
    @State var isConfirmed = false
    
    var body: some View {
        ZStack{
            VStack{
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
        }
        EditButtonView(isConfirmed: $isConfirmed)
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
