//
//  SwiftUINavigationApp.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

@main
struct SwiftUINavigationApp: App {
    private let tabBarCoordinator: RootCoordinator
    
    init() {
        let modulesFactory = ModulesFactory()
        let rootModulesFactory = RootModulesFactory(modulesFactory: modulesFactory)
        let coordinatorsFactory = CoordinatorsFactory(
            rootModulesFactory: rootModulesFactory,
            modulesFactory: modulesFactory
        )
        
        tabBarCoordinator = coordinatorsFactory.makeTabBarCoordinator()
    }
    
    var body: some Scene {
        WindowGroup {
            tabBarCoordinator.start()
        }
    }
}
