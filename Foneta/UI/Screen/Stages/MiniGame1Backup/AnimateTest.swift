//
//  AnimateTest.swift
//  Foneta
//
//  Created by Rahmat Afriyanton on 26/06/22.
//

import SwiftUI

struct AnimateTest: View {
	@State var y : CGFloat = 100
	@State var x : CGFloat = 100

    var body: some View {
		GeometryReader { geo in
			ZStack {
				Text("Hello, World!")
					.position(x: x, y: y)
					.onAppear() {
						Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
							withAnimation() {
								self.y = CGFloat.random(in: 0...geo.size.width)
								self.x = CGFloat.random(in: 0...geo.size.height)
							}
						}
					}
			}
			.frame(width: geo.size.width, height: geo.size.height * 0.8, alignment: .center)
		}

    }
}

struct AnimateTest_Previews: PreviewProvider {
    static var previews: some View {
        AnimateTest()
    }
}
