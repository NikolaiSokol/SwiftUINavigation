//
//  MainScreenView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject private var viewState: MainScreenViewState
    private let output: MainScreenViewOutput?
    
    init(
        viewState: MainScreenViewState,
        output: MainScreenViewOutput?
    ) {
        self.viewState = viewState
        self.output = output
    }
    
    var body: some View {
        Text("Main Screen")
            .font(.title)
            .padding()
        
        VStack(spacing: 10) {
            Button("Show First Test screen") {
                output?.didTapShowFirstTestScreen()
            }
            
            Button("Show Second Test screen") {
                output?.didTapShowSecondTestScreen()
            }
            
            Button("Show Third Test screen") {
                output?.didTapShowThirdTestScreen()
            }
        }
    }
}
