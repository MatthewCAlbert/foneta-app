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

//Image("Neta-Climbing-1")
//    .resizable()
//    .aspectRatio(contentMode: .fit)
//    .padding(.top,500)
//    .padding(.trailing,120)
//    .frame(width: 300),
//Image("Neta-Climbing-2")
//    .resizable()
//    .aspectRatio(contentMode: .fit)
//    .padding(.top,300)
//    .padding(.trailing,120)
//    .frame(width: 300),
//Image("Neta-Climbing-3")
//    .resizable()
//    .aspectRatio(contentMode: .fit)
//    .padding(.top,100)
//    .padding(.trailing,120)
//    .frame(width: 300),
//Image("Neta-Climbing-4")
//    .resizable()
//    .aspectRatio(contentMode: .fit)
//    .padding(.bottom,150)
//    .padding(.trailing,120)
//    .frame(width: 300),
