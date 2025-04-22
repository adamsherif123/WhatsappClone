//
//  MessageViewModel.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/19/25.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUid: String {
        return AuthViewModel.shared.currentUser?.id ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: String? {
        return message.user?.profileImageUrl
    }
}
