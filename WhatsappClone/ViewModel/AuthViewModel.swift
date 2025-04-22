//
//  AuthViewModel.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        self.userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password:  password) { result, error in
            if let error = error {
                print("Failed to login user with error: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
                    
        }
    }
    
    func register(withEmail email: String, password: String, username: String, fullName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempCurrrentUser = user
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullName": fullName]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        ImageUploader.uploadImage(image: image) { url in
            guard let uid = self.tempCurrrentUser?.uid else { return }
            Firestore.firestore().collection("users")
                .document(uid).updateData(
                    ["profileImageUrl" : url]) { _ in
                        print("DEBUG: Upload photo....")
                        self.userSession = self.tempCurrrentUser
                    }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            print("DEBUG: User object is \(user)")
        }
    }
}
