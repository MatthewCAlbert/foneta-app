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
            .fill(Color(.cyan))
            .frame(width: 350, height: 350)
            .padding(.bottom,50)
            .overlay(
                VStack(spacing:0) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250 , height: 250)
                Text(imageName)
                    .font(Font.custom(AppFont.openDyslexic.rawValue, size: 60))
                    .foregroundColor(.white)
                Spacer()
                        .frame(height:30)
                        .padding(.bottom,30)
            })
    }
}

struct ImageGuessView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGuessView()
    }
}
