//
//  NavigationShellView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

enum Screen {
    case users, signUp/*, launch*/
}

struct NavigationShellView: View {
    @State private var showLaunchView = true
    @State private var selectedScreen: Screen = .users
    
    
    var body: some View {
        NavigationView {
            if showLaunchView {
                LaunchView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                showLaunchView = false
                            }
                        }
                    }
            } else {
                
                
                Group {
                    switch selectedScreen {
                        //                case .launch:
                        //                    LaunchView()
                    case .users:
                        UsersView()
                    case .signUp:
                        SignUpView()
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
//                        Color.gray.frame(width: .infinity, height: 600)
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
}


