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

        FooterView()
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
