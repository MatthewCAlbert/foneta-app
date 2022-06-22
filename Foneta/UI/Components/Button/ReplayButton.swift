//
//  ReplayButton.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 22/06/22.
//

import SwiftUI

struct ReplayButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                Image(!configuration.isPressed ? "Button-Replay" : "Button-Replay-Pressed")
                    .resizable()
                    .renderingMode(.original)
            )
    }
}

struct ReplayButton: View {
    let width: CGFloat
    let height: CGFloat
    var left: Bool = true
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: {
            HapticManager.shared.impact(style: .medium)
            action()
        }, label: {
            ZStack{}
                .frame(width: max(44, width), height: max(44, height), alignment: .center)
        })
        .buttonStyle(ReplayButtonStyle())
    }
}

struct ReplayButton_Previews: PreviewProvider {
    static var previews: some View {
        ReplayButton(
            width: 50, height: 50,
            action: {}
        )
    }
}
