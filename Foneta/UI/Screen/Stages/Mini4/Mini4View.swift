//
//  Mini4View.swift
//  ProjectTest
//
//  Created by Evan Susanto on 20/06/22.
//

import SwiftUI

struct Mini4View: View {
    var nextScreenId: String?

    @State var nextSceneActive = false

    @State var guessLetter0: String = "D"
    @State var guessLetter1: String = "B"
    @State var guessLetter2: String = "A"
    @State var guessLetter: String = "D"

    func random() {
        let randomNum = Int.random(in: 0..<3)
        guessLetter = randomString(length: 1)
        switch randomNum {
        case 0:
            guessLetter0 = guessLetter
            var tempString1 = randomString(length: 1)
            while(guessLetter == tempString1) {
                tempString1 = randomString(length: 1)
            }
            guessLetter1 = tempString1

            var tempString2 = randomString(length: 1)
            while(guessLetter == tempString2 && tempString1 == tempString2) {
                tempString2 = randomString(length: 1)
            }
            guessLetter2 = tempString2

        case 1:
            guessLetter1 = guessLetter

            var tempString0 = randomString(length: 1)
            while(guessLetter == tempString0) {
                tempString0 = randomString(length: 1)
            }
            guessLetter0 = tempString0

            var tempString2 = randomString(length: 1)
            while(guessLetter == tempString2 && tempString0 == tempString2) {
                tempString2 = randomString(length: 1)
            }
            guessLetter2 = tempString2
        default:
            guessLetter2 = guessLetter

            var tempString0 = randomString(length: 1)
            while(guessLetter == tempString0) {
                tempString0 = randomString(length: 1)
            }
            guessLetter0 = tempString0

            var tempString1 = randomString(length: 1)
            while(guessLetter == tempString1 && tempString0 == tempString1) {
                tempString1 = randomString(length: 1)
            }
            guessLetter1 = tempString1

        }
    }

    @State var leafViewCollection:[LeafView]=[
        LeafView(imageName: "Leaves-1", imageSize: 350, paddingSize: 250, paddingType: [.trailing]),
        LeafView(imageName: "Leaves-2", imageSize: 350, paddingSize: 250, paddingType: [.leading]),
        LeafView(imageName: "Leaves-3", imageSize: 350, paddingSize: 250, paddingType: [.trailing,.top]),
        LeafView(imageName: "Leaves-4", imageSize: 350, paddingSize: 250, paddingType: [.leading,.top]),
        LeafView(imageName: "Leaves-1", imageSize: 500, paddingSize: 0, paddingType: []),
        LeafView(imageName: "Leaves-3", imageSize: 200, paddingSize: 300, paddingType: [.trailing,.bottom]),
        LeafView(imageName: "Leaves-2", imageSize: 400, paddingSize: 200, paddingType: [.top,.leading]),
        LeafView(imageName: "Leaves-1", imageSize: 200, paddingSize: 400, paddingType: [.leading,.bottom]),
        LeafView(imageName: "Leaves-3", imageSize: 100, paddingSize: 350, paddingType: [.bottom,.trailing]),
        LeafView(imageName: "Leaves-4", imageSize: 100, paddingSize: 350, paddingType: [.bottom,.trailing])
    ]

    func click(imageText:String) {
        if(imageText.prefix(1) == guessLetter) {
            print("True")
            guessLetter = randomString(length: 1)
            guessLetter1 = randomString(length: 1)
            guessLetter2 = randomString(length: 1)
            if ( !leafViewCollection.isEmpty ) {
                leafViewCollection.removeLast()
            } else {
                finishGame()
            }
            random()
        } else {
            print("False")
            guessLetter = randomString(length: 1)
            guessLetter1 = randomString(length: 1)
            guessLetter2 = randomString(length: 1)
            random()
        }
    }

    func finishGame() {
        nextSceneActive = true
    }

