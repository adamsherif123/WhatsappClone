//
//  LoginView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/17/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.blue)
                    
                    VStack(spacing: 40) {
                        CustomTextField(image: "envelope", placeholder: "Email", isSecureField: false, text: $email)
                        
                        CustomTextField(image: "lock", placeholder: "Password", isSecureField: true, text: $password)
                        
                    }
                    .padding([.top, .horizontal], 32)
                }
                .padding()
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset Password")
                    } label: {
                        Text("Forgot password?")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 20)
                    }
                }
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
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
}

#Preview {
    LoginView()
}

 
