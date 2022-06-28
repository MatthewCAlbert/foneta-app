//
//  MiniGameCountdown.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 29/06/22.
//

import SwiftUI

struct MiniGameCountdown: View {
    @State private var countDown: Int = 3
    @State private var countDownFinished = false

    let finishCallback: () -> Void
    var content: AnyView

    func startCountdown() {
        SoundManager.shared.playSound(SoundAssets.tiga)
        Timer
            .scheduledTimer(withTimeInterval: 1.1, repeats: true) { (timer) in
                countDown -= 1
                if (countDown == -1) {
                    countDownFinished = true
                    finishCallback()
                    timer.invalidate()
                } else {
                    if (countDown == 2) {
                        SoundManager.shared.playSound(SoundAssets.dua)
                    } else if (countDown == 1) {
                        SoundManager.shared.playSound(SoundAssets.satu)
                    } else {
                        SoundManager.shared.playSound(SoundAssets.mulai)
                    }
                }
            }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                if (!countDownFinished) {
                    Text(countDown > 0 ? "\( countDown)" : "Mulai")
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 150))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .onAppear {
                            startCountdown()
                        }
                } else {
                    content
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}
