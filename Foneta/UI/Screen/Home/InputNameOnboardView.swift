//
//  InputNameOnboardView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct InputNameOnboardView: View {
    @State var value: String = UserData.shared.name ?? ""
    @State var nextSceneActive = false

    func startAdventure() {
        UserData.shared.name = value
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            nextSceneActive = true
        }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen1-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()
                VStack(spacing: 10) {
                    StrokeText(text: "Cerita petualangan anak", width: 3, color: .white)
                        .foregroundColor(.black)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 36).weight(.bold))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    Text("Nama anak:")
                        .foregroundColor(.black)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 36))
                        .bold()
                    TextBox(value: $value)
                        .frame(width: 500)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                    ThemedButton(
                        width: 280, height: 70, fontSize: 32,
                        text: "MULAI"
                    ) {
                        startAdventure()
                    }
                    .voiced()
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }.overlay(
                NavigationLink(destination: mainStoryLane[0].body, isActive: $nextSceneActive) { EmptyView() }
            )
        }
        .navigationBarHidden(true)
    }
}

struct InputNameOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameOnboardView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
