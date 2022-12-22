//
//  RootModulesFactory.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class RootModulesFactory {
    private let modulesFactory: ModulesFactoring
    
    init(modulesFactory: ModulesFactoring) {
        self.modulesFactory = modulesFactory
    }
}

extension RootModulesFactory: RootModulesFactoring {
    func makeTabBar(output: TabBarOutput) -> RootModule<TabBarInput> {
        TabBarConfigurator().configure(output: output)
    }
    
    func makeMainScreenRoot(
        output: MainScreenRootOutput,
        router: Router
    ) -> RootModule<MainScreenRootInput> {
        MainScreenRootConfigurator(modulesFactory: modulesFactory)
            .configure(router: router, output: output)
    }
    
    func makeSettingsScreenRoot(
        output: SettingsScreenRootOutput,
        router: Router
    ) -> RootModule<SettingsScreenRootInput> {
        SettingsScreenRootConfigurator(modulesFactory: modulesFactory)
            .configure(router: router, output: output)
    }
}
