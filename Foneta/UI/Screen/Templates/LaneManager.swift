//
//  LaneManager.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation
import SwiftUI

struct LaneItem {
    var id: String
    var body: AnyView
}

struct LaneWrapperView: View {
    var childView: AnyView
    
    var body: some View {
        ZStack {
            childView
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

class LaneManager {
    let lanes: [LaneItem]

    subscript(index: Int) -> LaneItem {
        return lanes[index]
    }
    subscript(id: String) -> LaneItem {
        let res = lanes.first(where: { $0.id == id })
        return res != nil ? res! : LaneItem(id: "0", body: AnyView(EmptyView()))
    }
    
    init(_ lanes: [LaneItem]) {
        self.lanes = lanes
    }
}
