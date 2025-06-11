//
//  LaunchView.swift
//  ABZUsers
//
//  Created by apple on 11.06.2025.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 160.0, height: 106.0, alignment: .center)
                        .scaledToFit()
                        .clipped()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .background(.yellow)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

#Preview {
    LaunchView()
}

func getRelativeWidth (_ size: CGFloat) -> CGFloat {
    return size * (CGFloat(UIScreen.main.bounds.width) / 360.0)
}

func getRelativeHeight (_ size: CGFloat) -> CGFloat {
    return (size * (CGFloat(UIScreen.main.bounds.width) / 760.0)) * 0.97
}

