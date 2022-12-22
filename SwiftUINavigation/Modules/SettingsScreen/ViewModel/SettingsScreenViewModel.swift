//
//  SettingsScreenViewModel.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class SettingsScreenViewModel {
    private let viewState: SettingsScreenViewState
    private weak var output: SettingsScreenOutput?

    init(
        viewState: SettingsScreenViewState,
        output: SettingsScreenOutput
    ) {
        self.viewState = viewState
        self.output = output
    }
}

// MARK: - SettingsScreenInput

extension SettingsScreenViewModel: SettingsScreenInput {}

// MARK: - SettingsScreenViewOutput

extension SettingsScreenViewModel: SettingsScreenViewOutput {}
