//
//  UserCardView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UserCardView: View {
    
    let name: String
    let position: String
    let email: String
    let phone: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image("photo")
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                VStack(alignment: .leading, spacing: 0) {
                    Text(name)
                        .fontWeight(.regular)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text(position)
                    Text(email)
                    Text(phone)
                }
                .padding(.trailing, 16)
        } 
        .padding([.top, .bottom, .leading], 16)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//        .background(.yellow)
    }
}
//
//#Preview {
//    UserCardView()
//}
