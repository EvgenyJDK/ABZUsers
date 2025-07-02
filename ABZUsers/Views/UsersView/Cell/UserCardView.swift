//
//  UserCardView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UserCardView: View {
    let user: User

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            AsyncImage(url: URL(string: user.photo)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(user.name)
                    .fontWeight(.regular)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(user.position)
                Text(user.email)
                Text(user.phone)
            }
            .padding(.trailing, 16)
        }
        .padding([.top, .bottom, .leading], 16)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        //        .background(.yellow)
    }
}

//#Preview {
//    UserCardView()
//}
