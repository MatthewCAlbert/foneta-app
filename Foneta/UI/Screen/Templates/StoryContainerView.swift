//
//  StoryContainerView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 20/06/22.
//

import SwiftUI

enum StoryContainerType {
    case story
    case stage
}

// To wrap story and stage
struct StoryContainerView: View {
    let id: String
    let type: StoryContainerType
    var content: some View = EmptyView()
    
    var body: some View {
        GeometryReader { geo in
            content
        }
        .ignoresSafeArea()
    }
}

struct StoryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoryContainerView(
            id: "",
            type: .stage
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}
