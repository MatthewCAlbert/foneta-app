//
//  GestureDemo.swift
//  Foneta
//
//  Created by Evan Susanto on 23/06/22.
//

import SwiftUI

struct GestureDemo: View {
    @GestureState var locationState = CGPoint(x: 0, y: 0)
    @State var location = CGPoint(x: 0, y: 0)
    var body: some View {
        ZStack {
            Color.white
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(location)
                .gesture(DragGesture()
                            .onChanged {state in
                                location=state.location
                                print(location)
                            }.onEnded {_ in
                                withAnimation {
                                    print("last Position:")
                                    print(location)
                                }
                            }.updating($locationState) { currentState,pastLocation,transaction in
                                pastLocation=currentState.location; transaction.animation = .easeInOut
                            })

        }
    }
}

struct GestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        GestureDemo()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
