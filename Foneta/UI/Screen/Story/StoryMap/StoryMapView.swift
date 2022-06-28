//
//  StoryMapView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 29/06/22.
//

import SwiftUI

struct StoryMapView: View, MiniStoryView {
    var voiceoverPlayed: Bool = false
    let nextScreenId: String

    @State var showMap: [Bool] = [true, false, false, false, false]
    @State var mapOpacity: [Double] = [0, 0, 0, 0, 0]

    func animateMap(index: Int) {
        withAnimation(.easeIn(duration: 1)) {
            mapOpacity[index] += 1
        }
        withAnimation(.easeIn(duration: 1).delay(1)) {
            mapOpacity[index] -= 1
        }
        if ( index+1 < showMap.count ) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showMap[index+1] = true
            }
        }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                if (showMap[0]) {
                    Image("StoryMap-Bg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(mapOpacity[0])
                        .onAppear {
                            animateMap(index: 0)
                        }
                }
                if (showMap[1]) {
                    Image("StoryMap-Bg-2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(mapOpacity[1])
                        .onAppear {
                            animateMap(index: 1)
                        }
                }
                if (showMap[2]) {
                    Image("StoryMap-Bg-3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(mapOpacity[2])
                        .onAppear {
                            withAnimation(.easeIn(duration: 1)) {
                                mapOpacity[2] += 1
                            }
                        }
                }
                ZStack {
                    Image("Sumatra-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.1, height: geo.size.width * 0.1, alignment: .center)
                        .offset(x: geo.size.width * -0.35, y: geo.size.height * 0.05)
                    Image("Java-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.1, height: geo.size.width * 0.1, alignment: .center)
                        .offset(x: geo.size.width * -0.15, y: geo.size.height * 0.2)
                    Image("Borneo-Locked-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.05, height: geo.size.width * 0.05, alignment: .center)
                        .offset(x: geo.size.width * -0.21, y: geo.size.height * -0.05)
                    Image("Sulawesi-Locked-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.05, height: geo.size.width * 0.05, alignment: .center)
                        .offset(x: geo.size.width * 0.03, y: geo.size.height * -0.15)
                    Image("Maluku-Locked-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.05, height: geo.size.width * 0.05, alignment: .center)
                        .offset(x: geo.size.width * 0.15, y: geo.size.height * -0.15)
                    Image("NT-Locked-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.05, height: geo.size.width * 0.05, alignment: .center)
                        .offset(x: geo.size.width * 0.15, y: geo.size.height * 0.2)
                    Image("Papua-Locked-Icon")
                        .resizable()
                        .scaledToFill()
                        .opacity(mapOpacity[2])
                        .frame(width: geo.size.width * 0.05, height: geo.size.width * 0.05, alignment: .center)
                        .offset(x: geo.size.width * 0.37, y: geo.size.height * 0)
                }

                // MARK: Control Area
                HStack(spacing: 20) {
                    MuteButton(width: 100, height: 100)
                }
                .opacity(mapOpacity[2])
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: geo.size.width * 0.03))
                .frame(width: geo.size.width, height: geo.size.height, alignment: .topTrailing)
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
        .ignoresSafeArea()
    }
}

struct StoryMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoryMapView(nextScreenId: "0")
    }
}
