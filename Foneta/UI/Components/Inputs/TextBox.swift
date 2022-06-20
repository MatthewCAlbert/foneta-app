//
//  TextBox.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

struct TextBox: View {
    @Binding var value: String
    
    var body: some View {
        TextField(
            "",
            text: $value
        )
        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 32))
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        .border(.clear, width: 0)
        .foregroundColor(.black)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 0)
        )
    }
}

struct TextBox_Previews: PreviewProvider {
    @State static var value = "Example"
    
    static var previews: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen1-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                TextBox(value: $value)
                    .frame(width: 300)
            }
        }
        .ignoresSafeArea()
    }
}
