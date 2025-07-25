//
//  SignUpView.swift
//  ABZUsers
//
//  Created by apple on 19.06.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject var signupViewModel = SignupViewModel()
    
    @State private var showNoConnectionView = false
    
    @State private var showPhotoPicker = false
    @State private var showActionSheet = false
    @State private var selectedImage: UIImage? = nil
    @State private var imageData: Data? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var pickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    
    init() {
        _signupViewModel = StateObject(wrappedValue: SignupViewModel())
    }

    var body: some View {
        
        VStack() {
            VStack {
                HeaderView(title: "Working with POST request")
            }
            ScrollView {
                VStack(spacing: 30) {
                    name
                    email
                    phone
                    radioButton
                }
                .padding([.horizontal, .top], 20)
                
                Spacer(minLength: 20)
                
                uploadPhoto

                .sheet(isPresented: $showPhotoPicker) {
                    PhotoPicker(sourceType: pickerSourceType) { image in
                        processImage(image)
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .padding([.leading, .trailing], 16)
                
                
                // Signup Button
                VStack(spacing: 12) {
                    Button {
                        signupViewModel.submitForm()
                    } label: {
                        ButtonView(title: "Sign up")
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
            }
            
            .hideNavigationBar()
        }
        .fullScreenCover(isPresented: $showNoConnectionView) {
            NoConnectionView(networkMonitor: networkMonitor)
        }
        .onAppear {
            self.showNoConnectionView = !networkMonitor.isConnected
        }
        
        // Use the ViewModel's state to control presentation
        .sheet(isPresented: $signupViewModel.navigate) {
            if let response = signupViewModel.response {
                if response.success {
                    SignUpSuccessView(message: response.message)
                } else {
                    SignUpFailedView(message: response.message)
                }
            } else {
                SignUpFailedView(message: "message.description")
            }
        }
    }
    
    var name : some View {
        return VStack(spacing: 30) {
            // Name
            VStack(alignment: .leading, spacing: 8) {
                
                TextField("Your name", text: $signupViewModel.name)
                    .padding(.horizontal)
                    .frame(height: 56)
                    .cornerRadius(8)
                
                    .autocapitalization(.words)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(signupViewModel.nameError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
                    )
                
                if !signupViewModel.nameError.isEmpty {
                    Text(signupViewModel.nameError)
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
        }
    }
    
    var email: some View {
        return VStack(alignment: .leading, spacing: 8) {
            
            TextField("Email", text: $signupViewModel.email)
                .padding(.horizontal)
                .frame(height: 56)
                .cornerRadius(8)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(signupViewModel.emailError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
                )
            
            if !signupViewModel.emailError.isEmpty {
                Text(signupViewModel.emailError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
    
    var phone: some View {
        return VStack(alignment: .leading, spacing: 8) {
            
            TextField("Phone", text: $signupViewModel.phone)
                .padding(.horizontal)
                .frame(height: 56)
                .cornerRadius(8)
                .keyboardType(.phonePad)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(signupViewModel.phoneError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
                )
            
            if !signupViewModel.phoneError.isEmpty {
                Text(signupViewModel.phoneError)
                    .font(.caption)
                    .foregroundColor(.red)
            } else {
                Text("+38 (XXX) XXX - XX - XX")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
    var radioButton: some View {
        return VStack(alignment: .leading, spacing: 8) {
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(signupViewModel.positions?.positionsList ?? []) { position in
                    
                    HStack {
                        Button(action: {
                            signupViewModel.selectedPosition = position
                        }) {
                            HStack(spacing: 12) {
                                Image(signupViewModel.selectedPosition == position ? "radioSelected" : "radioUnselected")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(signupViewModel.selectedPosition == position ? .blue : .gray)
                                    .font(.title2)
                                Text(position.name)
                                    .foregroundColor(.primary)
                                    .font(.body)
                                
                                Spacer()
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            //                    .background(
            //                        RoundedRectangle(cornerRadius: 8)
            //                            .stroke(signupViewModel.positionError.isEmpty ? Color.gray.opacity(0.3) : Color.red, lineWidth: 1)
            //                            .background(Color.gray.opacity(0.05))
            //                    )
            
            if !signupViewModel.positionError.isEmpty {
                Text(signupViewModel.positionError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
    
    var uploadPhoto: some View {
        return VStack(alignment: .leading, spacing: 8) {
            HStack {
                Group {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.leading)
                    } else {
                        TextField("Upload your photo", text: $signupViewModel.photoUrl)
                            .frame(height: 56)
                            .padding(.horizontal)
                    }
                }
                .frame(height: 56) // Make both variants match in height
                
                Spacer()
                
                Button("Upload") {
                    showActionSheet = true
                }
                .padding(.trailing, 16)
                .fontWeight(.semibold)
                .foregroundColor(.cyan) // deprecated
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("Choose how you want to add photo"), buttons: [
                        .default(Text("Camera")) {
                            pickerSourceType = .camera
                            showPhotoPicker = true
                        },
                        .default(Text("Gallery")) {
                            pickerSourceType = .photoLibrary
                            showPhotoPicker = true
                        },
                        .cancel()
                    ])
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(signupViewModel.photoError.isEmpty ? Color.gray : Color.red, lineWidth: 1)
            )
            
            if !signupViewModel.photoError.isEmpty {
                Text(signupViewModel.photoError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
    
    // Minimum size of photo 70x70px. The photo format must be jpeg/jpg type. The photo size must not be greater than 5 Mb.
    func processImage(_ image: UIImage) {
        // Ensure minimum size 70x70
        let minSize: CGFloat = 70
        var resizedImage = image
        if image.size.width < minSize || image.size.height < minSize {
            let scale = max(minSize / image.size.width, minSize / image.size.height)
            let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            image.draw(in: CGRect(origin: .zero, size: newSize))
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
                resizedImage = newImage
            }
            UIGraphicsEndImageContext()
        }
        // Convert to JPEG
        guard let jpegData = resizedImage.jpegData(compressionQuality: 0.9) else {
            alertMessage = "Failed to convert image to JPEG."
            showAlert = true
            return
        }
        // Check size <= 5MB
        if jpegData.count > 5 * 1024 * 1024 {
            alertMessage = "Image is larger than 5MB after processing."
            showAlert = true
            return
        }
        selectedImage = resizedImage
        imageData = jpegData
        // Ready to upload: imageData
        signupViewModel.image = imageData
    }
}

#Preview {
    SignUpView()
}
