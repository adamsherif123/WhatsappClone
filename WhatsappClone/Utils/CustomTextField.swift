//
//  CustomTextField.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/17/25.
//

import SwiftUI

struct CustomTextField: View {
    
    let image: String
    let placeholder: String
    let isSecureField: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color(.darkGray))
                if isSecureField {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

