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
}
