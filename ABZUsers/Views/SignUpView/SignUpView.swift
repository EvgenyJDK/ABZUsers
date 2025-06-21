//
//  SignUpView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var signupViewModel = SignupViewModel()
    
    init() {
        print("===SignUpView====")
    }
    
    var body: some View {
        
        VStack {
            VStack {
                HeaderView(title: "Working with POST request")
            }
            
            // Form Fields
            VStack(spacing: 16) {
                // First Name Field
                VStack(alignment: .leading, spacing: 8) {
                    
                    TextField("Your name", text: $signupViewModel.name)
//                        .padding()
//                        .frame(height: 56)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.words)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(signupViewModel.nameError.isEmpty ? Color.clear : Color.red, lineWidth: 1)
                        )
                    
                    if !signupViewModel.nameError.isEmpty {
                        Text(signupViewModel.nameError)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                
                // Email Field
                VStack(alignment: .leading, spacing: 8) {
                    
                    TextField("Email", text: $signupViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(signupViewModel.emailError.isEmpty ? Color.clear : Color.red, lineWidth: 1)
                        )
                    
                    if !signupViewModel.emailError.isEmpty {
                        Text(signupViewModel.emailError)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                // Phone Number Field
                VStack(alignment: .leading, spacing: 8) {
                    
                    TextField("Phone", text: $signupViewModel.phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.phonePad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(signupViewModel.phoneError.isEmpty ? Color.clear : Color.red, lineWidth: 1)
                        )
                    
                    if !signupViewModel.phoneError.isEmpty {
                        Text(signupViewModel.phoneError)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
        }.hideNavigationBar()

    }
}

#Preview {
    SignUpView()
}
