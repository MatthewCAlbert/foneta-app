//
//  StoryMiniEndView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 21/06/22.
//

import SwiftUI

struct StoryMiniEndView: View {
    var nextScene: AnyView = AnyView(EmptyView())
    let backgroundImage: String
    let finishMessage: String
    var finishMessageColor: Color = .black
    let characterImage: String
    var characterVoiceover: SoundAssets? = nil
    let characterBubbleText: String?
    var characterBubbleTextVoiceover: SoundAssets? = nil
    var characterBubbleTextVoiceoverDelay: Double = 0
    let buttonText: String
    var buttonVoiceover: SoundAssets? = nil
    
    @State var nextSceneActive = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Background Area
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
                // MARK: Content Area
                VStack {
                    Text(finishMessage)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 32))
                        .bold()
                        .foregroundColor(finishMessageColor)
                        .multilineTextAlignment(.center)
                        .onAppear {
                            if (characterVoiceover != nil) {
                                SoundManager.shared.playSound(characterVoiceover!)
                            }
                        }
                    
                    ZStack {
                        Image("Shine")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300, alignment: .center)
                        Image(characterImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300 * 0.9, height: 300 * 0.9, alignment: .center)
                        if (characterBubbleText != nil) {
                            DialogBubble(width: geo.size.width * 0.25, height: geo.size.height * 0.23, fontSize: 20, text: characterBubbleText!)
                                .voiceover(characterBubbleTextVoiceover, delay: characterBubbleTextVoiceoverDelay)
                                .offset(x: 200, y: -80)
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0))
                    
                    HStack {
                        ThemedButton(
                            width: 260, height: 70, fontSize: 32,
                            text: buttonText, voiceover: buttonVoiceover
                        ) {
                            SoundManager.shared.setChannelQueuePlay(nil)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                nextSceneActive = true
                            }
                        }
                        .voiced()
                    }
                    .overlay(
                        NavigationLink(destination: nextScene, isActive: $nextSceneActive) { EmptyView() }
                    )
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

struct StoryMiniEndView_Previews: PreviewProvider {
    static var previews: some View {
        StoryMiniEndView(
            backgroundImage: "Screen5-Bg",
            finishMessage: "Lorem ipsum",
            finishMessageColor: .black,
            characterImage: "Neta-MouthOpened",
            characterVoiceover: nil,
            characterBubbleText: "Hello World!\nHmmm",
            characterBubbleTextVoiceover: nil,
            characterBubbleTextVoiceoverDelay: 0,
            buttonText: "Selanjutnya",
            buttonVoiceover: .next
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
