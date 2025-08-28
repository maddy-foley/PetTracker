//
//  Router.swift
//  PetTracker
//
//  Created by Maddy Foley on 8/27/25.
//

import SwiftUI


enum Route: Hashable, Identifiable{
    case homeTab
    case accountEdit(account: Person)
    case petDetail(pet: Pet)
    case petEdit(pet: Pet)
    case errorDetail(errorWrapper: ErrorWrapper)
    
    var id: Self {self}
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
        for _ in 1...count {
            navigationPath.removeLast()
        }
    }
    func reset() {
        navigationPath = NavigationPath()
    }
}
