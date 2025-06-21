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
        
        VStack() {
            VStack {
                HeaderView(title: "Working with POST request")
            }
            
            // Form Fields
            VStack(spacing: 30) {
                // First Name Field
                VStack(alignment: .leading, spacing: 8) {
                    
                    TextField("Your name", text: $signupViewModel.name)
                        .padding(.horizontal)
                        .frame(height: 56)
                        .cornerRadius(8)
                    
                        .autocapitalization(.words)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(signupViewModel.nameError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
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
                        .padding(.horizontal)
                        .frame(height: 56)
                        .cornerRadius(8)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(signupViewModel.emailError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
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
                        .padding(.horizontal)
                        .frame(height: 56)
                        .cornerRadius(8)
                        .keyboardType(.phonePad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(signupViewModel.phoneError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
                        )
                    
                    if !signupViewModel.phoneError.isEmpty {
                        Text(signupViewModel.phoneError)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                HStack() {
                    
                    TextField("Upload your photo", text: $signupViewModel.photoUrl)
                        .padding(.horizontal)
                        .frame(height: 56)
                    
                    Button(action: {
                       print("==implement uploading photo==")
                    }, label: {
                        Text("Upload")
                            .fontWeight(.semibold)
                            .foregroundColor(.cyan) // deprecated
                            .padding(.trailing, 16)
                    })
                }
                
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(signupViewModel.phoneError.isEmpty ? Color.gray : Color.red, lineWidth: 1))
                
                
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 30)
            
        }
//        .padding(.top, 30)
        .hideNavigationBar()

    }
}

#Preview {
    SignUpView()
}
