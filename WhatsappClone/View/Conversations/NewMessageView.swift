//
//  NewMessageView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = NewMessageViewModel()
    
    @Binding var user: User?
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            VStack {
                ForEach(viewModel.users) { user in
                    Button {
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell(user: user)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}
