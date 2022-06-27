//
//  Mini2View.swift
//  Foneta
//
//  Created by Evan Susanto on 24/06/22.
//

import SwiftUI

struct Mini2View: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("Screen8-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()
                VStack(spacing:0) {
                    Text("Ayam")
                       .font(Font.custom(AppFont.openDyslexic.rawValue, size: 100))
                       .foregroundColor(.black)
                    
                    
                    
                HStack {
                        Image("Ayam")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:300)
                    Spacer()
                        .frame(width: 100)
//                    print(CGPoint)
                    Text("A")
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 300))
                                                    .foregroundColor(.white)
                    Path { path in
                        path.move(to: CGPoint(x: 200, y: 100))
                        path.addLine(to: CGPoint(x: 100, y: 300))
                        path.addLine(to: CGPoint(x: 200, y: 100))
                        path.addLine(to: CGPoint(x: 300, y: 300))
                        
//                        path.addLine(to: CGPoint(x: 300, y: 300))
//                        path.addLine(to: CGPoint(x: 250, y: 250))
                        path.closeSubpath()
                    }
                    .stroke(.blue, lineWidth: 10)
                    
                    }
                    GestureDemo()
                }
//                GestureDemo()
            }

                }
    }
}

struct Mini2View_Previews: PreviewProvider {
    static var previews: some View {
        Mini2View()
    }
}
