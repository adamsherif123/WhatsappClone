//
//  MessageView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                Spacer()
                Text(viewModel.message.text)
                    .padding(12)
                    .background(Color(.blue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundStyle(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
                
            } else {
                if let imageUrl = viewModel.message.user?.profileImageUrl {
                    HStack(alignment: .bottom) {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                        
                        Text(viewModel.message.text)
                            .padding(12)
                            .background(Color(.systemGray5))
                            .font(.system(size: 15))
                            .clipShape(ChatBubble(isFromCurrentUser: false))
                            .foregroundStyle(.black)
                    }
                    .padding(.horizontal)
                    .padding(.trailing, 80)
                    
                    Spacer()
                }
            }
        }
    }
}


