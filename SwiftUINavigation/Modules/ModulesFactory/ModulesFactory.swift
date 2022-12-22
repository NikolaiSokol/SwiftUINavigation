//
//  ModulesFactory.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

final class ModulesFactory: ModulesFactoring {
    func makeMainScreen(output: MainScreenOutput) -> MainScreenModule {
        MainScreenConfigurator().configure(output: output)
    }
    
    func makeSettingsScreen(output: SettingsScreenOutput) -> SettingsScreenModule {
        SettingsScreenConfigurator().configure(output: output)
    }
    
    func makeFirstTestModule(output: FirstTestModuleOutput) -> NavigableModule<FirstTestModuleInput> {
        FirstTestModuleConfigurator().configure(output: output)
    }
    
    func makeSecondTestModule(output: SecondTestModuleOutput) -> NavigableModule<SecondTestModuleInput> {
        SecondTestModuleConfigurator().configure(output: output)
    }
    
    func makeThirdTestModule(output: ThirdTestModuleOutput) -> NavigableModule<ThirdTestModuleInput> {
        ThirdTestModuleConfigurator(modulesFactory: self).configure(output: output)
    }
}
