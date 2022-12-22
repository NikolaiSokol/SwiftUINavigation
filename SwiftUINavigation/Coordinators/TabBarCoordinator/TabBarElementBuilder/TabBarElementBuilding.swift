//
//  TabBarElementBuilding.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

protocol TabBarElementBuilding {
    func buildTabBarElement(view: AnyView, type: TabBarElementType) -> TabBarElement
}
