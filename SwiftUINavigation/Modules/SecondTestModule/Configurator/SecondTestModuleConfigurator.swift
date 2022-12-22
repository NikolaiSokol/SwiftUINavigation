//
//  SecondTestModuleConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class SecondTestModuleConfigurator {
    func configure(output: SecondTestModuleOutput) -> NavigableModule<SecondTestModuleInput> {
        let viewState = SecondTestModuleViewState()
        
        let viewModel = SecondTestModuleViewModel(
            viewState: viewState,
            output: output
        )
        
        let view = SecondTestModuleView(viewState: viewState, output: viewModel)
        
        return (NavigableView(view: view.eraseToAnyView()), viewModel)
    }
}
