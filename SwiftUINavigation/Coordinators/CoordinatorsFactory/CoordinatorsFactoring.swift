//
//  CoordinatorsFactoring.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

typealias RootCoordinatorModule<T> = (view: AnyView, input: T)
typealias ConcreteCoordinator<T> = (coordinator: Coordinator, input: T)

protocol CoordinatorsFactoring {
    func makeTabBarCoordinator() -> RootCoordinator
    
    func makeMainScreenRootCoordinator(
        output: MainScreenCoordinatorOutput
    ) -> RootCoordinatorModule<MainScreenCoordinatorInput>
    
    func makeSettingsScreenRootCoordinator(
        output: SettingsScreenCoordinatorOutput
    ) -> RootCoordinatorModule<SettingsScreenCoordinatorInput>
    
    func makeFirstTestCoordinator(
        output: FirstTestCoordinatorOutput,
        router: Routable
    ) -> ConcreteCoordinator<FirstTestCoordinatorInput>

    func makeSecondTestCoordinator(
        output: SecondTestCoordinatorOutput,
        router: Routable
    ) -> ConcreteCoordinator<SecondTestCoordinatorInput>
    
    func makeThirdTestCoordinator(
        output: ThirdTestCoordinatorOutput,
        router: Routable
    ) -> ConcreteCoordinator<ThirdTestCoordinatorInput>
}
