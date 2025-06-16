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
    
    var users: [User] = []
    
}

struct User: Codable {
    var name: String
    var position: String
    var mail: String
    var phone: String
}

