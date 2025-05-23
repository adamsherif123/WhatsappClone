//
//  SettingsViewModel.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/17/25.
//

import SwiftUI

enum SettingsCellViewModel: Int, CaseIterable {
    case account
    case notifications
    case starredMessages
    
    var title: String {
        switch self {
        case .account:
            return "Account"
        case .notifications:
            return "Notifications"
        case .starredMessages:
            return "Starred Messages"
        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .notifications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .account: return .blue
        case .notifications: return .red
        case .starredMessages: return .yellow
        }
    }
    
}
