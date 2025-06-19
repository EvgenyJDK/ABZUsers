//
//  ToolbarView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import Foundation
import SwiftUI






//struct ToolbarView: View {
////    @StateObject private var coordinator = NavigationCoordinator()
////    @EnvironmentObject var coordinator: NavigationCoordinator
//    @StateObject private var coordinator = NavigationCoordinator()
//
//        init() {
//            print("ToolbarView initialized")
//        }
//    
//    var body: some View {
//        NavigationStack(path: $coordinator.path) {
//            Text("Home Screen")
//                .toolbar() {
//                    ToolbarItemGroup(placement: .bottomBar) {
//                        Button("Go A") {
//                            coordinator.path.append(Destination.screenA)
//                        }
//                        
//                        Spacer()
//                        
//                        Button("Go B") {
//                            coordinator.path.append(Destination.screenB)
//                        }
//                        
//                    }
//
//                }
////                .navigationDestination(for: Destination.self) { destination in
////                    switch destination {
////                    case .screenA:
////                        UsersView()
////                    case .screenB:
////                        SignUpView()
////                    }
////                }
//        }
//    }
//}




/*
struct ToolbarView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Text("Home Screen")
                .toolbar() {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Go A") {
                            path.append(Destination.screenA)
                        }
                        
                        Spacer()
                        
                        Button("Go B") {
                            path.append(Destination.screenB)
                        }
                        
                    }

                }
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .screenA:
                        UsersView()
                    case .screenB:
                        SignUpView()
                    }
                }
        }
    }
}
*/



//struct ToolbarView: View {
//    
//    var body: some View {
//        HStack {
//            NavigationView {
//                Text("Hello, SwiftUI!")
//                    .navigationTitle("Toolbar Example")
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            Button("Left") {
//                                print("Left button tapped")
//                            }
//                        }
//                        
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Button("Right") {
//                                print("Right button tapped")
//                            }
//                        }
//                    }
//            }
//        }
//    }
//}




//struct ToolbarView: View {
//
//    let usersAction: () -> Void
//    let signUpAction: () -> Void
//    
//    var body: some View {
//        HStack {
//            Button(action: usersAction, label: {
//                HStack(spacing: 7) {
//                    Image("users")
//                        .resizable()
//                        .frame(width: 36, height: 17)
//                        .scaledToFit()
//                        .clipped()
//                        .padding(.leading, 25)
//                    Text("Users")
//                        .fontWeight(.semibold)
//                        .foregroundColor(.cyan) // deprecated
//                }
//            }).buttonStyle(ColoredButtonStyle())
//            
//            Spacer()
//            
//            Button(action: signUpAction,
////                    {
////                NavigationLink(destination: UsersEmptyView(),
////                               tag: "UsersEmptyView",
////                               selection: $viewModel.nextScreen,
////                               label: {
////                    EmptyView()
////                })
////            },
//                   label: {
//                HStack(spacing: 7) {
//                    Image("signUp")
//                        .resizable()
//                        .frame(width: 22, height: 20)
//                        .scaledToFit()
//                        .clipped()
//                    Text("Sign up")
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black) // deprecated
//                        .padding(.trailing, 25)
//                }
//            }).buttonStyle(ColoredButtonStyle())
//        }
//        .background(Color.gray.opacity(0.3))
//        .frame(width: UIScreen.main.bounds.width, height: 0, alignment: .leading)
//        .padding(.top)
//    }
//}
