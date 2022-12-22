//
//  TabBarCoordinator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

final class TabBarCoordinator {
    private let coordinatorFactory: CoordinatorsFactoring
    private let rootModulesFactory: RootModulesFactoring
    private let modulesFactory: ModulesFactoring
    private let tabBarElementBuilder: TabBarElementBuilding
    
    private var tabBarInput: TabBarInput?
    private var mainScreenCoordinatorInput: MainScreenCoordinatorInput?
    private var settingsScreenCoordinatorInput: SettingsScreenCoordinatorInput?
    
    init(
        coordinatorFactory: CoordinatorsFactoring,
        rootModulesFactory: RootModulesFactoring,
        modulesFactory: ModulesFactoring
    ) {
        self.coordinatorFactory = coordinatorFactory
        self.rootModulesFactory = rootModulesFactory
        self.modulesFactory = modulesFactory
        
        tabBarElementBuilder = TabBarElementBuilder()
    }
    
    private func showTabBar() -> AnyView {
        let unit = rootModulesFactory.makeTabBar(output: self)
        tabBarInput = unit.input
        
        prepareTabs()
        
        return unit.view
    }
    
    private func prepareTabs() {
        let tabs = [
            prepareMainScreenRootTab(),
            prepareSettingsScreenRootTab()
        ]
        
        tabBarInput?.updateTabs(tabs)
    }
    
    private func prepareMainScreenRootTab() -> TabBarElement {
        let unit = coordinatorFactory.makeMainScreenRootCoordinator(output: self)
        mainScreenCoordinatorInput = unit.input
        
        return tabBarElementBuilder.buildTabBarElement(view: unit.view, type: .mainScreenRoot)
    }
    
    private func prepareSettingsScreenRootTab() -> TabBarElement {
        let unit = coordinatorFactory.makeSettingsScreenRootCoordinator(output: self)
        settingsScreenCoordinatorInput = unit.input
        
        return tabBarElementBuilder.buildTabBarElement(view: unit.view, type: .settingsScreenRoot)
    }
}

// MARK: - RootCoordinator

extension TabBarCoordinator: RootCoordinator {
    func start() -> AnyView {
        showTabBar()
    }
}

// MARK: - TabBarOutput

extension TabBarCoordinator: TabBarOutput {
    func didTapSelectedTab(_ tab: TabBarElementType) {
        switch tab {
        case .mainScreenRoot:
            mainScreenCoordinatorInput?.popToRoot()
            
        case .settingsScreenRoot:
            settingsScreenCoordinatorInput?.popToRoot()
        }
    }
}

// MARK: - MainScreenCoordinatorOutput

extension TabBarCoordinator: MainScreenCoordinatorOutput {}

// MARK: - SettingsScreenCoordinatorOutput

extension TabBarCoordinator: SettingsScreenCoordinatorOutput {}
