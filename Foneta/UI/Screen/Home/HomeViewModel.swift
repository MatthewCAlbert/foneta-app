//
//  HomeViewModel.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 08/06/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @State var opacity: CGFloat = 1.0
    let skipNameAsk: Bool
    let lastLevelId: String

    func fadeOut() {
        withAnimation(.easeInOut(duration: 1.0)) {
            opacity -= 1.0
        }
    }

    init() {
        if  UserData.shared.lastLevel != nil && UserData.shared.lastLevel != "" {
            lastLevelId = UserData.shared.lastLevel!
        } else {
            lastLevelId = mainStoryLane[0].id
        }
        if  UserData.shared.name != nil && UserData.shared.name != "" {
            skipNameAsk = true
        } else {
            skipNameAsk = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.fadeOut()
        }
    }
}
