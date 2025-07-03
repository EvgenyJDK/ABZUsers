//
//  UsersView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject private var viewModel: UsersViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: UsersViewModel())
    }
    
    var body: some View {
        VStack {
            Group {

                VStack {
                    HeaderView(title: "Working with GET request")
                }
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.items) { item in
                            UserCardView(user: item)
                        }
                        
                        if viewModel.hasMorePages {
                            ProgressView()
                                .padding()
                                .onAppear {
                                    Task {
                                        try await viewModel.fetchUsers()
                                    }
                                }
                        }
                    }
                }
            }
            .refreshable {
                Task {
                    try await viewModel.loadInitialItems()
                }
            }
            
        }.hideNavigationBar()
    }
}



#Preview {
    UsersView()
}
