//
//  TabBarElementBuilder.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

struct TabBarElementBuilder {
    private func itemForTabBarElement(type: TabBarElementType) -> AnyView {
        switch type {
        case .mainScreenRoot:
            return Label("Main", systemImage: "house").eraseToAnyView()
            
        case .settingsScreenRoot:
            return Label("Settings", systemImage: "gear").eraseToAnyView()
        }
    }
}

extension TabBarElementBuilder: TabBarElementBuilding {
    func buildTabBarElement(view: AnyView, type: TabBarElementType) -> TabBarElement {
        TabBarElement(
            type: type,
            view: view,
            item: itemForTabBarElement(type: type)
        )
    }
}
