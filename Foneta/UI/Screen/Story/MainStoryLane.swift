//
//  MainStoryLane.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 21/06/22.
//

import Foundation
import SwiftUI

let mainStoryLane = LaneManager([
    // Mini 1
    LaneItem(
        id: "1",
        body: LaneWrapperView(childView: AnyView(MiniOneStoryView(page: 1, nextScreenId: "2")))
    ),
    LaneItem(
        id: "2",
        body: LaneWrapperView(childView: AnyView(MiniOneStoryView(page: 2, nextScreenId: "3")))
    ),
    LaneItem(
        id: "3",
        body: LaneWrapperView(childView: AnyView(MiniOneStoryView(page: 3, nextScreenId: "mini-1-end")))
    ),
    LaneItem(
        id: "mini-1-end",
        body: LaneWrapperView(childView: AnyView(MiniOneStoryView(page: 4, nextScreenId: "4")))
    ),

    // Mini 2
    LaneItem(
        id: "4",
        body: LaneWrapperView(childView: AnyView(MiniTwoStoryView(page: 1, nextScreenId: "5")))
    ),
    LaneItem(
        id: "5",
        body: LaneWrapperView(childView: AnyView(MiniTwoStoryView(page: 2, nextScreenId: "mini-2-end")))
    ),
    LaneItem(
        id: "mini-2-end",
        body: LaneWrapperView(childView: AnyView(MiniTwoStoryView(page: 3, nextScreenId: "6")))
    ),

    // Mini 3
    LaneItem(
        id: "6",
        body: LaneWrapperView(childView: AnyView(MiniThreeStoryView(page: 1, nextScreenId: "7")))
    ),
    LaneItem(
        id: "7",
        body: LaneWrapperView(childView: AnyView(MiniThreeStoryView(page: 2, nextScreenId: "8")))
    ),
    LaneItem(
        id: "8",
        body: LaneWrapperView(childView: AnyView(MiniThreeStoryView(page: 3, nextScreenId: "mini-3-game")))
    ),
    LaneItem(
        id: "mini-3-game",
        body: LaneWrapperView(childView: AnyView(Mini3View(nextScreenId: "mini-3-end")))
    ),
    LaneItem(
        id: "mini-3-end",
        body: LaneWrapperView(childView: AnyView(MiniThreeStoryView(page: 4, nextScreenId: "9")))
    ),

    // Mini 4
    LaneItem(
        id: "9",
        body: LaneWrapperView(childView: AnyView(MiniFourStoryView(page: 1, nextScreenId: "10")))
    ),
    LaneItem(
        id: "10",
        body: LaneWrapperView(childView: AnyView(MiniFourStoryView(page: 2, nextScreenId: "11")))
    ),
    LaneItem(
        id: "11",
        body: LaneWrapperView(childView: AnyView(MiniFourStoryView(page: 3, nextScreenId: "mini-4-game")))
    ),
    LaneItem(
        id: "mini-4-game",
        body: LaneWrapperView(childView: AnyView(Mini4View(nextScreenId: "mini-4-end")))
    ),
    LaneItem(
        id: "mini-4-end",
        body: LaneWrapperView(childView: AnyView(MiniFourStoryView(page: 4, nextScreenId: "0")))
    )
])
