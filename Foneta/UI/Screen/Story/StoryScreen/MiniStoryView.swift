//
//  MiniStoryView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 22/06/22.
//

import SwiftUI

protocol MiniStoryView {
    var page: Int { get }
    var nextScreenId: String { get }
    var voiceoverPlayed: Bool { get }
}

extension MiniStoryView {
    func getPrevView() -> AnyView {
        let prevScreenIndex: Int? = mainStoryLane.prevIndexOf(nextScreenId, offset: 2)
        guard let prevScreenIndex = prevScreenIndex else {
            return AnyView(EmptyView())
        }
        return AnyView(mainStoryLane[prevScreenIndex].body)
    }
}
