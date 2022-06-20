//
//  HomeViewModel.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 08/06/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @State var opacity: CGFloat = 1.0
    
    func fadeOut() {
        withAnimation(.easeInOut(duration: 1.0)) {
            opacity -= 1.0
        }
    }
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.fadeOut()
        }
    }
}
