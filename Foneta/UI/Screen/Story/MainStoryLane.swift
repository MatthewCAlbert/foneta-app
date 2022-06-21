//
//  MainStoryLane.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 21/06/22.
//

import Foundation
import SwiftUI

let mainStoryLane = LaneManager([
    LaneItem(
        id: "1",
        body: AnyView(ScreenTwoView(page: 0, nextScreenId: "2"))
    ),
    LaneItem(
        id: "2",
        body: AnyView(ScreenTwoView(page: 1, nextScreenId: "1"))
    ),

])
