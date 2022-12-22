//
//  SecondTestModuleView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct SecondTestModuleView: View {
    @ObservedObject private var viewState: SecondTestModuleViewState
    private let output: SecondTestModuleViewOutput?
    
    init(
        viewState: SecondTestModuleViewState,
        output: SecondTestModuleViewOutput?
    ) {
        self.viewState = viewState
        self.output = output
    }
    
    var body: some View {
        Text("Second Test View")
            .font(.title)
            .padding()
        
        VStack(spacing: 10) {
            Button("Show another Second Test Screen") {
                output?.didTapShowSecondTestScreen()
            }
            
            Button("Clear all navigation stack") {
                output?.didTapClearNavigationStack()
            }
        }
    }
}
