//
//  AccountView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/9/25.
//

import SwiftUI


struct AccountView: View {
    @Environment(\.modelContext) private var modelContext


    var body: some View {
        ZStack{
            VStack{
                HStack(alignment: .top){
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 170, height: 170, alignment: .topLeading)
                    Spacer()
                    Button(action: editAccount) {
                        Label("Edit", systemImage: "pencil")
                    }
                }
                Divider()
                Spacer()
            }
            .padding()

        }
    }
    
    private func editAccount(){
    }
}

#Preview {
    AccountView()
        .modelContainer(for: Pet.self, inMemory: true)
}
