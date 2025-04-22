//
//  StatusSelectorViewModel.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import Foundation
import SwiftUI

class StatusViewModel: ObservableObject {
    @Published var status: UserStatus = .notConfigured
    
    func updateStatus(_ status: UserStatus) {
        self.status = status
    }
}

enum UserStatus: Int, CaseIterable {
    case notConfigured
    case available
    case busy
    case school
    case movies
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        switch self {
        case .notConfigured: return "Not Configured"
        case .available: return "Available"
        case .busy:
            return "Busy"
        case .school:
            return "School"
        case .movies:
            return "Movies"
        case .batteryLow:
            return "Battery Low"
        case .meeting:
            return "Meeting"
        case .gym:
            return "Gym"
        case .sleeping:
            return "Sleeping"
        case .urgentCallsOnly:
            return "Urgent Calls Only"
        }
    }
}
