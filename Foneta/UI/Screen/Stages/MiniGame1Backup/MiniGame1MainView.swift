////
////  MiniGame1MainView.swift
////  Foneta
////
////  Created by Rahmat Afriyanton on 22/06/22.
////
//
//import SwiftUI
//
//struct MiniGame1MainView: View {
//	@State private var countDownRemaining = 3
//	@State private var letters = [
//		Letter(letterName: "a"),
//		Letter(letterName: "b"),
//		Letter(letterName: "c"),
//		Letter(letterName: "d"),
//		Letter(letterName: "e"),
//		Letter(letterName: "f"),
//		Letter(letterName: "g"),
//		Letter(letterName: "h"),
//		Letter(letterName: "i"),
//		Letter(letterName: "j"),
//		Letter(letterName: "k"),
//		Letter(letterName: "l"),
//		Letter(letterName: "m"),
//		Letter(letterName: "n"),
//		Letter(letterName: "o"),
//		Letter(letterName: "p"),
//		Letter(letterName: "q"),
//		Letter(letterName: "r"),
//		Letter(letterName: "s"),
//		Letter(letterName: "t"),
//		Letter(letterName: "u"),
//		Letter(letterName: "v"),
//		Letter(letterName: "w"),
//		Letter(letterName: "x"),
//		Letter(letterName: "y"),
//		Letter(letterName: "z")
//	]
//	let countDown = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//	@State var displayedLetter: [DisplayedLetters] = []
//	@State var numberOfDisplayedLetter = 0
//	@State var lastDisplayedLetter = 0
//
//    var body: some View {
//		GeometryReader { geo in
//			ZStack {
//				Image("Screen5-Bg")
//					.resizable()
//					.scaledToFill()
//					.aspectRatio(contentMode: .fill)
//					.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
//			}
//
//			if (countDownRemaining >= -1) {
//				VStack {
//					HStack {
//						ForEach(displayedLetter, id: \.self) { dpLetter in
//							ZStack {
//								Text(dpLetter.letter.letterName)
//									.font(Font.custom(AppFont.openDyslexic.rawValue, size: 50))
//									.fontWeight(.bold)
//							}.onTapGesture {
//								print(dpLetter)
//								if (dpLetter.letter.letterName == letters[lastDisplayedLetter].letterName) {
//									letters[dpLetter.id].isFinded = true
//									displayedLetter.remove(at: 0)
//									numberOfDisplayedLetter = displayedLetter.count
//									lastDisplayedLetter += 1
//								}
//							}
//						}
//					}
//
////					BottomBoard(letters: letters)
//				}.multilineTextAlignment(.center)
//			} else {
//				CountDownView(countDownRemaining: countDownRemaining)
//			}
//			
//		}.onReceive(countDown) { time in
//			if countDownRemaining >= 0 {
//				countDownRemaining -= 1
//			}
//			manageDisplayedLetters()
//		}
//    }
//
//	func manageDisplayedLetters(){
//		if (numberOfDisplayedLetter <= 1) {
//			var i = 0;
//			for letter in letters {
//				if (!letter.isFinded && !letter.isDisplayed) {
//					displayedLetter.append( DisplayedLetters(id: i, letter: letter))
//					letters[i].isDisplayed = true
//					numberOfDisplayedLetter += 1
//					break
//				}
//				i += 1
//			}
//		}
//	}
//}
//
//struct DisplayedLetters:Hashable {
//	var id: Int
//	var letter: Letter
//}
//
//struct MiniGame1MainView_Previews: PreviewProvider {
//    static var previews: some View {
//		MiniGame1MainView()
//			.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
//
//
//
//
//
//
//
