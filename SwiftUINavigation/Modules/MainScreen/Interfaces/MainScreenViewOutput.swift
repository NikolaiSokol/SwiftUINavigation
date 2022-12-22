//
//  MainScreenViewOutput.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

protocol MainScreenViewOutput: AnyObject {
    func didTapShowFirstTestScreen()
    func didTapShowSecondTestScreen()
    func didTapShowThirdTestScreen()
}
