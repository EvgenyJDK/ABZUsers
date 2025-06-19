//
//  ToolbarView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import Foundation
import SwiftUI

struct ToolbarView: View {

    let usersAction: () -> Void
    let signUpAction: () -> Void
    
    var body: some View {
        HStack {
            Button(action: usersAction, label: {
                HStack(spacing: 7) {
                    Image("users")
                        .resizable()
                        .frame(width: 36, height: 17)
                        .scaledToFit()
                        .clipped()
                        .padding(.leading, 25)
                    Text("Users")
                        .fontWeight(.semibold)
                        .foregroundColor(.cyan) // deprecated
                }
            }).buttonStyle(ColoredButtonStyle())
            
            Spacer()
            
            Button(action: signUpAction,
//                    {
//                NavigationLink(destination: UsersEmptyView(),
//                               tag: "UsersEmptyView",
//                               selection: $viewModel.nextScreen,
//                               label: {
//                    EmptyView()
//                })
//            },
                   label: {
                HStack(spacing: 7) {
                    Image("signUp")
                        .resizable()
                        .frame(width: 22, height: 20)
                        .scaledToFit()
                        .clipped()
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .foregroundColor(.black) // deprecated
                        .padding(.trailing, 25)
                }
            }).buttonStyle(ColoredButtonStyle())
        }
        .background(Color.gray.opacity(0.3))
        .frame(width: UIScreen.main.bounds.width, height: 0, alignment: .leading)
        .padding(.top)
    }
}
