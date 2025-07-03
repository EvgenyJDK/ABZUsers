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
    
    private func getToken() async throws {
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/token") else {
            throw HttpError.badURL
        }
        
        token = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let token {

                let keychain = KeychainSwift()
                keychain.delete("api_token")
                keychain.set(token.value, forKey: "api_token")
                
                isLoading = false
            }
        }
    }
    
    private func getToken_post() async throws {
        
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/token") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            // Optional: Check HTTP status
            if let httpResponse = response as? HTTPURLResponse {
                print("Status token code:", httpResponse.statusCode)
            }

            // Decode response
            if let token = try? JSONDecoder().decode(Token.self, from: data) {
                print("Response received:", token)
                let keychain = KeychainSwift()
//                keychain.delete("api_token")
                keychain.set(token.value, forKey: "api_token")
            } else {
                print("Failed to decode response")
            }

        } catch {
            print("Request failed:", error)
        }
    }

//    user photo should be jpg/jpeg image, with resolution at least 70x70px and size must not exceed 5MB.
}

struct Token: Codable/*, Identifiable*/ {
//    var id: ObjectIdentifier
//    var success: Bool
    var value: String
    
    private enum CodingKeys: String, CodingKey {
//        case success = "success"
        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        value = try values.decode(Bool.self, forKey: .success)
        value = try values.decode(String.self, forKey: .token)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(value, forKey: .success)
        try container.encode(value, forKey: .token)
    }
}
