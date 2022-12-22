//
//  ThirdTestModuleView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct ThirdTestModuleView: View {
    @ObservedObject private var viewState: ThirdTestModuleViewState
    private let output: ThirdTestModuleViewOutput?
    
    init(
        viewState: ThirdTestModuleViewState,
        output: ThirdTestModuleViewOutput?
    ) {
        self.viewState = viewState
        self.output = output
    }
    
    var body: some View {
        Text("Third Test View")
            .font(.title)
            .padding()
        
        VStack(spacing: 10) {
            Button("Go Back") {
                output?.didTapGoBack()
            }
            
            Button("Clear all navigation stack") {
                output?.didTapClearNavigationStack()
            }
            
            Spacer().frame(height: 30)
            
            if let model = viewState.mainScreenModel {
                MainScreenView(
                    viewState: model.viewState,
                    output: model.viewOutput
                )
            } else {
                Button("Setup Main Screen Subview") {
                    output?.didTapSetupMainScreenSubview()
                }
            }
        }
    }
}
