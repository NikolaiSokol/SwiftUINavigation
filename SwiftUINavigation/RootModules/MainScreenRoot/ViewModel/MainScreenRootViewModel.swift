//
//  MainScreenRootViewModel.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class MainScreenRootViewModel {
    private let viewState: MainScreenRootViewState
    private weak var output: MainScreenRootOutput?
    private let modulesFactory: ModulesFactoring
    
    private var mainScreenInput: MainScreenInput?
    
    init(
        viewState: MainScreenRootViewState,
        output: MainScreenRootOutput,
        modulesFactory: ModulesFactoring
    ) {
        self.viewState = viewState
        self.output = output
        self.modulesFactory = modulesFactory
    }
    
    private func setupMainScreen() {
        let unit = modulesFactory.makeMainScreen(output: self)
        
        mainScreenInput = unit.input
        viewState.mainScreenModel = unit.model
    }
}

// MARK: - MainScreenRootInput

extension MainScreenRootViewModel: MainScreenRootInput {
    func bootstrap() {
        setupMainScreen()
    }
}

// MARK: - MainScreenNavigationViewOutput

extension MainScreenRootViewModel: MainScreenRootViewOutput {}

// MARK: - MainScreenOutput

extension MainScreenRootViewModel: MainScreenOutput {
    func mainScreenDidRequest(event: MainScreenEvent) {
        output?.mainScreenRootDidRequest(event: event)
    }
}
