//
//  UsersView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UsersView: View {
    
    @EnvironmentObject private var viewModel: UsersViewModel
    
    var body: some View {
        VStack {
            VStack {
                HeaderView(title: "Working with GET request")
            }
            
            ScrollView {
                cards
            }
            
            ToolbarView {
                print("Users")
            } signUpAction: {
                print("SignUp")
            }
            
        }.hideNavigationBar()
    }

    var cards: some View {
//        List {
//            ForEach(viewModel.users?.usersList ?? []) {
//                UserCardView(name: $0.name, position: $0.position, email: $0.email, phone: $0.phone)
////                    .onAppear{
//////                        if $0 == viewModel.users?.usersList.last{
////                            loadMoreData()
//////                        }
////                    }
//            }
//        }
        return ForEach(viewModel.users?.usersList ?? []) {
            UserCardView(name: $0.name, position: $0.position, email: $0.email, phone: $0.phone)
                .onAppear {
//                    if $0 == viewModel.users?.usersList.last{
                        loadMoreData()
//                    }
                }
        }
    }
    
    private func loadMoreData() {
        print("===loadMoreData====")
//        guard !isLoading else { return }
//        isLoading = true
//        
//        // Simulate a network delay
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            let moreItems = items.count+1...items.count+20
//            items.append(contentsOf: moreItems)
//            isLoading = false
//        }
    }
}



#Preview {
    UsersView()
}
