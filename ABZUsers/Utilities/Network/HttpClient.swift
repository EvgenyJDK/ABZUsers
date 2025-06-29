//
//  HttpClient.swift
//  ABZUsers
//
//  Created by apple on 16.06.2025.
//

import Foundation

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData
}

class HttpClient {
    private init() {}

    static let shared = HttpClient()
    
    func fetch(url: URL) async throws -> Users {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print(response as Any)
            throw HttpError.badResponse
        }
        
        guard let model = try? JSONDecoder().decode(Users.self, from: data) else {
            throw HttpError.errorDecodingData
        }
        
        return model
    }
    
    func fetch(url: URL) async throws -> Token {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print(response as Any)
            throw HttpError.badResponse
        }
        
        guard let model = try? JSONDecoder().decode(Token.self, from: data) else {
            throw HttpError.errorDecodingData
        }
        
        return model
    }
    
    func fetch(url: URL) async throws -> Positions {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print(response as Any)
            throw HttpError.badResponse
        }
        
        guard let model = try? JSONDecoder().decode(Positions.self, from: data) else {
            throw HttpError.errorDecodingData
        }
        
        return model
    }
    
    //    func fetch<T: Codable>(url: URL) async throws -> T {
    //        let (data, response) = try await URLSession.shared.data(from: url)
    //
    //        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
    //            print(response as Any)
    //            throw HttpError.badResponse
    //        }
    //
    //        guard let data = try? JSONDecoder().decode(T.self, from: data) else {
    //            throw HttpError.errorDecodingData
    //        }
    //
    //        return data
    //    }
    
    func sendPostRequestAsync() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return
        }

        let postData = PostData(title: "Hello (async)", body: "This is the body (async)", userId: 1)

        guard let jsonData = try? JSONEncoder().encode(postData) else {
            print("Failed to encode data")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            // Optional: Check HTTP status
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code:", httpResponse.statusCode)
            }

            // Decode response
            if let responsePost = try? JSONDecoder().decode(PostData.self, from: data) {
                print("Response received:", responsePost)
            } else {
                print("Failed to decode response")
            }
        } catch {
            print("Request failed:", error)
        }
    }

}

struct PostData: Codable {
    let title: String
    let body: String
    let userId: Int
}
