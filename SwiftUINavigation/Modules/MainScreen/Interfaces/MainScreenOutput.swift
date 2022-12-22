//
//  MainScreenOutput.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

protocol MainScreenOutput: AnyObject {
    func mainScreenDidRequest(event: MainScreenEvent)
}
