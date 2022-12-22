//
//  FirstTestModuleViewModel.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class FirstTestModuleViewModel {
    private let viewState: FirstTestModuleViewState
    private weak var output: FirstTestModuleOutput?
    
    init(
        viewState: FirstTestModuleViewState,
        output: FirstTestModuleOutput
    ) {
        self.viewState = viewState
        self.output = output
    }
}

// MARK: - FirstTestModuleInput

extension FirstTestModuleViewModel: FirstTestModuleInput {}

// MARK: - FirstTestModuleViewOutput

extension FirstTestModuleViewModel: FirstTestModuleViewOutput {
    func didTapGoBack() {
        output?.firstTestModuleDidRequest(event: .back)
    }
    
    func didTapShowThirdTestScreen() {
        output?.firstTestModuleDidRequest(event: .showThirdTestScreen)
    }
}
