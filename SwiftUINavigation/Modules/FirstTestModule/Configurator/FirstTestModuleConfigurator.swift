//
//  FirstTestModuleConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class FirstTestModuleConfigurator {
    func configure(output: FirstTestModuleOutput) -> NavigableModule<FirstTestModuleInput> {
        let viewState = FirstTestModuleViewState()
        
        let viewModel = FirstTestModuleViewModel(
            viewState: viewState,
            output: output
        )
        
        let view = FirstTestModuleView(viewState: viewState, output: viewModel)
        
        return (NavigableView(view: view.eraseToAnyView()), viewModel)
    }
}
