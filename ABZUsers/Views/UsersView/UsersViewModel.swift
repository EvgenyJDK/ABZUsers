//
//  UsersViewModel.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var loading = true
    
    var users: [User]?
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    func fetchUsers() async throws {
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/users?page=2&count=6") else {
            throw HttpError.badURL
        }
        
        users = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let users {
                dump(users)
                

                loading = false
            }
        }
    }
    
}

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var position: String
    var photo: String
}

