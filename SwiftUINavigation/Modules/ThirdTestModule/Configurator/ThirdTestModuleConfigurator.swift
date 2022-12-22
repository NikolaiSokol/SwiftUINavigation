//
//  ThirdTestModuleConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class ThirdTestModuleConfigurator {
    private let modulesFactory: ModulesFactoring
    
    init(modulesFactory: ModulesFactoring) {
        self.modulesFactory = modulesFactory
    }
    
    func configure(output: ThirdTestModuleOutput) -> NavigableModule<ThirdTestModuleInput> {
        let viewState = ThirdTestModuleViewState()
        
        let viewModel = ThirdTestModuleViewModel(
            viewState: viewState,
            output: output,
            modulesFactory: modulesFactory
        )
        
        let view = ThirdTestModuleView(viewState: viewState, output: viewModel)
        
        return (NavigableView(view: view.eraseToAnyView()), viewModel)
    }
}
