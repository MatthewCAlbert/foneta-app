//
//  Mini2View3.swift
//  Foneta
//
//  Created by Evan Susanto on 29/06/22.
//

import SwiftUI

struct Mini2View3: View {
    var finishGame: () -> Void = {}

    var body: some View {
        GeometryReader { geo in
            ZStack {

                Image("Screen8-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()
                VStack(spacing:0) {
                    Text("Cacing")
                       .font(Font.custom(AppFont.openDyslexic.rawValue, size: 100))
                       .foregroundColor(.black)

                HStack {
                        Image("Cacing")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:300)
                    Spacer()
                        .frame(width: 100)
                    RoundedRectangle(cornerRadius: 25)
                                      .fill(.white)
                                      .frame(width: 400, height: 400)
                                      .padding(.all,10)
                                      .overlay(ZStack {
                                          Home()
                                         })
                    }
                    Spacer()
                        .frame(height:20)
                    ThemedButton(width: 400, height: 100, fontSize: 40, text: "Check") {
                        finishGame()
                    }
                }
            }
        }
    }
}

struct Mini2View3_Previews: PreviewProvider {
    static var previews: some View {
        Mini2View3()
    }
}
