//
//  ChatViewModel.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import Firebase
import FirebaseFirestore

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatParterId = user.id else { return }
        
        let query = Firestore.firestore().collection("messages").document(currentUid).collection(chatParterId)
        
        query.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            var messages = documents.compactMap { try? $0.data(as: Message.self) }
            print(self.messages)
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = self.user
            }
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatParterId = user.id else { return }
        
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatParterId).document()
        let chatPartnerRef = Firestore.firestore().collection("messages").document(chatParterId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["toId": chatParterId,
                                   "fromId": currentUid,
                                   "text": messageText,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())
        ]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
    }
    
}
