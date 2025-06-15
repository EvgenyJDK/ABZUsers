//
//  UsersView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UsersView: View {
    
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
//                cards
                UserCardView()
                UserCardView()
            }
        }
    }
    
    var cards: some View {
        UserCardView()

    }
    
    
}


#Preview {
    UsersView()
}
