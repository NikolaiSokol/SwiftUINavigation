//
//  MainScreenCoordinator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

final class MainScreenCoordinator {
    private weak var output: MainScreenCoordinatorOutput?
    private let coordinatorsFactory: CoordinatorsFactoring
    private let rootModulesFactory: RootModulesFactoring
    private let modulesFactory: ModulesFactoring
    private let router: Router
    
    private weak var mainScreenRootInput: MainScreenRootInput?
    
    private var firstTestCoordinatorInput: FirstTestCoordinatorInput?
    private var secondTestCoordinatorInput: SecondTestCoordinatorInput?
    private var thirdTestCoordinatorInput: ThirdTestCoordinatorInput?
    
    init(
        output: MainScreenCoordinatorOutput,
        coordinatorsFactory: CoordinatorsFactoring,
        rootModulesFactory: RootModulesFactoring,
        modulesFactory: ModulesFactoring
    ) {
        self.output = output
        self.coordinatorsFactory = coordinatorsFactory
        self.rootModulesFactory = rootModulesFactory
        self.modulesFactory = modulesFactory
        
        router = Router()
    }
    
    private func showMainScreenRoot() -> AnyView {
        let unit = rootModulesFactory.makeMainScreenRoot(output: self, router: router)
        mainScreenRootInput = unit.input
        mainScreenRootInput?.bootstrap()
        
        return unit.view
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

// MARK: - RootCoordinator

extension MainScreenCoordinator: RootCoordinator {
    func start() -> AnyView {
        showMainScreenRoot()
    }
}

// MARK: - MainScreenRootInput

extension MainScreenCoordinator: MainScreenCoordinatorInput {
    func popToRoot() {
        router.popToRoot()
    }
}

// MARK: - MainScreenRootOutput

extension MainScreenCoordinator: MainScreenRootOutput {
    func mainScreenRootDidRequest(event: MainScreenEvent) {
        switch event {
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

extension MainScreenCoordinator: FirstTestCoordinatorOutput {}

// MARK: - SecondTestCoordinatorOutput

extension MainScreenCoordinator: SecondTestCoordinatorOutput {}

// MARK: - ThirdTestCoordinatorOutput

extension MainScreenCoordinator: ThirdTestCoordinatorOutput {}
