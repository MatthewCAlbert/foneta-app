//
//  HomeView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model: HomeViewModel = HomeViewModel()
    @State var switched: Bool = false
    
    var body: some View {
        ZStack {
            WelcomeView()
                .opacity(model.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        switched = true
                    }
                }
            NavigationLink(destination: InputNameOnboardView(), isActive: $switched) {
                EmptyView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
