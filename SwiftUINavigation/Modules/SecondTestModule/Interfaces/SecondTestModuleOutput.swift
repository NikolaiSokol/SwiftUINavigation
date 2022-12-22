//
//  SecondTestModuleOutput.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

protocol SecondTestModuleOutput: AnyObject {
    func secondTestModuleDidRequest(event: SecondTestModuleEvent)
}
