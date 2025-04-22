//
//  User.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/19/25.
//

import FirebaseFirestore

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let email: String
    let profileImageUrl: String
}
