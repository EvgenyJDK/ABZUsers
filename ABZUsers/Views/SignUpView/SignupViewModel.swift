//
//  SignupViewModel.swift
//  ABZUsers
//
//  Created by apple on 20.06.2025.
//

import Foundation
import KeychainSwift

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
    
    @Published var isLoading = true
    
    // MARK: - Public Methods
    
    func submitForm() {
        validateAllFields()
        guard isFormValid else { return }
        
        // send the data to a service
        print("Name: \(name)")
        print("Email: \(email)")
        print("Phone: \(phone)")
        print("Selected Position: \(position.self.rawValue)")
        
        Task {
            try await registerUser()
        }
        
        
        // Clear form after submission
        //        clearForm()
    }
    
    func validateAllFields() {
        _ = validateName(name)
        _ = validateEmail(email)
        _ = validatePhone(phone)
//        _ = validatePhone(photoUrl)
        //        _ = validateOption(selectedOption)
    }
    
    
    // MARK: - Validation Methods

    private func validateName(_ firstName: String) -> Bool {
//        user name, should be 2-60 characters
        if name.isEmpty {
            nameError = "Required field"
            return false
        } else if name.count < 2 {
            nameError = "Name must be at least 2 characters"
            return false
        } else if name.count > 60 {
            nameError = "Name must be not more than 60 characters"
            return false
        } else {
            nameError = ""
            return true
        }
    }
    
    private func validateEmail(_ email: String) -> Bool {
        if email.isEmpty {
            emailError = "Required field"
            return false
        } else if !isValidEmail(email) {
            emailError = "Invalid email format"
            return false
        } else {
            emailError = ""
            return true
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
//        user email, must be a valid email according to RFC2822
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func validatePhone(_ phone: String) -> Bool {
//        user phone number, should start with code of Ukraine +380
        if phone.isEmpty {
            phoneError = "Required field"
            return false
        } else if phone.count < 10 {
            phoneError = "Phone number must be at least 10 digits"
            return false
        } else {
            phoneError = ""
            return true
        }
    }
    
    private func registerUser() async throws {
        
        let keychain = KeychainSwift()
        let token = keychain.get("api_token")
        
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/token") else {
            throw HttpError.badURL
        }
        
//        token = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let token {

                
                isLoading = false
            }
        }
    }
    
//    user photo should be jpg/jpeg image, with resolution at least 70x70px and size must not exceed 5MB.
}

enum Position: String, CaseIterable, Identifiable {
    case front = "Frontend Developer"
    case back = "Backend Developer"
    case designer = "Designer"
    case qa = "QA"
    
    var id: String { self.rawValue }  // Conform to Identifiable
}
