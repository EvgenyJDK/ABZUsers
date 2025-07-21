//
//  UsersViewModel.swift
//  ABZUsers
//
//  Created by apple on 15.06.2025.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
//    @Published var nextScreen: String? = nil
    @Published var isLoading = false
    @Published var hasMorePages = true
    
    var users: Users?
    @Published var items: [User] = []
    
    private var currentPage = 1
    private let pageSize = 6
    
    @Published var navigate = false
    
    func loadInitialItems() async throws {
        currentPage = 1
        hasMorePages = true
        items = []
        try await fetchUsers { _ in }
    }

    func fetchUsers(completion: @escaping (Bool) -> Void) async throws {
        guard !isLoading && hasMorePages else { return }
        isLoading = true
        defer { isLoading = false } // ensure isLoading is set to false after the async operation.

        let baseURL = "https://frontend-test-assignment-api.abz.agency/api/v1/"
        
        guard let url = URL(string: "\(baseURL)users?page=\(currentPage)&count=\(pageSize)") else {
            throw HttpError.badURL
        }

        try? await Task.sleep(nanoseconds: 500_000_000) // Simulate a network delay to show ProgressView
        
        users = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let users {
                dump(users)
                
                if currentPage == 1 {
                    items = users.usersList
                } else {
                    items.append(contentsOf: users.usersList)
                }
                hasMorePages = users.usersList.count == pageSize
                if hasMorePages { currentPage += 1 }
                completion(items.isEmpty)
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
    var id: Int?
    var name: String
    var email: String
    var phone: String
    var position: String
//    var positionId: Int?
    var photo: String
//    var image: Data?
    
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
    
    init(from model: SignupViewModel) {
        name = model.name
        email = model.email
        phone = model.phone
        position = model.positionEntity.name
//        image = model.image
//        positionId = 1
        photo = model.photoUrl
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

struct User1: Codable {
//    var id: Int?
    var name: String
    var email: String
    var phone: String
//    var position: String
    var positionId: Int?
//    var photo: String?
    var image: Data?
    
    private enum CodingKeys: String, CodingKey {
//        case id = "id"
        case name = "name"
        case email = "email"
        case phone = "phone"
//        case position = "position"
        case photo = "photo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        email = try values.decode(String.self, forKey: .email)
        phone = try values.decode(String.self, forKey: .phone)
//        position = try values.decode(String.self, forKey: .position)
//        photo = try values.decode(String.self, forKey: .photo)
    }
    
    init(from model: SignupViewModel) {
        name = model.name
        email = model.email
        phone = model.phone
        image = model.image
        positionId = model.selectedPosition?.id
//        photo = model.p
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
//        try container.encode(position, forKey: .position)
//        try container.encode(photo, forKey: .photo)
    }
}


