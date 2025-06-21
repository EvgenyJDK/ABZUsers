//
//  SignupViewModel.swift
//  ABZUsers
//
//  Created by apple on 20.06.2025.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var position = Position.front
//    @Published var name = ""
//    @Published var email = ""
//    @Published var name = ""
//    @Published var email = ""
    
    // Validation states for highlighting
    @Published var nameError: String = ""
    @Published var emailError: String = ""
    @Published var phoneError: String = ""
    @Published var positionError: String = ""
}

enum Position: String {
    case front = "Frontend Developer"
    case back = "Backend Developer"
    case designer = "Designer"
    case qa = "QA"
}
