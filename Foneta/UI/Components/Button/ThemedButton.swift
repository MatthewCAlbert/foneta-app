//
//  ThemedButton.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import SwiftUI

struct ThemedButtonButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.gray : Color.blue)
            .background(
                Image(!configuration.isPressed ? "Button-1" : "Button-1-Pressed")
                    .resizable()
                    .renderingMode(.original)
            )
    }
}

struct ThemedButton: View {
    let width: CGFloat
    let height: CGFloat
    let fontSize: CGFloat
    let text: String
    let action: () -> Void
    
    @ObservedObject var tts = TextToSpeech()
    @State var isPressed = false
    @State var isTTS = false
    
    var body: some View {
        Button(action: {
            if (isTTS) {
                tts.speakSomething(text: text, rate: 0.4, volume: 0.3)
            }
            action()
        }, label: {
            VStack(alignment: .center) {
                Text(text)
                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: fontSize))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 8, x: 0, y: 0)
            }
            .frame(width: max(200, width), height: max(50, height), alignment: .center)
        })
        .buttonStyle(ThemedButtonButtonStyle())
    }
    
    func voiced(_ yes: Bool = true) -> some View {
        var view = self
        view._isTTS = State(initialValue: yes)
        return view.id(UUID())
    }
}

struct ThemedButton_Previews: PreviewProvider {
    static var previews: some View {
        ThemedButton(
            width: 0, height: 0, fontSize: 24,
            text: "Hello World",
            action: {
                print("Pressed")
            }
        )
    }
}
