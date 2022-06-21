//
//  SceneWithCaptionView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct SceneWithCaptionView: View {
    var nextScene: AnyView = AnyView(EmptyView())
    var backgroundImage: String
    var captionText: String
    var captionVoiceover: SoundAssets? = nil
    var childObject: AnyView = AnyView(EmptyView())
    var cardImage: String? = nil
    var cardVoiceover: SoundAssets? = nil
    
    @State var cardOverlayActive = false
    @State var nextSceneActive = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Background Area
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
                // MARK: Objects Area
                childObject
                
                // MARK: Caption and Navigation Area
                HStack {
                    CaptionBox(
                        width: geo.size.width * 0.8, height: max(geo.size.height * 0.2, 100),
                        text: captionText, soundName: captionVoiceover
                    )
                    .voiceover(!cardOverlayActive, delay: 0.3)
                    .multilineTextAlignment(.center)
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
                
                HStack {
                    ThemedButton(
                        width: 70, height: 70, fontSize: 32,
                        text: ">"
                    ) {
                        if ( cardImage == nil ) {
                            SoundManager.shared.setChannelQueuePlay(nil)
                            nextSceneActive = true
                        } else {
                            SoundManager.shared.setChannelQueuePlay(cardVoiceover)
                            cardOverlayActive = true
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 40))
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottomTrailing)
                .overlay(
                    NavigationLink(destination: nextScene, isActive: $nextSceneActive) { EmptyView() }
                )
                
                // MARK: Card Area (optional)
                if ( cardImage != nil && cardOverlayActive ) {
                    CardPromptOverlay(width: geo.size.width * 0.3, imageName: cardImage!, voiceover: cardVoiceover) {
                        SoundManager.shared.setChannelQueuePlay(nil)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            nextSceneActive = true
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SceneWithCaptionView_Previews: PreviewProvider {
    static var previews: some View {
        SceneWithCaptionView(
            backgroundImage: "Screen1-Bg", captionText: "Hello World"
        )
            .previewInterfaceOrientation(.landscapeRight)
    }
}
