//
//  FirstTestCoordinator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class FirstTestCoordinator {
    private weak var output: FirstTestCoordinatorOutput?
    private let coordinatorsFactory: CoordinatorsFactoring
    private let modulesFactory: ModulesFactoring
    private let router: Routable
    
    private var firstTestModuleInput: FirstTestModuleInput?
    
    private var thirdTestCoordinatorInput: ThirdTestCoordinatorInput?
    
    init(
        output: FirstTestCoordinatorOutput,
        coordinatorsFactory: CoordinatorsFactoring,
        modulesFactory: ModulesFactoring,
        router: Routable
    ) {
        self.output = output
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        self.router = router
    }
    
    private func showFirstTestModule() {
        let unit = modulesFactory.makeFirstTestModule(output: self)
        firstTestModuleInput = unit.input
        router.present(unit.view)
    }
    
    private func presentThirdTestModule() {
        let unit = coordinatorsFactory.makeThirdTestCoordinator(output: self, router: router)
        thirdTestCoordinatorInput = unit.input
        unit.coordinator.start()
    }
}

// MARK: - Coordinator

extension FirstTestCoordinator: Coordinator {
    func start() {
        showFirstTestModule()
    }
}

// MARK: - FirstTestCoordinatorInput

extension FirstTestCoordinator: FirstTestCoordinatorInput {}

// MARK: - FirstTestModuleOutput

extension FirstTestCoordinator: FirstTestModuleOutput {
    func firstTestModuleDidRequest(event: FirstTestModuleEvent) {
        switch event {
        case .back:
            router.pop()
            
        case .showThirdTestScreen:
            presentThirdTestModule()
        }
    }
}

// MARK: - ThirdTestCoordinatorOutput

extension FirstTestCoordinator: ThirdTestCoordinatorOutput {}
