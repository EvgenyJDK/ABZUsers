//
//  ApiResponse.swift
//  ABZUsers
//
//  Created by apple on 29.06.2025.
//

import Foundation

struct ApiResponse: Codable {

    var success: Bool
    var message: String
    
    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decode(Bool.self, forKey: .success)
        message = try values.decode(String.self, forKey: .message)
    }
    

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(success, forKey: .success)
        try container.encode(message, forKey: .message)
    }
}
