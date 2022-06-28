//
//  MiniFourStoryView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 21/06/22.
//

import SwiftUI

struct MiniFourStoryView: View, MiniStoryView {
    let page: Int
    let nextScreenId: String

    @State var voiceoverPlayed: Bool = false

    var body: some View {
        GeometryReader { geo in
            switch page {
            case 1:
                SceneWithCaptionView(
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen16-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Setelah minum air kelapa, Neta membawa \(userName) menuju harta tersembunyi di pulau sebagai rasa terima kasih. \(userName) sangat senang!",
                    captionVoiceover: .screen16,
                    childObject: AnyView(
                        ZStack {
                            Image("Neta-Wink")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.3)
                                .offset(x: geo.size.width * -0.2, y: geo.size.height * 0.01)
                            DialogBubble(width: geo.size.width * 0.3,
                                         height: geo.size.height * 0.3,
                                         fontSize: 22,
                                         text: "Tada!! Di dalam Gua ini terdapat harta karun!",
                                         playVoiceover: !voiceoverPlayed)
                                .voiceover(.screen16Neta,
                                           delay: 8.6)
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
                    backgroundImage: "Screen17-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Neta dan \(userName) memasuki Gua untuk mencari harta yang tersembunyi. Terdapat sebuah batu besar ditengah Gua. \(userName) tidak sabar untuk melihat dibalik batu!",
                    captionVoiceover: .screen17,
                    childObject: AnyView(
                        ZStack {
                            Image("Neta-BackView")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.5)
                                .offset(x: geo.size.width * -0.1, y: geo.size.height * 0.2)
                        }
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    ),
                    voiceoverPlayed: $voiceoverPlayed
                )
            case 3:
                SceneWithCaptionView(
                    prevScene: getPrevView(),
                    nextScene: AnyView(mainStoryLane[nextScreenId].body),
                    backgroundImage: "Screen18-Bg",
                    // swiftlint:disable:next line_length
                    captionText: "Wah!! Dibalik batu besar itu, terdapat harta karun! \(userName) dan Neta tidak sabar untuk melihat! Tetapi, harta tersebut terhalangi daun-daun dan rerumputan liar.",
                    captionVoiceover: .screen18,
                    childObject: AnyView(
                        ZStack {
                        }
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    ),
                    cardImage: "Card-4",
                    cardVoiceover: .screen19MiniStart,
                    voiceoverPlayed: $voiceoverPlayed
                )
            case 4:
                MiniFourTreasureEnd(
                    nextScene: AnyView(mainStoryLane[nextScreenId].body)
                )
            default:
                EmptyView()
            }
        }
    }
}

struct MiniFourStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MiniFourStoryView(
            page: 4,
            nextScreenId: "0"
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
