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
        .navigationBarBackButtonHidden(true)
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
        }
}
