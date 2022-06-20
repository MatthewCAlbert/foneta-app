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
    var soundName: SoundManager.SoundName? = nil
    var extraItem: some View = EmptyView()
    
    @ObservedObject var tts = TextToSpeech()
    @State private var isFlipped: Bool = false
    
    var body: some View {
        ZStack {
            Image("DialogBubble-Bg")
                .resizable()
                .renderingMode(.original)
                .scaleEffect(CGSize(width: isFlipped ? -1.0 : 1.0, height: 1.0))
            VStack {
                Text(text)
                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: fontSize))
                    .bold()
                    .foregroundColor(.black)
                extraItem
            }
            .frame(width: width * 0.67, height: height * 0.5, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: !isFlipped ? width * 0.067 : 0, bottom: 0, trailing: isFlipped ? width * 0.067 : 0))
        }
        .frame(width: width, height: height, alignment: .center)
    }
    
    func read(_ yes: Bool = true) -> some View {
        tts.speakSomething(text: text, rate: 0.4, volume: 0.3)
        let view = self
        return view.id(UUID())
    }
    
    func voiceover(_ yes: Bool = true) -> some View {
        let view = self
        guard let soundName = soundName else {
            return view.id(UUID())
        }

        SoundManager.shared.playSound(soundName)
        return view.id(UUID())
    }
    
    func flip(_ yes: Bool = true) -> some View {
        var view = self
        view._isFlipped = State(initialValue: yes)
        return view.id(UUID())
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
