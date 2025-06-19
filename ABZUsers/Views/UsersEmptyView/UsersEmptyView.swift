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
//            VStack {
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
                    }).buttonStyle(DynamicButtonStyle(isActive: true))
                    
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
                    }).buttonStyle(DynamicButtonStyle(isActive: true))
                }
                .background(Color.gray.opacity(0.3))
                .frame(width: UIScreen.main.bounds.width, height: 0, alignment: .leading)
                .padding(.top)
            }
//        }
    }
}

struct DynamicButtonStyle: ButtonStyle {
    var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
//            .background(configuration.isPressed ? Color.gray.opacity(0.7) : Color.gray.opacity(0.0))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .tint(isActive ? .cyan : .black)
    }
    
//    func makeBody(configuration: Configuration) -> some View {
//            configuration.label
//                .padding()
//                .background(isActive ? Color.blue : Color.gray)
//                .foregroundColor(.white)
//                .opacity(configuration.isPressed ? 0.6 : 1.0)
//                .cornerRadius(8)
//        }
}



#Preview {
    UsersEmptyView()
}
