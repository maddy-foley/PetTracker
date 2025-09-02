//
//  FooterView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI


struct MainNavView: View {
    @Environment(Router.self) var router
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        
        ZStack {
            Spacer()
            VStack{
                
                HStack(alignment: .center){
                    TabView{
                        Tab("Pets", systemImage: "pawprint") {
                            PetListView()
                        }
                        Tab("Account", systemImage: "person") {
                            AccountView()
                        }
                    }
                }
            }
            .background(.blue)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}


