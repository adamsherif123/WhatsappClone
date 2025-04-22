//
//  Extentions.swift
//  WhatsappClone
//
//  Created by Adam Sherif on 3/18/25.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
