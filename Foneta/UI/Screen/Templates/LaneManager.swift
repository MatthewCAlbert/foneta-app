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
    var body: LaneWrapperView
}

struct LaneWrapperView: View {
    var childView: AnyView
    
    var body: some View {
        ZStack {
            childView
        }
        .navigationBarBackButtonHidden(true)
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
        return res != nil ? res! : LaneItem(id: "0", body: LaneWrapperView(childView: AnyView(EmptyView())))
    }
    
    func indexOf(_ id: String) -> Int? {
        return lanes.firstIndex(where: { $0.id == id })
    }
    func prevIndexOf(_ id: String, offset: Int = 1) -> Int? {
        let prevIdx = self.indexOf(id)
        guard let prevIdx = prevIdx else {
            return nil
        }

        return prevIdx - offset < 0 ? nil : prevIdx - offset
    }
    
    init(_ lanes: [LaneItem]) {
        self.lanes = lanes
    }
}
