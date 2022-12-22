//
//  SettingsScreenRootView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct SettingsScreenRootView: View {
    @ObservedObject private var state: SettingsScreenRootViewState
    @ObservedObject private var router: Router
    
    private let output: SettingsScreenRootViewOutput
    
    init(
        state: SettingsScreenRootViewState,
        router: Router,
        output: SettingsScreenRootViewOutput
    ) {
        self.state = state
        self.router = router
        self.output = output
    }
    
    var body: some View {
        if let model = state.settingsScreenModel {
            NavigationStack(path: $router.navigableViews) {
                SettingsScreenView(viewState: model.viewState, output: model.viewOutput)
                    .navigationDestination(for: NavigableView.self) {
                        $0.view
                    }
            }
        }
    }
}
