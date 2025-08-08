//
//  HeaderView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI


struct HeaderView: View {
    @Environment(\.modelContext) private var modelContext


    var body: some View {
        ZStack{
            VStack(){
                HStack(){
                    Text("Left")
                        .padding(.leading)
                    Spacer()
                    Text("Right")
                        .padding(.trailing)
                    }
                .padding(.bottom)
                    
            }
            .background(.blue)
        }
            Spacer()
        }
}


