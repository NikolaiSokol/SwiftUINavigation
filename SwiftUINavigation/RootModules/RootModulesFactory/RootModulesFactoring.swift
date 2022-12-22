//
//  RootModulesFactoring.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

typealias RootModule<T> = (view: AnyView, input: T)

protocol RootModulesFactoring {
    func makeTabBar(output: TabBarOutput) -> RootModule<TabBarInput>
    
    func makeMainScreenRoot(
        output: MainScreenRootOutput,
        router: Router
    ) -> RootModule<MainScreenRootInput>
    
    func makeSettingsScreenRoot(
        output: SettingsScreenRootOutput,
        router: Router
    ) -> RootModule<SettingsScreenRootInput>
}
