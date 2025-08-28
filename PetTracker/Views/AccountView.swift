//
//  AccountView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/9/25.
//

import SwiftUI
import SwiftData


struct AccountView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(Router.self) var router
    
    // MAYBE FIX see below:
    // (person.first)
    @Query(filter: #Predicate<Person>{ $0.user == true} )
    var persons: [Person]

    var body: some View {

        ZStack{
           
            VStack{
                HStack(alignment: .top){
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 170, height: 170, alignment: .topLeading)
                    Spacer()
                    if persons.isEmpty{
                        //FIX
                        Text("Empty")
                    } else {
                        Button("Edit", systemImage: "Pencil"){
                            router.add(to: .accountEdit(account: persons.first!))
                        }
                    }
                }
                Divider()
                Spacer()
            }
            .padding()

        }
    }

}
