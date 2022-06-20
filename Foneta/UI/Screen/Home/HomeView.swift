//
//  HomeView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    let model: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, World!").font(
                Font.custom(AppFont.openDyslexic.rawValue, size: 24)
            )
            ThemedButton(
                width: 0, height: 0, fontSize: 24,
                text: "Mulai",
                action: {
                    print("Pressed")
                }
            )
            .voiced()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
