//
//  HapticManager.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation
import SwiftUI

class HapticManager {

    static let shared = HapticManager()

    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

}
