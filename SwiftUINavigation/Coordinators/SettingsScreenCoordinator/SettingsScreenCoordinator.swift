//
//  SettingsScreenCoordinator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

final class SettingsScreenCoordinator {
    private weak var output: SettingsScreenCoordinatorOutput?
    private let coordinatorsFactory: CoordinatorsFactoring
    private let rootModulesFactory: RootModulesFactoring
    private let modulesFactory: ModulesFactoring
    private let router: Router
    
    private var settingsScreenRootInput: SettingsScreenRootInput?
    
    init(
        output: SettingsScreenCoordinatorOutput,
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
    
    private func showSettingsScreenRoot() -> AnyView {
        let unit = rootModulesFactory.makeSettingsScreenRoot(output: self, router: router)
        settingsScreenRootInput = unit.input
        settingsScreenRootInput?.bootstrap()
        
        return unit.view
    }
}

// MARK: - RootCoordinator

extension SettingsScreenCoordinator: RootCoordinator {
    func start() -> AnyView {
        showSettingsScreenRoot()
    }
}

// MARK: - SettingsScreenCoordinatorInput

extension SettingsScreenCoordinator: SettingsScreenCoordinatorInput {
    func popToRoot() {
        router.popToRoot()
    }
}

// MARK: - SettingsScreenRootOutput

extension SettingsScreenCoordinator: SettingsScreenRootOutput {}
