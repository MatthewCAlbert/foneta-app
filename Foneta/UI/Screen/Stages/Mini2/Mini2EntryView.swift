//
//  Mini2EntryView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 29/06/22.
//

import SwiftUI

struct Mini2EntryView: View {
    var nextScreenId: String?

    @State var nextSceneActive = false
    @State var stageIndex = 0

    func finishGame() {
        SoundManager.shared.playerChannel[2]?.stop()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            nextSceneActive = true
        }
    }

    var body: some View {
        GeometryReader { _ in
            ZStack {
                switch(stageIndex) {
                case 0:
                    Mini2View1(stageIndex: $stageIndex)
                case 1:
                    Mini2View2(stageIndex: $stageIndex)
                default:
                    Mini2View3(finishGame: finishGame)
                }
                if (nextScreenId != nil ) {
                    HStack {}
                    .overlay(
                        NavigationLink(destination: mainStoryLane[nextScreenId!].body,
                                       isActive: $nextSceneActive) { EmptyView() }
                    )
                }
            }.onAppear {
                SoundManager.shared.playSound(.mini2Bgm, channel: 2, loop: -1)
            }
        }
    }
}

struct Mini2EntryView_Previews: PreviewProvider {
    static var previews: some View {
        Mini2EntryView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
