//
//  UsersView.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import SwiftUI

struct UsersView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = UsersViewModel()
    
    @State private var showEmptyView = false
    @State private var showNoConnectionView = false
    @State private var fetchTrigger = UUID()

    var body: some View {
        VStack() {
            VStack {
                Group {
                    
                    VStack {
                        HeaderView(title: "Working with GET request")
                    }
                    
                    ScrollView {
                        if showEmptyView {
                            emptyView
                            
                        } else {
                            LazyVStack {
                                ForEach(viewModel.items) { item in
                                    UserCardView(user: item)
                                }
                                
                                if viewModel.hasMorePages {
                                    ProgressView()
                                        .padding()
                                        .background(Color.red)
                                        .onAppear {
                                            Task {
                                                let _ = try await viewModel.fetchUsers { bool in
                                                    showEmptyView = bool
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
//                .refreshable {
//                    Task {
//                        try await viewModel.loadInitialItems()
//                    }
//                }
            }.hideNavigationBar()
        }
        
        .fullScreenCover(isPresented: $showNoConnectionView) {
            NoConnectionView(networkMonitor: networkMonitor)
        }
        .onChange(of: networkMonitor.isConnected) { newValue in
            showNoConnectionView = !newValue
            if newValue {
                fetchTrigger = UUID() // Restart fetch when reconnected
            }
        }
        .onAppear {
            self.showNoConnectionView = !networkMonitor.isConnected
        }
        .task(id: fetchTrigger) {
            guard networkMonitor.isConnected else { return }
            let _ = try? await viewModel.loadInitialItems()
        }
    }
    
    var emptyView: some View {
        
        ZStack {
            Color.clear.frame(height: 600) // placeholder for scrollable space
            
            VStack {
                Spacer()
                Image("noUsers")
                    .resizable()
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                    .scaledToFit()
                    .clipped()
                Text("There are no users yet")
                    .font(.title)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 20.0)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    UsersView()
}
