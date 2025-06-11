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
                        .scaledToFit()
                        .clipped()
                }
                .background(.yellow)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

#Preview {
    LaunchView()
}

