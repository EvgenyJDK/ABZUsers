//
//  ToolbarButtonView.swift
//  ABZUsers
//
//  Created by apple on 20.06.2025.
//

import SwiftUI

enum ToolbarButtonLocation {
    case left
    case right
}

struct ToolbarButtonView: View {
    let image: String
    let text: String
    let location: ToolbarButtonLocation
    let isActive: Bool

    var body: some View {
        HStack(spacing: 7) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .cyan : .black)
                .scaledToFit()
//                .frame(width: 36, height: 17)
                .frame(width: location == .left ? 36 : 22, height: location == .left ? 17 : 20)

            Text(text)
                .fontWeight(.semibold)
                .foregroundColor(isActive ? .cyan : .black) // deprecated
                .padding(location == .left ? .leading : .trailing, location == .left ? 0 : 25)
        }
    }
}
