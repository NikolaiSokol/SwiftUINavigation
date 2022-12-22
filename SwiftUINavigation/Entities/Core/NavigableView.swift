//
//  NavigableView.swift
//  SwiftUINavigation
//
//  Created by Nikolai Sokol on 22.12.2022.
//

import Foundation
import SwiftUI

struct NavigableView: Navigable {
    let id = UUID()
    var view: AnyView?
}