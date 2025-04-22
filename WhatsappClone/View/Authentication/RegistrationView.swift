//
//  RegistrationView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/17/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: ProfilePhotoSelectorView().navigationBarBackButtonHidden(),
                isActive: $viewModel.didAuthenticateUser,
                label: { })
            
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Get started.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                
                VStack(spacing: 32) {
                    CustomTextField(image: "envelope", placeholder: "Email", isSecureField: false, text: $email)
                    
                    CustomTextField(image: "person", placeholder: "Username", isSecureField: false, text: $username)
                    
                    CustomTextField(image: "person", placeholder: "Fullname", isSecureField: false, text: $fullname)
                    
                    CustomTextField(image: "lock", placeholder: "Password", isSecureField: true, text: $password)
                    
                }
                .padding([.top, .horizontal], 32)
            }
            .padding()
            
            Button {
                viewModel.register(withEmail: email, password: password, username: username, fullName: fullname)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray, radius: 10)
            .padding(.top, 32)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign up")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
