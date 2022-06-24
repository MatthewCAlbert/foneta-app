//
//  ContentView.swift
//  ProjectTest
//
//  Created by Evan Susanto on 20/06/22.
//
import SwiftUI

struct Mini4View: View {
    @State var guessLetter0: String="D"
    @State var guessLetter1: String="B"
    @State var guessLetter2: String="A"
    @State var guessLetter: String="D"
    func random()->Void{
        var randomNum=Int.random(in: 0..<3)
        guessLetter=randomString(length: 1)
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
//            return guessLetter1
        default:
            guessLetter2=guessLetter
            
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
        LeafView(imageName: "Leaves-4", imageSize: 100, paddingSize: 350, paddingType: [.bottom,.trailing]),
    ]

    func click(imageText:String) {
        if(imageText.prefix(1)==guessLetter) {
            print("True")
            guessLetter=randomString(length: 1)
            guessLetter1=randomString(length: 1)
            guessLetter2=randomString(length: 1)
            leafViewCollection.removeLast()
            random()
            }
         else {
            print("False")
            guessLetter=randomString(length: 1)
            guessLetter1=randomString(length: 1)
            guessLetter2=randomString(length: 1)
            random()
        }
    }
    

    var body: some View {
        
        let imageViewCollection=[
            "A":ImageMini4View(imageContent:mini4Asset["ayam"]!, onClick: { click(imageText: (mini4Asset["ayam"]?.name)!)}),
            "B":ImageMini4View(imageContent:mini4Asset["bola"]!, onClick: { click(imageText: (mini4Asset["bola"]?.name)!)}),
            "C":ImageMini4View(imageContent:mini4Asset["cacing"]!, onClick: { click(imageText: (mini4Asset["cacing"]?.name)!)}),
            "D":ImageMini4View(imageContent:mini4Asset["domba"]!, onClick: { click(imageText: (mini4Asset["domba"]?.name)!)}),
            "E":ImageMini4View(imageContent:mini4Asset["elang"]!, onClick: { click(imageText: (mini4Asset["elang"]?.name)!)}),
            "F":ImageMini4View(imageContent:mini4Asset["foto"]!, onClick: { click(imageText: (mini4Asset["foto"]?.name)!)}),
            "G":ImageMini4View(imageContent:mini4Asset["gajah"]!, onClick: { click(imageText: (mini4Asset["gajah"]?.name)!)}),
            "H":ImageMini4View(imageContent:mini4Asset["harimau"]!, onClick: { click(imageText: (mini4Asset["harimau"]?.name)!)}),
            "I":ImageMini4View(imageContent:mini4Asset["ikan"]!, onClick: { click(imageText: (mini4Asset["ikan"]?.name)!)}),
            "J":ImageMini4View(imageContent:mini4Asset["jerapah"]!, onClick: { click(imageText: (mini4Asset["jerapah"]?.name)!)}),
            "K":ImageMini4View(imageContent:mini4Asset["kucing"]!, onClick: { click(imageText: (mini4Asset["kucing"]?.name)!)}),
            "L":ImageMini4View(imageContent:mini4Asset["lemon"]!, onClick: { click(imageText: (mini4Asset["lemon"]?.name)!)}),
            "M":ImageMini4View(imageContent:mini4Asset["monyet"]!, onClick: { click(imageText: (mini4Asset["monyet"]?.name)!)}),
            "N":ImageMini4View(imageContent:mini4Asset["nyamuk"]!, onClick: { click(imageText: (mini4Asset["nyamuk"]?.name)!)}),
            "O":ImageMini4View(imageContent:mini4Asset["obat"]!, onClick: { click(imageText: (mini4Asset["obat"]?.name)!)}),
            "P":ImageMini4View(imageContent:mini4Asset["panda"]!, onClick: { click(imageText: (mini4Asset["panda"]?.name)!)}),
            "Q":ImageMini4View(imageContent:mini4Asset["quran"]!, onClick: { click(imageText: (mini4Asset["quran"]?.name)!)}),
            "R":ImageMini4View(imageContent:mini4Asset["rusa"]!, onClick: { click(imageText: (mini4Asset["rusa"]?.name)!)}),
            "S":ImageMini4View(imageContent:mini4Asset["sapi"]!, onClick: { click(imageText: (mini4Asset["sapi"]?.name)!)}),
            "T":ImageMini4View(imageContent:mini4Asset["tikus"]!, onClick: { click(imageText: (mini4Asset["tikus"]?.name)!)}),
            "U":ImageMini4View(imageContent:mini4Asset["udang"]!, onClick: { click(imageText: (mini4Asset["udang"]?.name)!)}),
            "V":ImageMini4View(imageContent:mini4Asset["vas"]!, onClick: { click(imageText: (mini4Asset["vas"]?.name)!)}),
            "W":ImageMini4View(imageContent:mini4Asset["wortel"]!, onClick: { click(imageText: (mini4Asset["wortel"]?.name)!)}),
            "X":ImageMini4View(imageContent:mini4Asset["xilofon"]!, onClick: { click(imageText: (mini4Asset["xilofon"]?.name)!)}),
            "Y":ImageMini4View(imageContent:mini4Asset["yoyo"]!, onClick: { click(imageText: (mini4Asset["yoyo"]?.name)!)}),
            "Z":ImageMini4View(imageContent:mini4Asset["zebra"]!, onClick: { click(imageText: (mini4Asset["zebra"]?.name)!)})
        ]
        
        ZStack {
            Image("Screen20-Bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
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
    }
    }
