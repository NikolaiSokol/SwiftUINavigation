//
//  FirstTestModuleView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct FirstTestModuleView: View {
    @ObservedObject private var viewState: FirstTestModuleViewState
    private let output: FirstTestModuleViewOutput?
    
    init(
        viewState: FirstTestModuleViewState,
        output: FirstTestModuleViewOutput?
    ) {
        self.viewState = viewState
        self.output = output
    }
    
    var body: some View {
        Text("First Test View")
            .font(.title)
            .padding()
        
        VStack(spacing: 10) {
            Button("Go Back") {
                output?.didTapGoBack()
            }
            
            Button("Show Third Test Screen") {
                output?.didTapShowThirdTestScreen()
            }
        }
    }
}
