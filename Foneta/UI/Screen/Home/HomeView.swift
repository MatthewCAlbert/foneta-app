//
//  HomeView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model: HomeViewModel = HomeViewModel()
    @State var switchedToOnboard: Bool = false
    @State var switchedToStory: Bool = false
    @State var switchedToMainMenu: Bool = false
    
    var body: some View {
        ZStack {
            WelcomeView()
                .opacity(model.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        if ( model.skipNameAsk ) {
                            switchedToStory = true
                        } else {
                            switchedToOnboard = true
                        }
                    }
                }
            NavigationLink(destination: InputNameOnboardView(), isActive: $switchedToOnboard) {
                EmptyView()
            }
            NavigationLink(
                destination: LaneWrapperView(childView: mainStoryLane[model.lastLevelId].body),
                isActive: $switchedToStory) {
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
