//
//  HeaderView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .fontWeight(.regular)
                .padding(.vertical, 14)
                .foregroundColor(.gray) // deprecated
                .minimumScaleFactor(0.5)
            //                            .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width, height: 56, alignment: .center)
                .background(.yellow)
        }
        .padding(.top)
    }
}
