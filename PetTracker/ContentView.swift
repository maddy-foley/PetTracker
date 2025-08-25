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
//    @State private var path = NavigationPath()
    @Query private var pets: [Pet]

    var body: some View {
//        NavigationStack{
            MainView()
                .onAppear {
                addTestData()
            }
//        }
//        .navigationTitle("Root")
    }
    
    private func addTestData() {
        if pets.isEmpty {
            let newPet1 = Pet(name: "Totoro", species: "Dog")
            let newPet2 = Pet(name: "Alice", species: "Cat")
            modelContext.insert(newPet1)
            modelContext.insert(newPet2)
            try? modelContext.save()
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for:[Pet.self,Person.self], isAutosaveEnabled: false)
}
