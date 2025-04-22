//
//  Message.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import Firebase
import FirebaseFirestore

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
