//
//  Router.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/27/25.
//

import SwiftUI


enum Route: Hashable {
    case home
    case detail(pet: Pet)
    case edit(pet: Pet)
//    case settings
}

@Observable
class Router{
    var navigationPath = NavigationPath()
    
    func add(to route: Route){
        navigationPath.append(route)
    }
    func pop() {
        navigationPath.removeLast()
    }
    
    func goBack(count: Int){
        for number in 1...count {
            navigationPath.removeLast()
        }
    }
    func reset() {
        navigationPath = NavigationPath()
    }
}
