//
//  ButtonView.swift
//  ABZUsers
//
//  Created by apple on 30.06.2025.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .fontWeight(.semibold)
                .frame(width: 140.0, height: 48.0, alignment: .center)
                .foregroundColor(.black)
                .padding(.top, 0)
        }
        .frame(width: 140, height: 48, alignment: .center)
        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.yellow))
    }
}

#Preview {
    ButtonView(title: "Got it")
}
