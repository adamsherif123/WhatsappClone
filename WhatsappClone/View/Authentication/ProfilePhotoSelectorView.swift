//
//  ProfilePhotoSelectorView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            Button {
                imagePickerPresented.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "photo.on.rectangle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .foregroundStyle(.green)
                }
                
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
            
            Text(profileImage == nil ? "Select a profile photo" : "Great, tap below to continue!")
                .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                Button {
                    viewModel.uploadProfileImage(image)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                        
                }
            }
            
            Spacer()
        }
        .padding(.top, 24)
        .navigationBarBackButtonHidden()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
        
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
