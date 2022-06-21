//
//  ScreenTwoView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct ScreenTwoView: View {
    let page: Int
    let nextScreenId: String
    
    var body: some View {
        if (page == 0) {
            SceneWithCaptionView(
                nextScene: mainStoryLane[nextScreenId].body, backgroundImage: "Screen2-Bg", captionText: "Rahmat adalah seorang petualang pemberani. Hari ini, Rahmat menjelajahi pantai tersembunyi. Pantainya indah sekali!", captionVoiceover: .screen2, childObject: AnyView(GeometryReader { geo in
                        EmptyView()
                })
            )
        } else {
            SceneWithCaptionView(
                nextScene: mainStoryLane[nextScreenId].body, backgroundImage: "Screen3-Bg", captionText: "Di pantai, rahmat disambut oleh Kepi si Kepiting. Kepi sangat senang bertemu Rahmat si petualang pemberani!", captionVoiceover: .screen2, childObject: AnyView(GeometryReader { geo in
                    ZStack {
                        Image("Kepi-Happy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.7)
                        DialogBubble(width: geo.size.width * 0.25, height: geo.size.height * 0.25, fontSize: 24, text: "Halo, Rahmat! Aku Kepi.")
                            .offset(x: geo.size.width * 0.27, y: geo.size.height * -0.3)
                    }
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                })
            )
        }
    }
}

struct ScreenTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwoView(
            page: 2,
            nextScreenId: "0"
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
