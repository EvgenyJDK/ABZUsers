//
//  UsersEmptyView.swift
//  ABZUsers
//
//  Created by apple on 14.06.2025.
//

import SwiftUI

struct UsersEmptyView: View {
    
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {}, label: {
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
                })
                .padding(.top)
//                .frame(width: UIScreen.main.bounds.width, height: 56, alignment: .topLeading)
//                .background(.yellow)
                    
                Text("")
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: 201, height: 113)
                Image("noUsers")
                    .resizable()
                    .frame(width: 201, height: 200, alignment: .center)
                    .scaledToFit()
                    .clipped()
                Text("There are no users yet")
//                    .font(FontScheme...)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, height: 28, alignment: .center)
                    .padding(.top, getRelativeHeight(23))
                Text("")
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width:UIScreen.main.bounds.width, height: 109)
                Spacer()
                
                HStack {
                    Image("users")
                        .resizable()
                        .frame(width: 36, height: 17)
                        .scaledToFit()
                        .clipped()
                        .padding(.bottom, 4)
                    Text("Users")
                        .fontWeight(.semibold)
                        .foregroundColor(.cyan) // deprecated
                        .padding(.bottom, 4)
                    Image("signUp")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .scaledToFit()
                        .clipped()
                        .padding(.bottom, 4)
                        .padding(.leading, 90)
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .foregroundColor(.black) // deprecated
                        .padding(.bottom, 4)
                        .padding(.leading, 9)
                }

            }
        }
        
        
    }
}

#Preview {
    UsersEmptyView()
}
