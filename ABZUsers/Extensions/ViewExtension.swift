//
//  ViewExtension.swift
//  ABZUsers
//
//  Created by apple on 14.06.2025.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationTitle("")
            .toolbar(.hidden)
            .navigationViewStyle(StackNavigationViewStyle()) // will be deprecated
    }
    
    @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
        if visibility != .gone {
            if visibility == .visible {
                self
            } else {
                hidden()
            }
        }
    }
}

enum ViewVisibility: CaseIterable {
    case visible,
         invisible,
         gone
}
