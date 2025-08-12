//
//  FooterView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI


struct FooterView: View {
    @Environment(\.modelContext) private var modelContext

//    @State private var selectedTab: Tab = .home
 
    var body: some View {
        
        ZStack{
            Spacer()
            VStack(){
           
                HStack(alignment: .center){
                    // set up nav bar
                    TabView{
                        
//                        HomeView()
//                            .tabItem{
//                                Label("Home", systemImage: "house.fill")
//                            }
                        PetListView()
                            .tabItem{
                                Label("Pets", systemImage: "pawprint.fill")
                            }
                        AccountView()
                            .tabItem{
                                Label("Account", systemImage: "person.crop.circle.fill")
                            }
////                            .badge(2)
//
//
//                            Tab("Pets", systemImage: "pawprint.fill") {
//                                PetListView()
//                            }
//
//
//                            Tab("Account", systemImage: "person.crop.circle.fill") {
//                                AccountView()
//                            }
////                            .badge("!")
                        
                        
                    }
                    
                }
                    
            }
            .background(.blue)
                
            }
            .edgesIgnoringSafeArea(.bottom)
          
        }
}


