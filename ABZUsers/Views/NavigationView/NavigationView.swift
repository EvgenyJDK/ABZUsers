//
//  NavigationView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

enum Screen {
    case users, signUp
}

struct NavigationShellView: View {
    @State private var selectedScreen: Screen = .users

    var body: some View {
        NavigationView {
            Group {
                switch selectedScreen {
                case .users:
                    UsersView()
                case .signUp:
                    SignUpView()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    
                    Button(action: {
                        selectedScreen = .users
                    }, label: {
                        ToolbarButtonView(image: "users", text: "Users", location: .left, isActive: selectedScreen == .users)
                    }).buttonStyle(DynamicButtonStyle(isActive: selectedScreen == .users))

                    Spacer()

                    Button(action: { selectedScreen = .signUp },
                           label: {
                        ToolbarButtonView(image: "signUp", text: "Sign up", location: .right, isActive: selectedScreen == .signUp)
                    }).buttonStyle(DynamicButtonStyle(isActive: selectedScreen == .signUp))
                }
            }
            .navigationTitle(selectedScreen == .users ? "First Screen" : "Second Screen")
        }
    }
}


