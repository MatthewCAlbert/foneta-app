//
//  CaptionBox.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct CaptionBox: View {
    let width: CGFloat
    let height: CGFloat
    let text: String
    var playVoiceover: Bool = true
    
    var body: some View {
        VStack(alignment: .center) {
            Text(text)
                .font(Font.custom(AppFont.openDyslexic.rawValue, size: 24))
        }
        .frame(width: width, height: height, alignment: .center)
        .padding(EdgeInsets(top: 20, leading: 80, bottom: 20, trailing: 80))
        .cornerRadius(20)
        .background(Color.white.opacity(0.83))
        .onAppear {
            
        }
    }
    
    func voiceover(_ soundName: SoundAssets?, delay: Double = 0) -> some View {
        guard let soundName = soundName else {
            return self.id(UUID())
        }

        if (playVoiceover) {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                SoundManager.shared.playSound(soundName)
            }
        }
        return self.id(UUID())
    }
}

struct CaptionBox_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen1-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                CaptionBox(
                    width: 500, height: 200, text: "Hello World"
                )
            }
        }
        .ignoresSafeArea()
    }
}
