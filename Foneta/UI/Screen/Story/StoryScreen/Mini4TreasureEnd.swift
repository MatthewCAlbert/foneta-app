//
//  Mini4TreasureEnd.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 27/06/22.
//

import SwiftUI

struct Mini4TreasureEnd: View {
    var nextScene: AnyView = AnyView(EmptyView())
    let backgroundImage: String = "Screen21-Bg"
    let finishMessage: String = "Selamat Rahmat, kamu berhasil\nmendapatkan harta karun!"
    var finishMessageColor: Color = .white
    let characterImage: String = "Treasure-1"
    var characterVoiceover: SoundAssets? = .screen21MiniEnd
    let buttonText: String = "Buka"
    var buttonVoiceover: SoundAssets? = .open

    @State var nextSceneActive = false
    @State var currentIndex = 0
    @State var flashbangOpacity: Double = 0
    @State var treasureOpacity: [Double] = [0, 0, 0, 0]

    func animateTreasure(index: Int, duration: Double, delay: Double) {
        withAnimation(.easeIn(duration: duration).delay(delay)) {
            treasureOpacity[index] += 1
        }
        withAnimation(.easeIn(duration: duration).delay(duration + delay - 0.5)) {
            treasureOpacity[index] -= 1
        }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Background Area
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()

                // MARK: Content Area
                VStack {
                    switch(currentIndex) {
                    case 0:
                        Text(finishMessage)
                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 32))
                            .bold()
                            .foregroundColor(finishMessageColor)
                            .multilineTextAlignment(.center)
                            .onAppear {
                                if characterVoiceover != nil {
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
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0))

                        HStack {
                            ThemedButton(
                                width: 260, height: 70, fontSize: 32,
                                text: buttonText, voiceover: buttonVoiceover
                            ) {
                                SoundManager.shared.setChannelQueuePlay(nil)
                                currentIndex = 1
                            }
                            .voiced()
                        }
                    default: // Last
                        // First Sequence
                        ZStack {
                            // Locked Chest
                            Image("Treasure-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300, alignment: .center)
                                .opacity(treasureOpacity[0])
                                .onAppear {
                                    animateTreasure(index: 0, duration: 1, delay: 0)
                                }

                            // Unlocked Chest
                            Image("Treasure-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300, alignment: .center)
                                .opacity(treasureOpacity[1])
                                .onAppear {
                                    animateTreasure(index: 1, duration: 1, delay: 2)
                                }

                            // Opened Chest
                            Image("Treasure-Open-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300, alignment: .center)
                                .opacity(treasureOpacity[2])
                                .onAppear {
                                    animateTreasure(index: 2, duration: 1, delay: 4)
                                    withAnimation(.easeIn(duration: 1.0).delay(6)) {
                                        treasureOpacity[3] += 1
                                    }
                                }

                            // Opened Chest Angled + Treasure Map Folded
                            if (treasureOpacity[3] > 0) {
                                Button(action: {
                                    SoundManager.shared.setChannelQueuePlay(nil)

                                    withAnimation(.easeIn(duration: 3.0)) {
                                        flashbangOpacity += 1
                                    }

                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        nextSceneActive = true
                                    }
                                }, label: {
                                    ZStack {
                                        Image("Treasure-4")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 300, height: 300, alignment: .center)
                                        Image("Treasure-Map-Folded")
                                            .resizable()
                                            .scaledToFill()
                                            .shadow(color: .white, radius: 30, x: 0, y: 0)
                                            .frame(width: 280, height: 280, alignment: .center)
                                    }
                                })
                                .opacity(treasureOpacity[3])
                            }

                            if ( flashbangOpacity > 0 ) {
                                Rectangle()
                                    .fill(Color(hex: "FFFEEA").opacity(flashbangOpacity))
                                    .ignoresSafeArea()
                                    .onAppear {
                                    }
                            }

                        }
                        .overlay(
                            NavigationLink(destination: nextScene, isActive: $nextSceneActive) { EmptyView() }
                        )
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

struct Mini4TreasureEnd_Previews: PreviewProvider {
    static var previews: some View {
        Mini4TreasureEnd()
        .previewInterfaceOrientation(.landscapeRight)
    }
}
