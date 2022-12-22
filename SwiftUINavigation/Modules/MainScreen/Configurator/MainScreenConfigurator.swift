//
//  MainScreenConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

typealias MainScreenModule = (model: MainScreenModel, input: MainScreenInput)

struct MainScreenModel {
    let viewState: MainScreenViewState
    let viewOutput: MainScreenViewOutput
}

final class MainScreenConfigurator {
    func configure(output: MainScreenOutput) -> MainScreenModule {
        let viewState = MainScreenViewState()
        
        let viewModel = MainScreenViewModel(
            viewState: viewState,
            output: output
        )
        
        let model = MainScreenModel(viewState: viewState, viewOutput: viewModel)
        
        return (model, viewModel)
    }
}
