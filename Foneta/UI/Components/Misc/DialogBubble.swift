//
//  DialogBubble.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct DialogBubble: View {
    let width: CGFloat
    let height: CGFloat
    let fontSize: CGFloat
    let text: String
    var flipped: Bool = false
    var extraItem: some View = EmptyView()
    
    @ObservedObject var tts = TextToSpeech()
    
    var body: some View {
        ZStack {
            Image("DialogBubble-Bg")
                .resizable()
                .renderingMode(.original)
                .scaleEffect(CGSize(width: flipped ? -1.0 : 1.0, height: 1.0))
            VStack {
                Text(text)
                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: fontSize))
                    .bold()
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                extraItem
            }
            .frame(width: width * 0.67, height: height * 0.5, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: !flipped ? width * 0.067 : 0, bottom: 0, trailing: flipped ? width * 0.067 : 0))
        }
        .frame(width: width, height: height, alignment: .center)
    }
    
    func read(_ yes: Bool = true) -> some View {
        tts.speakSomething(text: text, rate: 0.4, volume: 0.3)
        return self.id(UUID())
    }
    
    func voiceover(_ soundName: SoundAssets, delay: Double = 0) -> some View {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            SoundManager.shared.setChannelQueuePlay(soundName)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay + 0.2) {
            if (SoundManager.shared.playerChannelPlaying[0] == soundName) {
                SoundManager.shared.playSound(soundName)
            }
        }
        return self.id(UUID())
    }
}

struct DialogBubble_Previews: PreviewProvider {
    static var previews: some View {
        DialogBubble(
            width: 300, height: 200, fontSize: 24,
            text: "Halo Budi, sampai jumpa!"
        )
    }
}
