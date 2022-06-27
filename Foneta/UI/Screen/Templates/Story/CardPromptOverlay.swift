//
//  CardPromptOverlay.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

protocol CardPromptOverlayInterface {
    var width: CGFloat {get}
    var imageName: String {get}
}

struct CardOverlayProps: CardPromptOverlayInterface {
    let width: CGFloat
    let imageName: String
}

struct CardPromptOverlay: View, CardPromptOverlayInterface {
    let width: CGFloat
    let imageName: String
    var voiceover: SoundAssets?
    var nextAction: () -> Void = {}

    @State var overlayOpacity: CGFloat = 0
    @State var cardOpacity: CGFloat = 0
    @State var cardScale: CGFloat = 0

    var body: some View {
        GeometryReader { _ in
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .opacity(overlayOpacity)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.4)) {
                            overlayOpacity += 1.0
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            if voiceover != nil && SoundManager.shared.playerChannelPlaying[0] == voiceover {
                                SoundManager.shared.playSound(voiceover!)
                            }
                        }
                    }
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width * 1.5, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        .opacity(cardOpacity)
                        .scaleEffect(cardScale)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.4)) {
                                cardOpacity += 1.0
                                cardScale += 1.0
                            }
                        }
                    ThemedButton(width: width, height: width * 0.25, fontSize: 24, text: "Siap!", voiceover: .ready) {
                        nextAction()
                    }
                    .voiced()
                    .opacity(cardOpacity)
                    .scaleEffect(cardScale)
                }
            }
        }
    }
}

struct CardPromptOverlay_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen1-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                CardPromptOverlay(width: 200, imageName: "Card-1") {
                    print("Pressed Next")
                }
            }
        }
        .ignoresSafeArea()
    }
}
