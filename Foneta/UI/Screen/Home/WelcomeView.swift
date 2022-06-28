//
//  WelcomeView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct WelcomeView: View {
    @State var charaOpacity: CGFloat = 0
    @State var charaOffsetY: CGFloat = 400

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen1-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                VStack(spacing: 10) {
                    Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 800, height: 300, alignment: .center)
                        .offset(y: -150)
                }
                ZStack {
                    Image("Screen1-animals")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 800, height: 200, alignment: .center)
                        .opacity(charaOpacity)
                        .offset(y: charaOffsetY)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                charaOpacity += 1
                                charaOffsetY -= 500
                            }
                        }
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
            }
        }
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
