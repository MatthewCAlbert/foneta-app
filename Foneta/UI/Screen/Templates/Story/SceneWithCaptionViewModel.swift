//
//  SceneWithCaptionViewModel.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 22/06/22.
//

import SwiftUI

class SceneWithCaptionViewModel: ObservableObject {
    init() {
    }
    
    func getCaptionBoxHeight(_ geo: GeometryProxy) -> CGFloat {
        return max(geo.size.height * 0.2, 100)
    }
}
