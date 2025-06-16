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
            
            ScrollView {
                cards
            }
        }
    }

    var cards: some View {
        return ForEach(viewModel.users?.usersList ?? []) {
            UserCardView(name: $0.name, position: $0.position, email: $0.email, phone: $0.phone)
        }
    }
}


#Preview {
    UsersView()
}
