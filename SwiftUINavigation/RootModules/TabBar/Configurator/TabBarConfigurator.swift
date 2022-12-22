//
//  TabBarConfigurator.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

final class TabBarConfigurator {
    func configure(output: TabBarOutput) -> RootModule<TabBarInput> {
        let viewState = TabBarViewState()
        
        let viewModel = TabBarViewModel(
            viewState: viewState,
            output: output
        )
        
        let view = TabBarView(viewState: viewState, output: viewModel)
        
        return (view.eraseToAnyView(), viewModel)
    }
}
