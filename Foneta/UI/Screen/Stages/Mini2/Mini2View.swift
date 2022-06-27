//
//  Mini2View.swift
//  Foneta
//
//  Created by Evan Susanto on 24/06/22.
//

import SwiftUI

struct Mini2View: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen8-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()
                VStack {
                    Text("Ayam")
                       .font(Font.custom(AppFont.openDyslexic.rawValue, size: 100))

                       .foregroundColor(.black)
                HStack {

                        Image("Ayam")
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                    Spacer()
                        .frame(width: 100)

                        Text("a")
                        .padding([.trailing],100)
                        .padding(.bottom,100)
                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 500))
                            .foregroundColor(.white)

                }
                }
            }
//        ZStack {
//            Image("Screen8-Bg")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .ignoresSafeArea()
//            VStack {
//                Text("Ayam")
//                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: 100))
//                    .foregroundColor(.black)
//
//                HStack {
//                        Image("Treasure-1")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
////                            .padding([.trailing],150)
////                            .padding(.bottom,100)
//                            .frame(width: 500, height: 500)
////                            .aspectRatio(contentMode: .fit)
//                    Spacer()
//                        .frame(width: 200)
//                        Text("a")
////                        .padding([.trailing],100)
//                        .padding(.bottom,100)
//                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 500))
//                            .foregroundColor(.white)
//
//                }
//            }
//        }
//        GestureDemo()
                }
    }
}

struct Mini2View_Previews: PreviewProvider {
    static var previews: some View {
        Mini2View()
    }
}
