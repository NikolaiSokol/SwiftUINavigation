//
//  SecondTestModuleViewModel.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class SecondTestModuleViewModel {
    private let viewState: SecondTestModuleViewState
    private weak var output: SecondTestModuleOutput?
    
    init(
        viewState: SecondTestModuleViewState,
        output: SecondTestModuleOutput
    ) {
        self.viewState = viewState
        self.output = output
    }
}

// MARK: - SecondTestModuleInput

extension SecondTestModuleViewModel: SecondTestModuleInput {}

// MARK: - SecondTestModuleViewOutput

extension SecondTestModuleViewModel: SecondTestModuleViewOutput {
    func didTapShowSecondTestScreen() {
        output?.secondTestModuleDidRequest(event: .showSecondTestScreen)
    }
    
    func didTapClearNavigationStack() {
        output?.secondTestModuleDidRequest(event: .clearNavigationStack)
    }
}
