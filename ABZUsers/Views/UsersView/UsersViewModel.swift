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
    
    var users: Users?
    
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
    

struct Users: Codable {

    let usersList: [User]

    private enum CodingKeys: String, CodingKey {
        case users = "users"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        usersList = try values.decode([User].self, forKey: .users)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(usersList, forKey: .users)
    }
}

struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var position: String
    var photo: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case position = "position"
        case photo = "photo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        email = try values.decode(String.self, forKey: .email)
        phone = try values.decode(String.self, forKey: .phone)
        position = try values.decode(String.self, forKey: .position)
        photo = try values.decode(String.self, forKey: .photo)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(position, forKey: .position)
        try container.encode(photo, forKey: .photo)
    }
}
