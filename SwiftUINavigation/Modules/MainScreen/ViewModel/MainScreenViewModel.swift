//
//  MainScreenViewModel.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class MainScreenViewModel {
    private let viewState: MainScreenViewState
    private weak var output: MainScreenOutput?

    init(
        viewState: MainScreenViewState,
        output: MainScreenOutput
    ) {
        self.viewState = viewState
        self.output = output
    }
}

// MARK: - MainScreenInput

extension MainScreenViewModel: MainScreenInput {}

// MARK: - MainScreenViewOutput

extension MainScreenViewModel: MainScreenViewOutput {
    func didTapShowFirstTestScreen() {
        output?.mainScreenDidRequest(event: .showFirstTestScreen)
    }
    
    func didTapShowSecondTestScreen() {
        output?.mainScreenDidRequest(event: .showSecondTestScreen)
    }
    
    func didTapShowThirdTestScreen() {
        output?.mainScreenDidRequest(event: .showThirdTestScreen)
    }
}
 
