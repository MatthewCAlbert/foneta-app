//
//  ContentView.swift
//  ProjectTest
//
//  Created by Evan Susanto on 20/06/22.
//
import SwiftUI

class Data {
    init() {
        random = Int.random(in: 0..<10)
    }
    var random :Int
}

struct Mini4View: View {
//    @State var text=""
    @State var guessLetter=randomString(length: 1)
    
    @State var leafViewCollection:[LeafView]=[
        LeafView(imageName: "Leaves-1", imageSize: 350, paddingSize: 250, paddingType: [.trailing]),
        LeafView(imageName: "Leaves-2", imageSize: 350, paddingSize: 250, paddingType: [.leading]),
        LeafView(imageName: "Leaves-3", imageSize: 350, paddingSize: 250, paddingType: [.trailing,.top]),
        LeafView(imageName: "Leaves-4", imageSize: 350, paddingSize: 250, paddingType: [.leading,.top]),
        LeafView(imageName: "Leaves-1", imageSize: 500, paddingSize: 0, paddingType: []),
    ]
    
    func click(imageText:String)->Void{
        if(imageText.prefix(1)==guessLetter){
            print("True")
            leafViewCollection.removeLast()
//            text="Selamat Anda Benar"
            guessLetter=randomString(length: 1)
        }else{
            print("False")
//            text="Maaf Anda Salaah"
            guessLetter=randomString(length: 1)
        }
    }

    var body: some View {
        
        let imageViewCollection=[
            "A":ImageMini4View(imageContent:mini4Asset["ayam"]!, onClick:{ click(imageText: (mini4Asset["ayam"]?.name)!)}),
            "B":ImageMini4View(imageContent:mini4Asset["bola"]!, onClick:{ click(imageText: (mini4Asset["bola"]?.name)!)}),
            "C":ImageMini4View(imageContent:mini4Asset["cacing"]!, onClick:{ click(imageText: (mini4Asset["cacing"]?.name)!)}),
            "D":ImageMini4View(imageContent:mini4Asset["domba"]!, onClick:{ click(imageText: (mini4Asset["domba"]?.name)!)}),
            "E":ImageMini4View(imageContent:mini4Asset["elang"]!, onClick:{ click(imageText: (mini4Asset["elang"]?.name)!)}),
            "F":ImageMini4View(imageContent:mini4Asset["foto"]!, onClick:{ click(imageText: (mini4Asset["foto"]?.name)!)}),
            "G":ImageMini4View(imageContent:mini4Asset["gajah"]!, onClick:{ click(imageText: (mini4Asset["gajah"]?.name)!)}),
            "H":ImageMini4View(imageContent:mini4Asset["harimau"]!, onClick:{ click(imageText: (mini4Asset["harimau"]?.name)!)}),
            "I":ImageMini4View(imageContent:mini4Asset["ikan"]!, onClick:{ click(imageText: (mini4Asset["ikan"]?.name)!)}),
            "J":ImageMini4View(imageContent:mini4Asset["jerapah"]!, onClick:{ click(imageText: (mini4Asset["jerapah"]?.name)!)}),
            "K":ImageMini4View(imageContent:mini4Asset["kucing"]!, onClick:{ click(imageText: (mini4Asset["kucing"]?.name)!)}),
            "L":ImageMini4View(imageContent:mini4Asset["lemon"]!, onClick:{ click(imageText: (mini4Asset["lemon"]?.name)!)}),
            "M":ImageMini4View(imageContent:mini4Asset["monyet"]!, onClick:{ click(imageText: (mini4Asset["monyet"]?.name)!)}),
            "N":ImageMini4View(imageContent:mini4Asset["nyamuk"]!, onClick:{ click(imageText: (mini4Asset["nyamuk"]?.name)!)}),
            "O":ImageMini4View(imageContent:mini4Asset["obat"]!, onClick:{ click(imageText: (mini4Asset["obat"]?.name)!)}),
            "P":ImageMini4View(imageContent:mini4Asset["panda"]!, onClick:{ click(imageText: (mini4Asset["panda"]?.name)!)}),
            "Q":ImageMini4View(imageContent:mini4Asset["quran"]!, onClick:{ click(imageText: (mini4Asset["quran"]?.name)!)}),
            "R":ImageMini4View(imageContent:mini4Asset["rusa"]!, onClick:{ click(imageText: (mini4Asset["rusa"]?.name)!)}),
            "S":ImageMini4View(imageContent:mini4Asset["sapi"]!, onClick:{ click(imageText: (mini4Asset["sapi"]?.name)!)}),
            "T":ImageMini4View(imageContent:mini4Asset["tikus"]!, onClick:{ click(imageText: (mini4Asset["tikus"]?.name)!)}),
            "U":ImageMini4View(imageContent:mini4Asset["udang"]!, onClick:{ click(imageText: (mini4Asset["udang"]?.name)!)}),
            "V":ImageMini4View(imageContent:mini4Asset["vas"]!, onClick:{ click(imageText: (mini4Asset["vas"]?.name)!)}),
            "W":ImageMini4View(imageContent:mini4Asset["wortel"]!, onClick:{ click(imageText: (mini4Asset["wortel"]?.name)!)}),
            "X":ImageMini4View(imageContent:mini4Asset["xilofon"]!, onClick:{ click(imageText: (mini4Asset["xilofon"]?.name)!)}),
            "Y":ImageMini4View(imageContent:mini4Asset["yoyo"]!, onClick:{ click(imageText: (mini4Asset["yoyo"]?.name)!)}),
            "Z":ImageMini4View(imageContent:mini4Asset["zebra"]!, onClick:{ click(imageText: (mini4Asset["zebra"]?.name)!)}),
        ]
        
            
        
        ZStack{
            Image("Screen20-Bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            HStack{
                ZStack{
                    Image("Treasure-1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ForEach((leafViewCollection), id: \.self) {leaf in
                        leaf
                    }
                }
                VStack{
                    Text(guessLetter)
                        .padding(.all)
                        .font(Font.custom(AppFont.openDyslexic.rawValue, size: 120))
                        .foregroundColor(.white)
                    HStack{
                        imageViewCollection[randomString(length: 1)]
                        imageViewCollection[guessLetter]
                        imageViewCollection[randomString(length: 1)]
                    }
                    HStack{
//                        Text(text)
//                            .foregroundColor(.black)
//                            .font(.system(size: 40))
//                            .background(.white)
//                            .cornerRadius(15)
//                            .padding(.all,50)
                       
                    }
                }
            }
        }
    }
    }

struct Mini4View_Previews: PreviewProvider {
    static var previews: some View {
        Mini4View()
    }
}

