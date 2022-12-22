//
//  ThirdTestModuleViewModel.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class ThirdTestModuleViewModel {
    private let viewState: ThirdTestModuleViewState
    private weak var output: ThirdTestModuleOutput?
    private let modulesFactory: ModulesFactoring
    
    private var mainScreenInput: MainScreenInput?
    
    init(
        viewState: ThirdTestModuleViewState,
        output: ThirdTestModuleOutput,
        modulesFactory: ModulesFactoring
    ) {
        self.viewState = viewState
        self.output = output
        self.modulesFactory = modulesFactory
    }
    
    private func setupMainScreenSubmodule() {
        let unit = modulesFactory.makeMainScreen(output: self)
        mainScreenInput = unit.input
        viewState.mainScreenModel = unit.model
    }
}

// MARK: - ThirdTestModuleInput

extension ThirdTestModuleViewModel: ThirdTestModuleInput {}

// MARK: - ThirdTestModuleViewOutput

extension ThirdTestModuleViewModel: ThirdTestModuleViewOutput {
    func didTapGoBack() {
        output?.thirdTestModuleDidRequest(event: .back)
    }
    
    func didTapClearNavigationStack() {
        output?.thirdTestModuleDidRequest(event: .clearNavigationStack)
    }
    
    func didTapSetupMainScreenSubview() {
        setupMainScreenSubmodule()
    }
}

extension ThirdTestModuleViewModel: MainScreenOutput {
    func mainScreenDidRequest(event: MainScreenEvent) {
        switch event {
        case .showFirstTestScreen:
            output?.thirdTestModuleDidRequest(event: .showFirstTestScreen)
            
        case .showSecondTestScreen:
            output?.thirdTestModuleDidRequest(event: .showSecondTestScreen)
            
        case .showThirdTestScreen:
            output?.thirdTestModuleDidRequest(event: .showThirdTestScreen)
        }
    }
}
