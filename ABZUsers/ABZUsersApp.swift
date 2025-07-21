//
//  ABZUsersApp.swift
//  ABZUsers
//
//  Created by apple on 11.06.2025.
//

import SwiftUI

@main
struct ABZUsersApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
//            LaunchView()
            NavigationShellView()
                .environmentObject(networkMonitor)
        }
    }
}
