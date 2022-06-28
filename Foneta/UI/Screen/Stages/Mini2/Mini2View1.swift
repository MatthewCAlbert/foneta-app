//
//  Mini2View.swift
//  Foneta
//
//  Created by Evan Susanto on 24/06/22.
//

import SwiftUI
import PencilKit

struct Home: View {
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color: Color = Color.black
    var body: some View {
            DrawingView(canvas: $canvas)
        }
}

struct DrawingView: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    let ink = PKInkingTool(.pencil,color: .black)
    let erase = PKEraserTool(.bitmap)
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        return
    }
}

struct Mini2View1: View {
    @Binding var stageIndex: Int

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
                    RoundedRectangle(cornerRadius: 25)
                                      .fill(.white)
                                      .frame(width: 400, height: 400)
                                      .padding(.all,10)
                                      .overlay(ZStack {
                                          Home()
                                         })
                    }
                    Spacer()
                        .frame(height:20)
                    ThemedButton(width: 400, height: 100, fontSize: 40, text: "Check") {
                        stageIndex += 1
                    }
                }
            }
        }
    }
}

struct Mini2View1_Previews: PreviewProvider {
    static var previews: some View {
        Mini2View1(stageIndex: .constant(1))
    }
}
