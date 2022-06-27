//
//  WelcomeView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct WelcomeView: View {
    @State var charaOpacity: CGFloat = 0
    @State var charaOffsetY: CGFloat = 200

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
                        .frame(width: 800, height: 200, alignment: .center)
                    ZStack {
                        HStack(spacing: 0) {
                            Image("Badak-MouthOpened")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300, alignment: .center)
                                .rotationEffect(Angle.degrees(-10.0))
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 30))
                                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 0)
                            Image("Orangutan-MouthOpened")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 320, alignment: .center)
                                .rotationEffect(Angle.degrees(10.0))
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 0)
                        }
                        Image("Neta-MouthOpened")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300, alignment: .center)
                            .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 0)
                    }
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    .opacity(charaOpacity)
                    .offset(y: charaOffsetY)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.4)) {
                            charaOpacity += 1.0
                            charaOffsetY = 0
                        }
                    }
                }
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
