//
//  NetaLocation.swift
//  Foneta
//
//  Created by Evan Susanto on 27/06/22.
//

import SwiftUI

struct NetaLocation: View, Hashable {
    var imageName: String
    var paddingSize: CGFloat
    var paddingSizeHorizontal: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.top,paddingSize)
            .padding(.trailing,paddingSizeHorizontal)
            .frame(width: 150)
    }
}
