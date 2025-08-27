//
//  AccountEditView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/27/25.
//
import SwiftUI
import SwiftData

struct AccountEditView: View {
    var modelContext: ModelContext
    @Environment(Router.self) var router
    @Bindable var account: Person
//    @State private var isDeleting = false
    @Environment(\.modelContext) private var OGmodelContext

    init(accountID: PersistentIdentifier,in container: ModelContainer) {
            modelContext = ModelContext(container)
            modelContext.autosaveEnabled = false
            account = modelContext.model(for: accountID) as! Person
        }
    
//    @Environment(\.dismiss) private var dismiss
    
    var body: some View {

        VStack{
            Form{
                Section("Name"){
                    TextField("Name", text: $account.name)
                        .disableAutocorrection(true)
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
//                    router.pop()
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
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
        }
    
//    }
//    private func delete(_ account: Person){
//        do {
//            modelContext.delete(person)
//            try modelContext.save()
//        } catch {        }
//    }
}
