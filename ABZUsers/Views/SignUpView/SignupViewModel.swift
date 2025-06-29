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
//    @Published var position = Position.front
//    @Published var positionEntity = positions?.positionsList.first
//    @Published var positionName = positions.positionsList.first?.name
    @Published var photoUrl = ""
    @Published var isFormValid: Bool = false
    @Published var image: Data?
    
    // Validation states for highlighting
    @Published var nameError: String = ""
    @Published var emailError: String = ""
    @Published var phoneError: String = ""
    @Published var positionError: String = ""
    @Published var photoUrlError: String = ""
    
    @Published var isLoading = true
    @Published var navigate = false
    
    var positions: Positions?
    
    @Published var selectedPosition: Position?
    
     var positionEntity: Position {
         return positions?.positionsList.first ?? Position()
    }
     var positionName: String {
         return positions?.positionsList.first?.name ?? ""
    }
    
    @Published var response: ApiResponse? = nil
    
    init() {
        Task {
            try await fetchPositions()
        }
        
//        try? await Task { fetchPositions() }
        
        
//        isLoading = true
//
//                // Simulated async API call
//                try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
//
//                // After task completes
//                isLoading = false
//                navigate = true
        
    }
    
    func fetchPositions() async throws {
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/positions") else {
            throw HttpError.badURL
        }
        
        positions = try await HttpClient.shared.fetch(url: url)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        DispatchQueue.main.async { [self] in
            if let positions {
                dump(positions)
                
                selectedPosition = positions.positionsList.first
                isLoading = false
            }
        }
    }
    
    // MARK: - Public Methods
    
    func submitForm() {
        validateAllFields()
        guard isFormValid else { return }
        
        // send the data to a service
        print("Name: \(name)")
        print("Email: \(email)")
        print("Phone: \(phone)")
        print("Selected Position: \(positionEntity.name)")
        
        Task {
//            try await registerUser()
        }
        
        
        Task {
            try await sendPostRequestAsync()
        }
        
        // Clear form after submission
        //        clearForm()
    }
    
    func validateAllFields() {
//        guard let _ = validateName(name), validateEmail(email), validatePhone(phone) else {
        _ = validateName(name)
        _ = validateEmail(email)
        _ = validatePhone(phone)
//        _ = validatePhone(photoUrl)
        //        _ = validateOption(selectedOption)
//                if validateName(name) && validateEmail(email) &&
                    isFormValid = validateName(name) && validateEmail(email) && validatePhone(phone)
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
    
//    struct PostData: Codable {
//        let title: String
//        let body: String
//        let userId: Int
//    }
    
    
//    var id: Int
//    var name: String
//    var email: String
//    var phone: String
//    var position: String
//    var photo: String
    
    private func sendPostRequestAsync() async throws {
        
//        let keychain = KeychainSwift()
//        let token = keychain.get("api_token") ?? ""
        
//        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/users/\(token)") else {
//            print("Invalid URL")
//            return
//        }
        
        guard let url = URL(string: "https://frontend-test-assignment-api.abz.agency/api/v1/users") else {
            print("Invalid URL")
            return
        }

//        let postData = PostData(title: "Hello (async)", body: "This is the body (async)", userId: 1)
//        let postData = try User(from: <#T##any Decoder#>)

        let postData = User1(from: self)
        guard let jsonData = try? JSONEncoder().encode(postData) else {
            print("Failed to encode data")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        
        let keychain = KeychainSwift()
//        let token = keychain.get("api_token") ?? ""
//        print("--token--\(token)---")
        let token = "eyJpdiI6IktTNVwvN1hSTVBVTlVSZEcybjZmdEp3PT0iLCJ2YWx1ZSI6IkxiZXNMRmg2aHBqektGQ1ZEdCtFNEVSdmN2T1JDZW41VjBBRStiUnJFdElZTHRJeVVzdlwvM1VaZElPd3B4UWM1S3JmY3E0Y3M5bTF6RTZrVEpaRHk4QT09IiwibWFjIjoiM2JkNWU2ZTZiY2FmZGU3NGIwZDE5NDVlMjM5OGE5ODY1OWM5NWU3ZGI2MzhhMThmMmVjMjZhY2YxY2NlNjljZCJ9"
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            // Optional: Check HTTP status
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code:", httpResponse.statusCode)
            }

            // Decode response
            if let responsePost = try? JSONDecoder().decode(ApiResponse.self, from: data) {
                print("Response received:", responsePost)
                DispatchQueue.main.async {
                    self.response = responsePost
                    self.navigate = true
                }
            } else {
                print("Failed to decode response")
            }
        } catch {
            print("Request failed:", error)
        }
    }

//    user photo should be jpg/jpeg image, with resolution at least 70x70px and size must not exceed 5MB.
}


struct Positions: Codable {
    
    let positionsList: [Position]
    
    private enum CodingKeys: String, CodingKey {
        case positions = "positions"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        positionsList = try values.decode([Position].self, forKey: .positions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(positionsList, forKey: .positions)
    }
}


struct Position: Codable, Identifiable, Equatable {
    var id: Int
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
    }
    
    init()  {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = Int.max
        name = "None"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
