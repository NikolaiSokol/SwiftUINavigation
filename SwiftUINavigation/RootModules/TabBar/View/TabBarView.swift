//
//  TabBarView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject private var viewState: TabBarViewState
    private let output: TabBarViewOutput
    
    init(
        viewState: TabBarViewState,
        output: TabBarViewOutput
    ) {
        self.viewState = viewState
        self.output = output
    }
    
    var body: some View {
        TabView(selection: $viewState.selectedTab) {
            ForEach(viewState.tabs) { element in
                element.view
                    .tabItem {
                        element.item
                    }
                    .tag(element.type)
            }
        }
    }
}
