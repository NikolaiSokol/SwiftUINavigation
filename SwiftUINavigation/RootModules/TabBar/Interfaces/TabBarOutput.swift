//
//  TabBarOutput.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

protocol TabBarOutput: AnyObject {
    func didTapSelectedTab(_ tab: TabBarElementType)
}
