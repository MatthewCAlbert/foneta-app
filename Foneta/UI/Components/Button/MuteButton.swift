//
//  MuteButton.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 22/06/22.
//

import SwiftUI

struct MuteButtonStyle: ButtonStyle {
    let active: Bool
    
    init(_ isActive: Bool) {
        active = isActive
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                active ?
                Image(!configuration.isPressed ? "Button-Mute-Active" : "Button-Mute-Active-Pressed")
                    .resizable()
                    .renderingMode(.original)
                :
                Image(!configuration.isPressed ? "Button-Mute" : "Button-Mute-Pressed")
                    .resizable()
                    .renderingMode(.original)
            )
    }
}

struct MuteButton: View {
    let width: CGFloat
    let height: CGFloat
    
    @State var muted = SoundManager.shared.globalMuted
    @State var pressed = true
    
    var body: some View {
        Button(action: {
            HapticManager.shared.impact(style: .medium)
            let newVal = !SoundManager.shared.globalMuted
            SoundManager.shared.globalMuted = newVal
            muted = newVal
        }, label: {
            ZStack{}
                .frame(width: max(44, width), height: max(44, height), alignment: .center)
        })
        .buttonStyle(MuteButtonStyle(muted))
    }
}

struct MuteButton_Previews: PreviewProvider {
    static var previews: some View {
        MuteButton(
            width: 50, height: 50
        )
    }
}
