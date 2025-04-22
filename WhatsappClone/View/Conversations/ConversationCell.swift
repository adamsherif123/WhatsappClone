//
//  UserCell.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("Car")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Adam Sherif")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is a test message for now")
                        .font(.system(size: 15))
                }
                Spacer()
            }
            .padding(.horizontal)

            
            Divider()
        }
        .padding(.top)
    }
}

#Preview {
    ConversationCell()
}
