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
                // Name
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
                
                
                // Email
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
                
                // Phone
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
                
                // Radio Button Selector
                VStack(alignment: .leading, spacing: 8) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(Position.allCases, id: \.self) { position in
                            HStack {
                                Button(action: {
                                    signupViewModel.position = position
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: signupViewModel.position == position ? "largecircle.fill.circle" : "circle")
                                            .foregroundColor(signupViewModel.position == position ? .blue : .gray)
                                            .font(.title2)
                                        
                                        Text(position.rawValue)
                                            .foregroundColor(.primary)
                                            .font(.body)
                                        
                                        Spacer()
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(signupViewModel.positionError.isEmpty ? Color.gray.opacity(0.3) : Color.red, lineWidth: 1)
//                            .background(Color.gray.opacity(0.05))
//                    )
                    
                    if !signupViewModel.positionError.isEmpty {
                        Text(signupViewModel.positionError)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            .padding([.horizontal, .top], 20)
            
            Spacer(minLength: 20)
                
                // Upload Photo
            HStack() {
                    
                    TextField("Upload your photo", text: $signupViewModel.photoUrl)
                        .padding(.horizontal)
                        .padding()
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
                .padding([.leading, .trailing], 16)
                
                
            // Signup Button
            
            VStack(spacing: 12) {
                Button(action: {
                    signupViewModel.submitForm()
                }) {
                    HStack {
//                        Image(systemName: "paperplane.fill")
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
//                    .background(signupViewModel.isFormValid ? Color.blue : Color.gray)
                    .background(Color.yellow)
                    .cornerRadius(24)
                }
                .disabled(!signupViewModel.isFormValid)
                .padding(.horizontal, 20)
                .frame(width: 140, height: 48)
                
                // Clear Button
//                Button(action: {
//                    viewModel.clearForm()
//                }) {
//                    Text("Clear Form")
//                        .foregroundColor(.blue)
//                        .fontWeight(.medium)
//                }
//            }
            .padding(.bottom, 30)
            
            
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
