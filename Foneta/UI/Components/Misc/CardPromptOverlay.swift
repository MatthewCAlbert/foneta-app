//
//  CardPromptOverlay.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct CardPromptOverlay: View {
    let width: CGFloat
    let imageName: String
    var nextAction: () -> Void = {}
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width * 1.5, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    ThemedButton(width: width, height: width * 0.25, fontSize: 24, text: "Siap!") {
                        nextAction()
                    }
                    .voiced()
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
