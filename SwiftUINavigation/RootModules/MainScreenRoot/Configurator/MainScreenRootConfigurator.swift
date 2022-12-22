//
//  MainScreenRootConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class MainScreenRootConfigurator {
    private let modulesFactory: ModulesFactoring
    
    init(modulesFactory: ModulesFactoring) {
        self.modulesFactory = modulesFactory
    }
    
    func configure(router: Router, output: MainScreenRootOutput) -> RootModule<MainScreenRootInput> {
        let viewState = MainScreenRootViewState()
        
        let viewModel = MainScreenRootViewModel(
            viewState: viewState,
            output: output,
            modulesFactory: modulesFactory
        )
        
        let view = MainScreenRootView(state: viewState, router: router, output: viewModel)
        
        return (view.eraseToAnyView(), viewModel)
    }
}
