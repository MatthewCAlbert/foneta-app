//
//  SceneWithCaptionView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct SceneWithCaptionView: View {
    @ObservedObject var model: SceneWithCaptionViewModel = SceneWithCaptionViewModel()

    var prevScene: AnyView?
    var nextScene: AnyView = AnyView(EmptyView())
    var backgroundImage: String
    var captionText: String
    var captionVoiceover: SoundAssets?
    var childObject: AnyView = AnyView(EmptyView())
    var cardImage: String?
    var cardVoiceover: SoundAssets?

    @Environment(\.dismiss) var dismiss

    @Binding var voiceoverPlayed: Bool

    @State var cardOverlayActive = false
    @State var prevSceneActive = false
    @State var nextSceneActive = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Background Area
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()

                // MARK: Objects Area
                childObject

                // MARK: Caption Area
                HStack {
                    CaptionBox(
                        width: geo.size.width * 0.8, height: model.getCaptionBoxHeight(geo),
                        text: captionText, playVoiceover: false
                    )
                    .multilineTextAlignment(.center)
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)

                // MARK: Navigation Area
                if  prevScene != nil {
                    HStack {
                        NavButton(
                            width: 70, height: 70, left: true
                        ) {
                            SoundManager.shared.setChannelQueuePlay(nil)
                            dismiss()
                        }
                    }
                    .padding(EdgeInsets(top: 0,
                                        leading: geo.size.width * 0.03,
                                        bottom: model.getCaptionBoxHeight(geo) * 0.5 - 25,
                                        trailing: 0))
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .bottomLeading)
                    .overlay(
                        NavigationLink(destination: prevScene!, isActive: $prevSceneActive) { EmptyView() }
                    )
                }

                HStack {
                    NavButton(
                        width: 70, height: 70, left: false
                    ) {
                        if  cardImage == nil {
                            SoundManager.shared.setChannelQueuePlay(nil)
                            nextSceneActive = true
                        } else {
                            SoundManager.shared.setChannelQueuePlay(cardVoiceover)
                            cardOverlayActive = true
                        }
                    }
                }
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom: model.getCaptionBoxHeight(geo) * 0.5 - 25,
                                    trailing: geo.size.width * 0.03))
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottomTrailing)
                .overlay(
                    NavigationLink(destination: nextScene, isActive: $nextSceneActive) { EmptyView() }
                )

                // MARK: Card Area (optional)
                if  cardImage != nil && cardOverlayActive {
                    CardPromptOverlay(width: geo.size.width * 0.3, imageName: cardImage!, voiceover: cardVoiceover) {
                        SoundManager.shared.setChannelQueuePlay(nil)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            nextSceneActive = true
                        }
                    }
                }

                // MARK: Control Area
                HStack(spacing: 20) {
                    MuteButton(width: 70, height: 70)
                    ReplayButton(width: 70, height: 70) {
                        voiceoverPlayed = true
                        SoundManager.shared.setChannelQueuePlay(nil)
                        SoundManager.shared.playerChannel[0]?.stop()
                        voiceoverPlayed = false
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: geo.size.width * 0.03))
                .frame(width: geo.size.width, height: geo.size.height, alignment: .topTrailing)
            }
        }
    }
}

struct SceneWithCaptionView_Previews: PreviewProvider {
    static var previews: some View {
        SceneWithCaptionView(
            backgroundImage: "Screen1-Bg",
            // swiftlint:disable:next line_length
            captionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mollis quam nisi, sed sodales ante imperdiet ut. Fusce posuere aliquet viverra. Proin non aliquet ipsum. Fusce non condimentum mi, vel ullamcorper tellus. Aliquam leo ex, vehicula tincidunt semper ac, ullamcorper mollis nisl. Donec commodo dictum nisi, vestibulum dictum libero sodales ut. Maecenas libero velit, ornare nec libero varius, suscipit vehicula urna. Sed eleifend leo ac sapien laoreet, id malesuada ex malesuada. Morbi id gravida mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
            voiceoverPlayed: .constant(false)
        )
            .previewInterfaceOrientation(.landscapeRight)
    }
}
