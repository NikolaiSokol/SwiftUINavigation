//
//  SecondTestCoordinator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class SecondTestCoordinator {
    private weak var output: SecondTestCoordinatorOutput?
    private let coordinatorsFactory: CoordinatorsFactoring
    private let modulesFactory: ModulesFactoring
    private let router: Routable
    
    private var secondTestModuleInput: SecondTestModuleInput?
    
    private var secondTestCoordinatorInput: SecondTestCoordinatorInput?
    
    init(
        output: SecondTestCoordinatorOutput,
        coordinatorsFactory: CoordinatorsFactoring,
        modulesFactory: ModulesFactoring,
        router: Routable
    ) {
        self.output = output
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        self.router = router
    }
    
    private func showSecondTestModule() {
        let unit = modulesFactory.makeSecondTestModule(output: self)
        secondTestModuleInput = unit.input
        router.present(unit.view)
    }
    
    private func presentSecondTestModule() {
        let unit = coordinatorsFactory.makeSecondTestCoordinator(output: self, router: router)
        secondTestCoordinatorInput = unit.input
        unit.coordinator.start()
    }
}

// MARK: - Coordinator

extension SecondTestCoordinator: Coordinator {
    func start() {
        showSecondTestModule()
    }
}

// MARK: - SecondTestCoordinatorInput

extension SecondTestCoordinator: SecondTestCoordinatorInput {}

// MARK: - SecondTestModuleOutput

extension SecondTestCoordinator: SecondTestModuleOutput {
    func secondTestModuleDidRequest(event: SecondTestModuleEvent) {
        switch event {
        case .showSecondTestScreen:
            presentSecondTestModule()
            
        case .clearNavigationStack:
            router.popToRoot()
        }
    }
}

// MARK: - SecondTestCoordinatorOutput

extension SecondTestCoordinator: SecondTestCoordinatorOutput {}
