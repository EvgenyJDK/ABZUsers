//
//  NoConnectionView.swift
//  ABZUsers
//
//  Created by apple on 11.06.2025.
//

import SwiftUI

struct NoConnectionView: View {
    @StateObject private var networkMonitor = NetworkMonitor()
    @State private var showModal = false
    
    var body: some View {
        VStack {
            VStack {
                Image("wifi")
                    .resizable()
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                    .scaledToFit()
                    .clipped()
                Text("There is no internet connection")
                    .font(.title)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: 276.0, height: 28.0, alignment: .topLeading)
                    .padding(.top, 22.0)
                Button(action: {}, label: {
                    HStack(spacing: 0) {
                        Text("Try again")
                            .fontWeight(.semibold)
                            .padding(.horizontal, 30.0)
                            .padding(.vertical, 11.0)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .frame(width: 140.0, height: 48.0, alignment: .center)
                            .foregroundColor(.black)
                            .padding(.top, 0)
                    }
                })
                .frame(width: 140, height: 48, alignment: .center)
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.yellow))
                .padding(.top, 21)
            }
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            
        }
        .sheet(isPresented: $showModal) {
            if networkMonitor.isConnected {
                UsersView()
            }
        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        .hideNavigationBar()
    }
}

#Preview {
    NoConnectionView()
}
