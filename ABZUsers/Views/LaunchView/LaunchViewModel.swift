//
//  LaunchViewModel.swift
//  ABZUsers
//
//  Created by apple on 12.06.2025.
//

import Foundation
import SwiftUI
import KeychainSwift

class LaunchViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var isLoading = true
    
    var token: Token?
    
    init() {
        Task {
            try await getToken()
        }
    }
    
    func getToken() async throws {
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/token") else {
            throw HttpError.badURL
        }
        
        token = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let token {

                let keychain = KeychainSwift()
                keychain.set(token.value, forKey: "api_token")
                
                isLoading = false
            }
        }
    }
}

struct Token: Codable/*, Identifiable*/ {
//    var id: ObjectIdentifier
    var value: String
    
    private enum CodingKeys: String, CodingKey {
        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decode(String.self, forKey: .token)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .token)
    }
}
