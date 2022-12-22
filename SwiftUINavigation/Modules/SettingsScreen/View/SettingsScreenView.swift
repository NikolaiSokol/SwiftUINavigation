//
//  SettingsScreenView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct SettingsScreenView: View {
    @ObservedObject private var viewState: SettingsScreenViewState
    private let output: SettingsScreenViewOutput?
    
    init(
        viewState: SettingsScreenViewState,
        output: SettingsScreenViewOutput?
    ) {
        self.viewState = viewState
        self.output = output
    }
    
    var body: some View {
        Text("Settings Screen")
    }
}