    var body: some View {
        let imageViewCollection: [String: Mini4ImageView] = [
            "A": Mini4ImageView(
                imageContent:mini4Asset["ayam"]!,
                onClick: { click(imageText: (mini4Asset["ayam"]?.name)!)}
            ),
            "B": Mini4ImageView(
                imageContent:mini4Asset["bola"]!,
                onClick: { click(imageText: (mini4Asset["bola"]?.name)!)}
            ),
            "C": Mini4ImageView(
                imageContent:mini4Asset["cacing"]!,
                onClick: { click(imageText: (mini4Asset["cacing"]?.name)!)}
            ),
            "D": Mini4ImageView(
                imageContent:mini4Asset["domba"]!,
                onClick: { click(imageText: (mini4Asset["domba"]?.name)!)}
            ),
            "E": Mini4ImageView(
                imageContent:mini4Asset["elang"]!,
                onClick: { click(imageText: (mini4Asset["elang"]?.name)!)}
            ),
            "F": Mini4ImageView(
                imageContent:mini4Asset["foto"]!,
                onClick: { click(imageText: (mini4Asset["foto"]?.name)!)}
            ),
            "G": Mini4ImageView(
                imageContent:mini4Asset["gajah"]!,
                onClick: { click(imageText: (mini4Asset["gajah"]?.name)!)}
            ),
            "H": Mini4ImageView(
                imageContent:mini4Asset["harimau"]!,
                onClick: { click(imageText: (mini4Asset["harimau"]?.name)!)}
            ),
            "I": Mini4ImageView(
                imageContent:mini4Asset["ikan"]!,
                onClick: { click(imageText: (mini4Asset["ikan"]?.name)!)}
            ),
            "J": Mini4ImageView(
                imageContent:mini4Asset["jerapah"]!,
                onClick: { click(imageText: (mini4Asset["jerapah"]?.name)!)}
            ),
            "K": Mini4ImageView(
                imageContent:mini4Asset["kucing"]!,
                onClick: { click(imageText: (mini4Asset["kucing"]?.name)!)}
            ),
            "L": Mini4ImageView(
                imageContent:mini4Asset["lemon"]!,
                onClick: { click(imageText: (mini4Asset["lemon"]?.name)!)}
            ),
            "M": Mini4ImageView(
                imageContent:mini4Asset["monyet"]!,
                onClick: { click(imageText: (mini4Asset["monyet"]?.name)!)}
            ),
            "N": Mini4ImageView(
                imageContent:mini4Asset["nyamuk"]!,
                onClick: { click(imageText: (mini4Asset["nyamuk"]?.name)!)}
            ),
            "O": Mini4ImageView(
                imageContent:mini4Asset["obat"]!,
                onClick: { click(imageText: (mini4Asset["obat"]?.name)!)}
            ),
            "P": Mini4ImageView(
                imageContent:mini4Asset["panda"]!,
                onClick: { click(imageText: (mini4Asset["panda"]?.name)!)}
            ),
            "Q": Mini4ImageView(
                imageContent:mini4Asset["quran"]!,
                onClick: { click(imageText: (mini4Asset["quran"]?.name)!)}
            ),
            "R": Mini4ImageView(
                imageContent:mini4Asset["rusa"]!,
                onClick: { click(imageText: (mini4Asset["rusa"]?.name)!)}
            ),
            "S": Mini4ImageView(
                imageContent:mini4Asset["sapi"]!,
                onClick: { click(imageText: (mini4Asset["sapi"]?.name)!)}
            ),
            "T": Mini4ImageView(
                imageContent:mini4Asset["tikus"]!,
                onClick: { click(imageText: (mini4Asset["tikus"]?.name)!)}
            ),
            "U": Mini4ImageView(
                imageContent:mini4Asset["udang"]!,
                onClick: { click(imageText: (mini4Asset["udang"]?.name)!)}
            ),
            "V": Mini4ImageView(
                imageContent:mini4Asset["vas"]!,
                onClick: { click(imageText: (mini4Asset["vas"]?.name)!)}
            ),
            "W": Mini4ImageView(
                imageContent:mini4Asset["wortel"]!,
                onClick: { click(imageText: (mini4Asset["wortel"]?.name)!)}
            ),
            "X": Mini4ImageView(
                imageContent:mini4Asset["xilofon"]!,
                onClick: { click(imageText: (mini4Asset["xilofon"]?.name)!)}
            ),
            "Y": Mini4ImageView(
                imageContent:mini4Asset["yoyo"]!,
                onClick: { click(imageText: (mini4Asset["yoyo"]?.name)!)}
            ),
            "Z": Mini4ImageView(
                imageContent:mini4Asset["zebra"]!,
                onClick: { click(imageText: (mini4Asset["zebra"]?.name)!)}
            )
        ]

        GeometryReader { geo in
            ZStack {
                Image("Screen20-Bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .ignoresSafeArea()

                HStack {
                    ZStack {
                        Image("Treasure-1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        ForEach((leafViewCollection), id: \.self) {leaf in
                            leaf
                        }
                    }
                    VStack {
                        Text(guessLetter)
                            .padding(.all)
                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 120))
                            .foregroundColor(.white)
                        HStack {
                            imageViewCollection[guessLetter0]
                            imageViewCollection[guessLetter1]
                            imageViewCollection[guessLetter2]
                        }
                    }
                }
            }
            if ( nextScreenId != nil ) {
                HStack {}
                .overlay(
                    NavigationLink(destination: mainStoryLane[nextScreenId!].body,
                                   isActive: $nextSceneActive) { EmptyView() }
                )
            }
        }
    }
}

struct Mini4View_Previews: PreviewProvider {
    static var previews: some View {
        Mini4View()
    }
}
