//
//  LeafView.swift
//  Foneta
//
//  Created by Evan Susanto on 22/06/22.
//

import SwiftUI

struct LeafView: View, Hashable {
    var imageName: String
//    var imageSize: CGFloat
//    var paddingSize: CGFloat
//    var paddingType: [PaddingType]
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 750, height: 750)
//            .padding(enumParserPaddingType(paddingTypes: paddingType),paddingSize)
    }
}
