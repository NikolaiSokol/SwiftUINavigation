//
//  TabBarElement.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

struct TabBarElement: Identifiable {
    var id = UUID()
    let type: TabBarElementType
    let view: AnyView
    let item: AnyView
}
