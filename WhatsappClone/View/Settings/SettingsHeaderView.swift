//
//  SettingsHeaderView.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/17/25.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullName)
                        .font(.system(size: 18))
                        .foregroundStyle(.black)
                    
                    Text("Available")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    
                }
                Spacer()
            }
            .frame(height: 80)
            .background(.white)
            
            
        }
        .padding(.vertical)
    }
}

