//
//  TabBarViewState.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class TabBarViewState: ObservableObject {
    @Published var tabs: [TabBarElement] = []
    @Published var selectedTab = TabBarElementType.mainScreenRoot
}
