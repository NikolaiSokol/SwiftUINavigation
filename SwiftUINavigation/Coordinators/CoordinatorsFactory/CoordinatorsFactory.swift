//
//  CoordinatorsFactory.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class CoordinatorsFactory {
    let rootModulesFactory: RootModulesFactoring
    let modulesFactory: ModulesFactoring
    
    init(
        rootModulesFactory: RootModulesFactoring,
        modulesFactory: ModulesFactoring
    ) {
        self.rootModulesFactory = rootModulesFactory
        self.modulesFactory = modulesFactory
    }
}

extension CoordinatorsFactory: CoordinatorsFactoring {
    func makeTabBarCoordinator() -> RootCoordinator {
        TabBarCoordinator(
            coordinatorFactory: self,
            rootModulesFactory: rootModulesFactory,
            modulesFactory: modulesFactory
        )
    }
    
    func makeMainScreenRootCoordinator(
        output: MainScreenCoordinatorOutput
    ) -> RootCoordinatorModule<MainScreenCoordinatorInput> {
        let coordinator = MainScreenCoordinator(
            output: output,
            coordinatorsFactory: self,
            rootModulesFactory: rootModulesFactory,
            modulesFactory: modulesFactory
        )
        
        return (coordinator.start(), coordinator)
    }
    
    func makeSettingsScreenRootCoordinator(
        output: SettingsScreenCoordinatorOutput
    ) -> RootCoordinatorModule<SettingsScreenCoordinatorInput> {
        let coordinator = SettingsScreenCoordinator(
            output: output,
            coordinatorsFactory: self,
            rootModulesFactory: rootModulesFactory,
            modulesFactory: modulesFactory
        )
        
        return (coordinator.start(), coordinator)
    }
    
    func makeFirstTestCoordinator(
        output: FirstTestCoordinatorOutput,
        router: Routable
    ) -> ConcreteCoordinator<FirstTestCoordinatorInput> {
        let coordinator = FirstTestCoordinator(
            output: output,
            coordinatorsFactory: self,
            modulesFactory: modulesFactory,
            router: router
        )
        
        return (coordinator, coordinator)
    }
    
    func makeSecondTestCoordinator(
        output: SecondTestCoordinatorOutput,
        router: Routable
    ) -> ConcreteCoordinator<SecondTestCoordinatorInput> {
        let coordinator = SecondTestCoordinator(
            output: output,
            coordinatorsFactory: self,
            modulesFactory: modulesFactory,
            router: router
        )
        
        return (coordinator, coordinator)
    }
    
    func makeThirdTestCoordinator(
        output: ThirdTestCoordinatorOutput,
        router: Routable
    ) -> ConcreteCoordinator<ThirdTestCoordinatorInput> {
        let coordinator = ThirdTestCoordinator(
            output: output,
            coordinatorsFactory: self,
            modulesFactory: modulesFactory,
            router: router
        )
        
        return (coordinator, coordinator)
    }
}
