//
//  SettingsScreenConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

typealias SettingsScreenModule = (model: SettingsScreenModel, input: SettingsScreenInput)

struct SettingsScreenModel {
    let viewState: SettingsScreenViewState
    let viewOutput: SettingsScreenViewOutput
}

final class SettingsScreenConfigurator {
    func configure(output: SettingsScreenOutput) -> SettingsScreenModule {
        let viewState = SettingsScreenViewState()
        
        let viewModel = SettingsScreenViewModel(
            viewState: viewState,
            output: output
        )
        
        let model = SettingsScreenModel(viewState: viewState, viewOutput: viewModel)
        
        return (model, viewModel)
    }
}
