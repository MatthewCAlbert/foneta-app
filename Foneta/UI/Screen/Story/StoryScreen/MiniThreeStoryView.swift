//
//  MiniThreeStoryView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 21/06/22.
//

import SwiftUI

struct MiniThreeStoryView: View, MiniStoryView {
    let page: Int
    let nextScreenId: String

    @State var voiceoverPlayed: Bool = false

    var body: some View {
        GeometryReader { geo in
            switch page {
            case 1:
                SceneWithCaptionView(
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen10-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Neta sangat senang keluar dari timbunan pasir. Neta memutuskan untuk ikut berpetualang bersama \(userName) si petualang pemberani!",
                    captionVoiceover: .screen10,
                    childObject: AnyView(
                        ZStack {
                            Image("Neta-MouthOpened")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.3)
                                .offset(x: geo.size.width * -0.2, y: geo.size.height * 0.01)
                            Image("Hand-3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.8)
                                .offset(y: geo.size.height * 0.2)
                            DialogBubble(width: geo.size.width * 0.3,
                                         height: geo.size.height * 0.3,
                                         fontSize: 22,
                                         text: "Terima kasih sudah membantu Neta!",
                                         playVoiceover: !voiceoverPlayed)
                                .voiceover(.screen10Neta, delay: 8.2)
                                .offset(y: geo.size.height * -0.2)
                        }
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    ),
                    voiceoverPlayed: $voiceoverPlayed
                )
            case 2:
                SceneWithCaptionView(
                    prevScene: getPrevView(),
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen11-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Tak terasa hari semakin panas. Teriknya sinar matahari membuat \(userName) dan Neta merasa haus. ",
                    captionVoiceover: .screen11,
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
            case 3:
                SceneWithCaptionView(
                    prevScene: getPrevView(),
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen12-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Ah! Neta menemukan buah kelapa diatas pohon. Buah kelapa berisikan air yang sangat segar. \(userName) perlu memanjat pohon untuk mendapatkan buah kelapa! ",
                    captionVoiceover: .screen12,
                    childObject: AnyView(
                        ZStack {
                            Image("Neta-Side-2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.3)
                                .offset(x: geo.size.width * -0.2, y: geo.size.height * 0.01)
                        }
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    ),
                    cardImage: "Card-3",
                    cardVoiceover: .screen13MiniStart,
                    voiceoverPlayed: $voiceoverPlayed
                )
            case 4:
                StoryMiniEndView(
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen15-Bg",
                    finishMessage: "\(userName) berhasil memanjat pohon kelapa.\nSelamat \(userName), kamu hebat!",
                    finishMessageColor: .black,
                    characterImage: "Neta-MouthOpened",
                    characterVoiceover: .screen15MiniEnd,
                    characterBubbleText: "Segar sekali, terima kasih \(userName)!",
                    characterBubbleTextVoiceover: .screen15MiniEndNeta,
                    characterBubbleTextVoiceoverDelay: 5.1,
                    buttonText: "Selanjutnya",
                    buttonVoiceover: .next
                )
            default:
                EmptyView()
            }
        }
    }
}

struct MiniThreeStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MiniThreeStoryView(
            page: 4,
            nextScreenId: "0"
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
