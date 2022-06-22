//
//  NavButton.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 22/06/22.
//

import SwiftUI

struct NavButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                Image(!configuration.isPressed ? "Button-Nav" : "Button-Nav-Pressed")
                    .resizable()
                    .renderingMode(.original)
            )
    }
}

struct NavButton: View {
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
        .buttonStyle(NavButtonStyle())
        .scaleEffect(x: left ? 1.0 : -1.0)
    }
}

struct NavButton_Previews: PreviewProvider {
    static var previews: some View {
        NavButton(
            width: 50, height: 50,
            action: {
                print("Pressed")
            }
        )
    }
}
