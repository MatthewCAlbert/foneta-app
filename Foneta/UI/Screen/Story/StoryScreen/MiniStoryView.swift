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

struct MiniStoryCaptionReader: View {
    var playVoiceover: Bool = true

    var body: some View {
        ZStack {}
    }

    func voiceover(_ soundName: SoundAssets?, delay: Double = 0.2) -> some View {
        guard let soundName = soundName else {
            return self.id(UUID())
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            SoundManager.shared.playSound(soundName)
        }
        return self.id(UUID())
    }
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
