//
//  ModulesFactoring.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

typealias NavigableModule<T> = (view: NavigableView, input: T)

protocol ModulesFactoring {
    func makeMainScreen(output: MainScreenOutput) -> MainScreenModule
    func makeSettingsScreen(output: SettingsScreenOutput) -> SettingsScreenModule
    func makeFirstTestModule(output: FirstTestModuleOutput) -> NavigableModule<FirstTestModuleInput>
    func makeSecondTestModule(output: SecondTestModuleOutput) -> NavigableModule<SecondTestModuleInput>
    func makeThirdTestModule(output: ThirdTestModuleOutput) -> NavigableModule<ThirdTestModuleInput>
}
