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
    
    var id: Self {self}
}

@Observable
class Router{
    var navigationPath = NavigationPath()
    var arrPath:[String] = []
    
    func add(to route: Route){
        arrPath.append(String(route.id.hashValue))
        navigationPath.append(route)
    }
    func stringPath() -> String {
        return arrPath.joined(separator: "/")
    }
    
    func pop() {
        arrPath.popLast()
        navigationPath.removeLast()
    }
    
    func goBack(count: Int){
        for _ in 1...count {
            arrPath.popLast()
            navigationPath.removeLast()
        }
    }
    func reset() {
        arrPath = []
        navigationPath = NavigationPath()
    }
}
