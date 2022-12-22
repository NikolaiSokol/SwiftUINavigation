//
//  Routable.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

protocol Routable {
    func present(_ view: NavigableView)
    func popToRoot()
    func pop()
}
