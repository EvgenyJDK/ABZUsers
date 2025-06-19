//
//  SignUpView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        
        
            VStack {
                VStack {
                    HeaderView(title: "Working with POST request")
                }
                
                
                ToolbarView {
                    print("Users")
                } signUpAction: {
                    print("SignUp")
                }

                
            }.hideNavigationBar()
        
        
    }
}

#Preview {
    SignUpView()
}
