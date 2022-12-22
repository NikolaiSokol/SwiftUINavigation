//
//  ThirdTestCoordinator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class ThirdTestCoordinator {
    private weak var output: ThirdTestCoordinatorOutput?
    private let coordinatorsFactory: CoordinatorsFactoring
    private let modulesFactory: ModulesFactoring
    private let router: Routable
    
    private var thirdTestModuleInput: ThirdTestModuleInput?
    
    private var firstTestCoordinatorInput: FirstTestCoordinatorInput?
    private var secondTestCoordinatorInput: SecondTestCoordinatorInput?
    private var thirdTestCoordinatorInput: ThirdTestCoordinatorInput?
    
    init(
        output: ThirdTestCoordinatorOutput,
        coordinatorsFactory: CoordinatorsFactoring,
        modulesFactory: ModulesFactoring,
        router: Routable
    ) {
        self.output = output
        self.coordinatorsFactory = coordinatorsFactory
        self.modulesFactory = modulesFactory
        self.router = router
    }
    
    private func showThirdTestModule() {
        let unit = modulesFactory.makeThirdTestModule(output: self)
        thirdTestModuleInput = unit.input
        router.present(unit.view)
    }
    
    private func presentFirstTestModule() {
        let unit = coordinatorsFactory.makeFirstTestCoordinator(output: self, router: router)
        firstTestCoordinatorInput = unit.input
        unit.coordinator.start()
    }
    
    private func presentSecondTestModule() {
        let unit = coordinatorsFactory.makeSecondTestCoordinator(output: self, router: router)
        secondTestCoordinatorInput = unit.input
        unit.coordinator.start()
    }
    
    private func presentThirdTestModule() {
        let unit = coordinatorsFactory.makeThirdTestCoordinator(output: self, router: router)
        thirdTestCoordinatorInput = unit.input
        unit.coordinator.start()
    }
}

// MARK: - Coordinator

extension ThirdTestCoordinator: Coordinator {
    func start() {
        showThirdTestModule()
    }
}

// MARK: - ThirdTestCoordinatorInput

extension ThirdTestCoordinator: ThirdTestCoordinatorInput {}

// MARK: - ThirdTestModuleOutput

extension ThirdTestCoordinator: ThirdTestModuleOutput {
    func thirdTestModuleDidRequest(event: ThirdTestModuleEvent) {
        switch event {
        case .back:
            router.pop()
            
        case .clearNavigationStack:
            router.popToRoot()
            
        case .showFirstTestScreen:
            presentFirstTestModule()
            
        case .showSecondTestScreen:
            presentSecondTestModule()
            
        case .showThirdTestScreen:
            presentThirdTestModule()
        }
    }
}

// MARK: - FirstTestCoordinatorOutput

extension ThirdTestCoordinator: FirstTestCoordinatorOutput {}

// MARK: - SecondTestCoordinatorOutput

extension ThirdTestCoordinator: SecondTestCoordinatorOutput {}

// MARK: - ThirdTestCoordinatorOutput

extension ThirdTestCoordinator: ThirdTestCoordinatorOutput {}
