//
//  MiniTwoStoryView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 21/06/22.
//

import SwiftUI

struct MiniTwoStoryView: View,
                         MiniStoryView {
    let page: Int
    let nextScreenId: String

    @State var voiceoverPlayed: Bool = false

    var body: some View {
        GeometryReader { geo in
            switch page {
            case 1:
                SceneWithCaptionView(
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen6-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "\(userName) si petualang pemberani berpamitan dengan Kepi dan melanjutkan petualangannya. Hari mulai siang dan terasa panas.",
                    captionVoiceover: .screen6,
                    childObject: AnyView(
                        ZStack {
                            Image("Hand-3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.8)
                                .offset(y: geo.size.height * 0.2)
                        }
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    ),
                    voiceoverPlayed: $voiceoverPlayed
                )
            case 2:
                SceneWithCaptionView(
                    prevScene: getPrevView(),
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen7-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Dari kejauhan, \(userName) mendengar suara meminta pertolongan. Suara itu berasal dari timbunan pasir, ada yang membutuhkan bantuan!",
                    captionVoiceover: .screen7,
                    childObject: AnyView(
                        ZStack {
                            Image("Hand-3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.8)
                                .offset(y: geo.size.height * 0.2)
                            DialogBubble(width: geo.size.width * 0.3,
                                         height: geo.size.height * 0.3,
                                         fontSize: 22,
                                         text: "Aku Neta,aku tertimbun pasir, tolong!",
                                         playVoiceover: !voiceoverPlayed)
                                .voiceover(.screen7Neta,
                                           delay: 8.5)
                        }
                        .frame(width: geo.size.width,
                               height: geo.size.height,
                               alignment: .center)
                    ),
                    cardImage: "Card-2",
                    cardVoiceover: .screen7MiniStart,
                    voiceoverPlayed: $voiceoverPlayed
                )
            case 3:
                StoryMiniEndView(
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen9-Bg",
                    finishMessage: "\(userName) berhasil menyelamatkan Neta.\nSelamat \(userName), kamu hebat!",
                    finishMessageColor: .black,
                    characterImage: "Neta-MouthOpened",
                    characterVoiceover: .screen9MiniEnd,
                    characterBubbleText: "Terima kasih, \(userName)!",
                    characterBubbleTextVoiceover: .screen9MiniEndNeta,
                    characterBubbleTextVoiceoverDelay: 4.5,
                    buttonText: "Selanjutnya",
                    buttonVoiceover: .next
                )
            default:
                EmptyView()
            }
        }
    }
}

struct MiniTwoStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MiniTwoStoryView(
            page: 3,
            nextScreenId: "0"
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
