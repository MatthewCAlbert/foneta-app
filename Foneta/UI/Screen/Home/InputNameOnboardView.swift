//
//  InputNameOnboardView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct InputNameOnboardView: View {
    @State var value: String = UserData.shared.name ?? ""
    
    func startAdventure() {
        UserData.shared.name = value
    }
    
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
                    StrokeText(text: "Cerita petualangan anak", width: 3, color: .white)
                        .foregroundColor(.black)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 36).weight(.bold))
                    Text("Nama anak:")
                        .foregroundColor(.black)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 36))
                        .bold()
                    TextBox(value: $value)
                        .frame(width: 500)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    ThemedButton(
                        width: 280, height: 70, fontSize: 32,
                        text: "MULAI"
                    ) {
                        startAdventure()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct InputNameOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameOnboardView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
