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
    @Published var photoUrl = ""
    @Published var isFormValid: Bool = false
    
    // Validation states for highlighting
    @Published var nameError: String = ""
    @Published var emailError: String = ""
    @Published var phoneError: String = ""
    @Published var positionError: String = ""
    @Published var photoUrlError: String = ""
    
    
    // MARK: - Public Methods
    
    func validateAllFields() {

    }
    
    func submitForm() {
        validateAllFields()
        guard isFormValid else { return }
        
        // send the data to a service
        print("Name: \(name)")
        print("Email: \(email)")
        print("Phone: \(phone)")
        print("Selected Position: \(position.self.rawValue)")
        
        // Clear form after submission
//        clearForm()
    }
}

enum Position: String, CaseIterable, Identifiable {
    case front = "Frontend Developer"
    case back = "Backend Developer"
    case designer = "Designer"
    case qa = "QA"
    
    var id: String { self.rawValue }  // Conform to Identifiable
}
