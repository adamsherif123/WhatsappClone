//
//  ConversationsView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/17/25.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showSheet = false
    @State private var showChatView = false
    @State var selectedUser: User?
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink(
                    destination: ChatsView(user: user),
                    isActive: $showChatView,
                    label: { })
            }
            
            ScrollView {
                VStack {
                    ForEach(0...10, id: \.self) { _ in
                        NavigationLink {
//                            ChatsView(user: MOCK_USER)
                        } label: {
                            ConversationCell()
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            }
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showSheet) {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            }
        }
    }
}

#Preview {
    ConversationsView()
}
