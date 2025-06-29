//
//  SignUpSuccessView.swift
//  ABZUsers
//
//  Created by apple on 29.06.2025.
//

import SwiftUI

struct SignUpSuccessView: View {
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
                    Image("success")
                        .resizable()
                        .frame(width: 200.0, height: 200.0, alignment: .center)
                        .scaledToFit()
                        .clipped()
                    Text("User successfully registered")
                        .font(.title)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: 276.0, height: 28.0, alignment: .topLeading)
                        .padding(.top, 20.0)
                    
                    Button {
                        dismiss()
                    } label: {
                        ButtonView(title: "Got it")
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SignUpSuccessView(message: "User successfully registered")
}
