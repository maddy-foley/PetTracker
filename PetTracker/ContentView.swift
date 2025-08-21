//
//  ContentView.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView{
            MainView()
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for:[Pet.self,Person.self], isAutosaveEnabled: false)
}
