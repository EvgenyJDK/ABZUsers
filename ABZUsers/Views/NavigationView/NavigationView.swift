//
//  NavigationView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

struct NavigationShellView: View {
    @State private var selectedScreen: Screen = .users
//    @State private var isUsersTapped = true

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
//                        isUsersTapped.toggle()
                        selectedScreen = .users
                    }, label: {
                        ButtonView(image: "users", text: "Users", location: .left, isActive: selectedScreen == .users)
//                        HStack(spacing: 7) {
//                            Image("users")
//                                .resizable()
//                                .frame(width: 36, height: 17)
//                                .scaledToFit()
//                                .clipped()
//                                .padding(.leading, 25)
//                            Text("Users")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.cyan) // deprecated
//                        }
                    }).buttonStyle(DynamicButtonStyle(isActive: selectedScreen == .users))

                    Spacer()

                    Button(action: { selectedScreen = .signUp },
                           label: {
                        ButtonView(image: "signUp", text: "Sign up", location: .right, isActive: selectedScreen == .signUp)
                        
//                        HStack(spacing: 7) {
//                            Image("signUp")
//                                .resizable()
//                                .frame(width: 22, height: 20)
//                                .scaledToFit()
//                                .clipped()
//                            Text("Sign up")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.black) // deprecated
//                                .padding(.trailing, 25)
//                        }
                    }).buttonStyle(DynamicButtonStyle(isActive: selectedScreen == .signUp))
                }
            }
            .navigationTitle(selectedScreen == .users ? "First Screen" : "Second Screen")
        }
    }
}

enum ToolbarButtonLocation {
    case left
    case right
}

struct ButtonView: View {
//    @State private var
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

enum Screen {
    case users, signUp
}
