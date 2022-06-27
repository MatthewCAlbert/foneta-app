// Mini3View.swift
//  Foneta
//  Created by Evan Susanto on 24/06/22.

import SwiftUI
struct Mini3View: View {
    var nextScreenId: String?

    @State var nextSceneActive = false
    @State var indexNeta = 0
    @State var guessNumber0: Int = 1
    @State var guessNumber1: Int = 2
    @State var guessNumber2: Int = 3
    @State var guessNumber: Int = 1

    @State var netaLocationCollection:[NetaLocation]=[
        NetaLocation(imageName: "Neta-Climbing-1", paddingSize: 500, paddingSizeHorizontal: 50),
        NetaLocation(imageName: "Neta-Climbing-2", paddingSize: 400, paddingSizeHorizontal: 60),
        NetaLocation(imageName:"Neta-Climbing-3", paddingSize: 300, paddingSizeHorizontal: 65),
        NetaLocation(imageName: "Neta-Climbing-4", paddingSize: 200, paddingSizeHorizontal: 70),
        NetaLocation(imageName: "Neta-Climbing-1", paddingSize: 100, paddingSizeHorizontal: 70),
        NetaLocation(imageName: "Neta-Climbing-2", paddingSize: 0, paddingSizeHorizontal: 60),
        NetaLocation(imageName:"Neta-Climbing-3", paddingSize: -100, paddingSizeHorizontal: 50),
        NetaLocation(imageName: "Neta-Climbing-4", paddingSize: -200, paddingSizeHorizontal: 40)
    ]

    func finishGame() {
        nextSceneActive = true
    }

    func random() {
        let randomNum = Int.random(in: 0..<3)
        guessNumber = randomNumbers()
        switch randomNum {
        case 0:
            guessNumber0 = guessNumber
            var tempString1 = randomNumbers()
            while(guessNumber == tempString1) {
                tempString1 = randomNumbers()
            }
            guessNumber1 = tempString1
            var tempString2 = randomNumbers()
            while(guessNumber == tempString2 && tempString1 == tempString2) {
                tempString2 = randomNumbers()
            }
            guessNumber2 = tempString2

        case 1:
            guessNumber1 = guessNumber

            var tempString0 = randomNumbers()
            while(guessNumber == tempString0) {
                tempString0 = randomNumbers()
            }
            guessNumber0 = tempString0

            var tempString2 = randomNumbers()
            while(guessNumber == tempString2 && tempString0 == tempString2) {
                tempString2 = randomNumbers()
            }
            guessNumber2 = tempString2
        default:
            guessNumber2 = guessNumber

            var tempString0 = randomNumbers()
            while(guessNumber == tempString0) {
                tempString0 = randomNumbers()
            }
            guessNumber0 = tempString0

            var tempString1 = randomNumbers()
            while(guessNumber == tempString1 && tempString0 == tempString1) {
                tempString1 = randomNumbers()
            }
            guessNumber1 = tempString1
        }
    }

    let imageContentMini4Dictionary = [
        ImageContent(name: "Apel"),
        ImageContent(name: "Buku"),
        ImageContent(name: "Cabai"),
        ImageContent(name: "Domba"),
        ImageContent(name: "Es Krim"),
        ImageContent(name: "Fosil"),
        ImageContent(name: "Gergaji"),
        ImageContent(name: "Hiu"),
        ImageContent(name: "Istana"),
        ImageContent(name: "Jendela"),
        ImageContent(name: "Kambing"),
        ImageContent(name: "Lebah"),
        ImageContent(name: "Mobil"),
        ImageContent(name: "Nangka"),
        ImageContent(name: "Otak"),
        ImageContent(name: "Pisang"),
        ImageContent(name: "Quokka"),
        ImageContent(name: "Rambutan"),
        ImageContent(name: "Semangka"),
        ImageContent(name: "Topi"),
        ImageContent(name: "Ubi"),
        ImageContent(name: "Venus"),
        ImageContent(name: "Woll"),
        ImageContent(name: "Xerus"),
        ImageContent(name: "Yoghurt"),
        ImageContent(name: "Zebra")
    ]

    func click(imageText:String) {
        if(imageText==imageContentMini4Dictionary[guessNumber].name) {
            indexNeta += 1
            print(indexNeta)
            random()
            if ( indexNeta == netaLocationCollection.count-1 ) {
                print("Finish")
                finishGame()
            }
        } else {
            random()
            SoundManager.shared.playSound(SoundAssets.wrongSoundEffect)
            HapticManager.shared.impact(style: .medium)
        }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Screen14-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()
                HStack {
                        if ( indexNeta < netaLocationCollection.count ) {
                            netaLocationCollection[indexNeta]
                    }
                    Spacer()
                        .frame(width: 400)
                    
                    VStack{
                        ImageGuessView(imageName: imageContentMini4Dictionary[guessNumber].name)
                        HStack {
                                                   Mini3Card(text: imageContentMini4Dictionary[guessNumber0].name,
                                                             onClick: { click(
                                                               imageText: imageContentMini4Dictionary[guessNumber0].name!)})
                                                   Mini3Card(
                                                       text: imageContentMini4Dictionary[guessNumber1].name,
                                                             onClick: { click(
                                                               imageText: imageContentMini4Dictionary[guessNumber1].name!)})
                                               }
                        Mini3Card(
                                                        text: imageContentMini4Dictionary[guessNumber2].name,
                                                        onClick: { click(
                                                            imageText: imageContentMini4Dictionary[guessNumber2].name!)})
                    }
//                    VStack {
//                        ImageGuessView(imageName: imageContentMini4Dictionary[guessNumber].name)
//                        HStack {
//                            Mini3Card(text: imageContentMini4Dictionary[guessNumber0].name,
//                                      onClick: { click(
//                                        imageText: imageContentMini4Dictionary[guessNumber0].name!)})
//                            Mini3Card(
//                                text: imageContentMini4Dictionary[guessNumber1].name,
//                                      onClick: { click(
//                                        imageText: imageContentMini4Dictionary[guessNumber1].name!)})
//                        }
//
//                            Mini3Card(
//                                text: imageContentMini4Dictionary[guessNumber2].name,
//                                onClick: { click(
//                                    imageText: imageContentMini4Dictionary[guessNumber2].name!)})
//
//                        if ( indexNeta < netaLocationCollection.count ) {
//                            netaLocationCollection[indexNeta]
//                        }
//                    }
                }
            }
        }
        if (nextScreenId != nil ) {
            HStack {}
            .overlay(
                NavigationLink(destination: mainStoryLane[nextScreenId!].body,
                               isActive: $nextSceneActive) { EmptyView() }
            )
        }
    }
}

struct Mini3View_Previews: PreviewProvider {
    static var previews: some View {
        Mini3View()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
