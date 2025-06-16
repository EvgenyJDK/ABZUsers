//
//  UsersView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UsersView: View {
    
    @EnvironmentObject private var viewModel: UsersViewModel
    
    var body: some View {
        VStack {
            VStack {
                header
            }
            
            ScrollView {
                cards
            }
            
            toolbar
            
        }.hideNavigationBar()
    }
    
    var header: some View {
        HStack(spacing: 0) {
            Text("Working with GET request")
                .fontWeight(.regular)
                .padding(.vertical, 14)
                .foregroundColor(.gray) // deprecated
                .minimumScaleFactor(0.5)
            //                            .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width, height: 56, alignment: .center)
                .background(.yellow)
        }
        .padding(.top)
    }

    var cards: some View {
        return ForEach(viewModel.users?.usersList ?? []) {
            UserCardView(name: $0.name, position: $0.position, email: $0.email, phone: $0.phone)
        }
    }
    
    var toolbar: some View {
        HStack {
            Button(action: {}, label: {
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
            
            Button(action: {
                
            }, label: {
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


#Preview {
    UsersView()
}
