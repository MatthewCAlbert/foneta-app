//
//  MiniOneStoryView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct MiniOneStoryView: View, MiniStoryView {
    let page: Int
    let nextScreenId: String
    
    var body: some View {
        GeometryReader { geo in
            switch(page) {
                case 1:
                    SceneWithCaptionView(
                        nextScene: AnyView(mainStoryLane[nextScreenId].body), backgroundImage: "Screen2-Bg", captionText: "Rahmat adalah seorang petualang pemberani. Hari ini, Rahmat menjelajahi pantai tersembunyi. Pantainya indah sekali!", captionVoiceover: .screen2, childObject: AnyView(EmptyView())
                    )
                case 2:
                    SceneWithCaptionView(
                        prevScene: getPrevView(),
                        nextScene: AnyView(mainStoryLane[nextScreenId].body), backgroundImage: "Screen3-Bg", captionText: "Di pantai, rahmat disambut oleh Kepi si Kepiting. Kepi sangat senang bertemu Rahmat si petualang pemberani!", captionVoiceover: .screen3, childObject: AnyView(
                            ZStack {
                                Image("Kepi-Happy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.7)
                                DialogBubble(width: geo.size.width * 0.25, height: geo.size.height * 0.25, fontSize: 24, text: "Halo, Rahmat! Aku Kepi.")
                                    .voiceover(.screen3Kepi, delay: 8.0)
                                    .offset(x: geo.size.width * 0.27, y: geo.size.height * -0.3)
                            }
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        )
                    )
                case 3:
                    SceneWithCaptionView(
                        prevScene: getPrevView(),
                        nextScene: AnyView(mainStoryLane[nextScreenId].body), backgroundImage: "Screen4-Bg", captionText: "BYURR!! Ombak besar datang dan membawa Kepi ke dasar laut. Kepi hanyut dan membutuhkan bantuan!",
                        captionVoiceover: .screen4, childObject: AnyView(
                            ZStack {
                                DialogBubble(width: geo.size.width * 0.2, height: geo.size.height * 0.2, fontSize: 24, text: "Tolong Kepi!", flipped: true)
                                    .voiceover(.screen4Kepi, delay: 7.0)
                                    .offset(x: geo.size.width * -0.35, y: geo.size.height * -0.05)
                            }
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        ),
                        cardImage: "Card-1",
                        cardVoiceover: .screen4MiniStart
                    )
                case 4:
                    StoryMiniEndView(
                        nextScene: AnyView(mainStoryLane[nextScreenId].body),
                        backgroundImage: "Screen5-Bg",
                        finishMessage: "Rahmat berhasil menyelamatkan Kepi.\nSelamat Rahmat, kamu hebat!",
                        finishMessageColor: .black,
                        characterImage: "Kepi-Happy",
                        characterVoiceover: .screen5MiniEnd,
                        characterBubbleText: "Terima kasih, Rahmat!",
                        characterBubbleTextVoiceover: .screen5MiniEndKepi,
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

struct MiniOneStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MiniOneStoryView(
            page: 4,
            nextScreenId: "0"
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
