//
//  SignUpView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

struct SignUpView: View {
    
    init() {
        print("===SignUpView====")
    }
    
    var body: some View {
        
            VStack {
                VStack {
                    HeaderView(title: "Working with POST request")
                }
                
//                ToolbarView()
                
//                ToolbarView {
//                    print("Users")
//                } signUpAction: {
//                    print("SignUp")
//                }

                
            }.hideNavigationBar()
        
        
    }
}

#Preview {
    SignUpView()
}
