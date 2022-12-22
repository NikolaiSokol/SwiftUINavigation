//
//  TabBarInput.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation

protocol TabBarInput: AnyObject {
    func updateTabs(_ tabs: [TabBarElement])
}
