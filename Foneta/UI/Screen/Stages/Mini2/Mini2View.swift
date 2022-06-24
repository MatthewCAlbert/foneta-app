//
//  Mini2View.swift
//  Foneta
//
//  Created by Evan Susanto on 24/06/22.
//

import SwiftUI

struct Mini2View: View {
    var body: some View {
        ZStack {

            Image("Screen8-Bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {

                Text("Ayam")
//                    .padding(.all)
//                    .ignoresSafeArea()
                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: 100))
                    .foregroundColor(.black)
            HStack {
                    Image("Treasure-1")
                        .resizable()
                        .padding([.trailing],150)
                        .padding(.bottom,100)
//                        .frame(width: 500, height: 500)
                        .aspectRatio(contentMode: .fit)

                    Text("a")
//                        .padding(.all)
                    .padding([.trailing],100)
                    .padding(.bottom,100)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 500))
                        .foregroundColor(.white)

            }

        }

    }
}
}
struct Mini2View_Previews: PreviewProvider {
    static var previews: some View {
        Mini2View()
    }
}
