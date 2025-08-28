//
//  FooterView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI


struct MainView: View {
    @Environment(Router.self) var router
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        
        ZStack{
            Spacer()
            VStack(){
                
                HStack(alignment: .center){
                    // set up nav bar
                    TabView{
                        PetListView()
                            .tabItem{
                                Label("Pets", systemImage: "pawprint.fill")
                            }
                        
                        AccountView()
                            .tabItem{
                                Label("Account", systemImage: "person.crop.circle.fill")
                            }
                        
                        
                    }
                    
                }
                
            }
            .background(.blue)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}


