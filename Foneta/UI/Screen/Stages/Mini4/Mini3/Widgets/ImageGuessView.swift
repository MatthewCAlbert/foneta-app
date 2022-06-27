//
//  ImageGuessView.swift
//  Foneta
//
//  Created by Evan Susanto on 24/06/22.
//

import SwiftUI

struct ImageGuessView: View {
    var imageName: String!
    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: 250, height: 250)
            .padding(.bottom,50)
            .overlay(
                VStack(spacing:0) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150 , height: 150)
                Text(imageName)
                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: 35))
                    .foregroundColor(.white)
                Spacer()
            })
    }
}

struct ImageGuessView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGuessView()
    }
}
