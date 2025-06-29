//
//  SignUpFailedView.swift
//  ABZUsers
//
//  Created by apple on 29.06.2025.
//

import SwiftUI

struct SignUpFailedView: View {
    @Environment(\.dismiss) var dismiss
    
    let message: String
    
    var body: some View {

        ZStack {
            Color.white.ignoresSafeArea()

            // Top HStack, pinned to top with padding for safe area
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image("close")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFit()
                            .foregroundColor(.white)
                    }
                    .padding([.top, .trailing], 24)
                }
                .padding()
                .foregroundColor(.white)

                Spacer() // Pushes the VStack below to center vertically
            }

            // Centered VStack
            VStack {
                Spacer()
                VStack {
                    Image("failed")
                        .resizable()
                        .frame(width: 200.0, height: 200.0, alignment: .center)
                        .scaledToFit()
                        .clipped()
                    Text(message)
                        .font(.title)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: 276.0, height: 28.0, alignment: .topLeading)
                        .padding(.top, 20.0)
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack(spacing: 0) {
                            Text("Try again")
                                .fontWeight(.semibold)
//                                .padding(.horizontal, 30.0)
//                                .padding(.vertical, 11.0)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: 140.0, height: 48.0, alignment: .center)
                                .foregroundColor(.black)
                                .padding(.top, 0)
                        }
                    })
                    .frame(width: 140, height: 48, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.yellow))
                    .padding(.top, 20)
                }
                Spacer()
            }
        }
    }
}


#Preview {
    SignUpFailedView(message: "The email is already registered")
}
