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
                    Image("person")
                        .resizable()
                        .frame(width: 190, height: 170, alignment: .topLeading)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 7)
                        )
                    Spacer()
                    Button(action: editAccount) {
                        Label("Edit", systemImage: "pencil")
                    }
                }
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
