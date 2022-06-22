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
    
    var body: some View {
        GeometryReader { geo in
            switch(page) {
                case 1:
                    SceneWithCaptionView(
                        nextScene: AnyView(mainStoryLane[nextScreenId].body), backgroundImage: "Screen16-Bg", captionText: "Setelah minum air kelapa, Neta membawa Rahmat menuju harta tersembunyi di pulau sebagai rasa terima kasih. Rahmat sangat senang!", captionVoiceover: .screen16, childObject: AnyView(
                            ZStack {
                                Image("Neta-Wink")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.3)
                                    .offset(x: geo.size.width * -0.2, y: geo.size.height * 0.01)
                                DialogBubble(width: geo.size.width * 0.3, height: geo.size.height * 0.3, fontSize: 22, text: "Tada!! Di dalam Gua ini terdapat harta karun!")
                                    .voiceover(.screen16Neta, delay: 8.6)
                                    .offset(y: geo.size.height * -0.2)
                            }
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        )
                    )
                case 2:
                    SceneWithCaptionView(
                        prevScene: getPrevView(),
                        nextScene: AnyView(mainStoryLane[nextScreenId].body), backgroundImage: "Screen17-Bg", captionText: "Neta dan Rahmat memasuki Gua untuk mencari harta yang tersembunyi. Terdapat sebuah batu besar ditengah Gua. Rahmat tidak sabar untuk melihat dibalik batu!", captionVoiceover: .screen17, childObject: AnyView(
                            ZStack {
                                Image("Neta-BackView")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.5)
                                    .offset(x: geo.size.width * -0.1, y: geo.size.height * 0.2)
                            }
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        )
                    )
                case 3:
                    SceneWithCaptionView(
                        prevScene: getPrevView(),
                        nextScene: AnyView(mainStoryLane[nextScreenId].body), backgroundImage: "Screen18-Bg", captionText: "Wah!! Dibalik batu besar itu, terdapat harta karun! Rahmat dan Neta tidak sabar untuk melihat! Tetapi, harta tersebut terhalangi daun-daun dan rerumputan liar.", captionVoiceover: .screen18, childObject: AnyView(
                            ZStack {
                            }
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        ),
                        cardImage: "Card-4",
                        cardVoiceover: .screen19MiniStart
                    )
                case 4:
                    StoryMiniEndView(
                        nextScene: AnyView(mainStoryLane[nextScreenId].body),
                        backgroundImage: "Screen21-Bg",
                        finishMessage: "Selamat Rahmat, kamu berhasil\nmendapatkan harta karun!",
                        finishMessageColor: .white,
                        characterImage: "Treasure-1",
                        characterVoiceover: .screen21MiniEnd,
                        characterBubbleText: nil,
                        characterBubbleTextVoiceover: nil,
                        buttonText: "Buka",
                        buttonVoiceover: .open
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
